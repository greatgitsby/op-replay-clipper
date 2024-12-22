#!/bin/bash
#
# Clipper Argbash
#
# ARG_OPTIONAL_SINGLE([start-seconds],[s],[Seconds to start at],[60])
# ARG_OPTIONAL_SINGLE([length-seconds],[l],[Clip length],[30])
# ARG_OPTIONAL_SINGLE([target-mb],[m],[Target converted file size in MB],[50])
# ARG_OPTIONAL_SINGLE([format],[],[h264 or hevc],[hevc])
# ARG_OPTIONAL_SINGLE([jwt-token],[j],[JWT Auth token to use (get token from https://jwt.comma.ai)])
# ARG_OPTIONAL_SINGLE([smear-amount],[],[Amount of seconds to smear the clip start by before recording starts],[3])
# ARG_OPTIONAL_SINGLE([ntfysh],[n],[ntfy.sh topic to post to when clip has completed rendering])
# ARG_OPTIONAL_SINGLE([data-dir],[],[data dir to pass into replay for playback instead of having replay download])
# ARG_OPTIONAL_SINGLE([speedhack-ratio],[r],[speedhack ratio for stable, non-jittery rendering],[0.35])
# ARG_OPTIONAL_SINGLE([video-cwd],[c],[video working and output directory],[./shared])
# ARG_OPTIONAL_SINGLE([vnc],[],[VNC Port for debugging, -1 will disable],[0])
# ARG_OPTIONAL_SINGLE([output],[o],[output clip name],[clip.mp4])
# ARG_OPTIONAL_BOOLEAN([metric],[],[Use metric system in the ui],[off])
# ARG_OPTIONAL_BOOLEAN([hidden-dongle-id],[],[Hide dongle ID],[off])
# ARG_OPTIONAL_BOOLEAN([nv-hardware-rendering],[],[Use an available Nvidia GPU to render the openpilot GUI],[off])
# ARG_OPTIONAL_BOOLEAN([nv-hybrid-encoding],[],[Use an available Nvidia GPU to accelerate encoding of grabbed video],[off])
# ARG_OPTIONAL_BOOLEAN([nv-fast-encoding],[],[Use an available Nvidia GPU to accelerate encoding of grabbed video, then encode],[off])
# ARG_OPTIONAL_BOOLEAN([nv-direct-encoding],[],[Use an available Nvidia GPU to directly encode grabbed video. Supercedes fast encoding],[off])
# ARG_POSITIONAL_SINGLE([route_id],[comma connect route id, segment id is ignored (hint, put this in quotes otherwise your shell might misinterpret the pipe) ])
# ARG_HELP([See README at https://github.com/nelsonjchen/op-replay-clipper/])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='slmjnrcoh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_start_seconds="60"
_arg_length_seconds="30"
_arg_target_mb="50"
_arg_format="hevc"
_arg_jwt_token=
_arg_smear_amount="3"
_arg_ntfysh=
_arg_data_dir=
_arg_speedhack_ratio="0.35"
_arg_video_cwd="./shared"
_arg_vnc="0"
_arg_output="clip.mp4"
_arg_metric="off"
_arg_hidden_dongle_id="off"
_arg_nv_hardware_rendering="off"
_arg_nv_hybrid_encoding="off"
_arg_nv_fast_encoding="off"
_arg_nv_direct_encoding="off"


print_help()
{
	printf '%s\n' "See README at https://github.com/nelsonjchen/op-replay-clipper/"
	printf 'Usage: %s [-s|--start-seconds <arg>] [-l|--length-seconds <arg>] [-m|--target-mb <arg>] [--format <arg>] [-j|--jwt-token <arg>] [--smear-amount <arg>] [-n|--ntfysh <arg>] [--data-dir <arg>] [-r|--speedhack-ratio <arg>] [-c|--video-cwd <arg>] [--vnc <arg>] [-o|--output <arg>] [--(no-)metric] [--(no-)hidden-dongle-id] [--(no-)nv-hardware-rendering] [--(no-)nv-hybrid-encoding] [--(no-)nv-fast-encoding] [--(no-)nv-direct-encoding] [-h|--help] <route_id>\n' "$0"
	printf '\t%s\n' "<route_id>: comma connect route id, segment id is ignored (hint, put this in quotes otherwise your shell might misinterpret the pipe) "
	printf '\t%s\n' "-s, --start-seconds: Seconds to start at (default: '60')"
	printf '\t%s\n' "-l, --length-seconds: Clip length (default: '30')"
	printf '\t%s\n' "-m, --target-mb: Target converted file size in MB (default: '50')"
	printf '\t%s\n' "--format: h264 or hevc (default: 'hevc')"
	printf '\t%s\n' "-j, --jwt-token: JWT Auth token to use (get token from https://jwt.comma.ai) (no default)"
	printf '\t%s\n' "--smear-amount: Amount of seconds to smear the clip start by before recording starts (default: '3')"
	printf '\t%s\n' "-n, --ntfysh: ntfy.sh topic to post to when clip has completed rendering (no default)"
	printf '\t%s\n' "--data-dir: data dir to pass into replay for playback instead of having replay download (no default)"
	printf '\t%s\n' "-r, --speedhack-ratio: speedhack ratio for stable, non-jittery rendering (default: '0.35')"
	printf '\t%s\n' "-c, --video-cwd: video working and output directory (default: './shared')"
	printf '\t%s\n' "--vnc: VNC Port for debugging, -1 will disable (default: '0')"
	printf '\t%s\n' "-o, --output: output clip name (default: 'clip.mp4')"
	printf '\t%s\n' "--metric, --no-metric: Use metric system in the ui (off by default)"
	printf '\t%s\n' "--hidden-dongle-id, --no-hidden-dongle-id: Hide dongle ID (off by default)"
	printf '\t%s\n' "--nv-hardware-rendering, --no-nv-hardware-rendering: Use an available Nvidia GPU to render the openpilot GUI (off by default)"
	printf '\t%s\n' "--nv-hybrid-encoding, --no-nv-hybrid-encoding: Use an available Nvidia GPU to accelerate encoding of grabbed video (off by default)"
	printf '\t%s\n' "--nv-fast-encoding, --no-nv-fast-encoding: Use an available Nvidia GPU to accelerate encoding of grabbed video, then encode (off by default)"
	printf '\t%s\n' "--nv-direct-encoding, --no-nv-direct-encoding: Use an available Nvidia GPU to directly encode grabbed video. Supercedes fast encoding (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-s|--start-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_start_seconds="$2"
				shift
				;;
			--start-seconds=*)
				_arg_start_seconds="${_key##--start-seconds=}"
				;;
			-s*)
				_arg_start_seconds="${_key##-s}"
				;;
			-l|--length-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_length_seconds="$2"
				shift
				;;
			--length-seconds=*)
				_arg_length_seconds="${_key##--length-seconds=}"
				;;
			-l*)
				_arg_length_seconds="${_key##-l}"
				;;
			-m|--target-mb)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_target_mb="$2"
				shift
				;;
			--target-mb=*)
				_arg_target_mb="${_key##--target-mb=}"
				;;
			-m*)
				_arg_target_mb="${_key##-m}"
				;;
			--format)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_format="$2"
				shift
				;;
			--format=*)
				_arg_format="${_key##--format=}"
				;;
			-j|--jwt-token)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jwt_token="$2"
				shift
				;;
			--jwt-token=*)
				_arg_jwt_token="${_key##--jwt-token=}"
				;;
			-j*)
				_arg_jwt_token="${_key##-j}"
				;;
			--smear-amount)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_smear_amount="$2"
				shift
				;;
			--smear-amount=*)
				_arg_smear_amount="${_key##--smear-amount=}"
				;;
			-n|--ntfysh)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_ntfysh="$2"
				shift
				;;
			--ntfysh=*)
				_arg_ntfysh="${_key##--ntfysh=}"
				;;
			-n*)
				_arg_ntfysh="${_key##-n}"
				;;
			--data-dir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_data_dir="$2"
				shift
				;;
			--data-dir=*)
				_arg_data_dir="${_key##--data-dir=}"
				;;
			-r|--speedhack-ratio)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_speedhack_ratio="$2"
				shift
				;;
			--speedhack-ratio=*)
				_arg_speedhack_ratio="${_key##--speedhack-ratio=}"
				;;
			-r*)
				_arg_speedhack_ratio="${_key##-r}"
				;;
			-c|--video-cwd)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_video_cwd="$2"
				shift
				;;
			--video-cwd=*)
				_arg_video_cwd="${_key##--video-cwd=}"
				;;
			-c*)
				_arg_video_cwd="${_key##-c}"
				;;
			--vnc)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_vnc="$2"
				shift
				;;
			--vnc=*)
				_arg_vnc="${_key##--vnc=}"
				;;
			-o|--output)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_output="$2"
				shift
				;;
			--output=*)
				_arg_output="${_key##--output=}"
				;;
			-o*)
				_arg_output="${_key##-o}"
				;;
			--no-metric|--metric)
				_arg_metric="on"
				test "${1:0:5}" = "--no-" && _arg_metric="off"
				;;
			--no-hidden-dongle-id|--hidden-dongle-id)
				_arg_hidden_dongle_id="on"
				test "${1:0:5}" = "--no-" && _arg_hidden_dongle_id="off"
				;;
			--no-nv-hardware-rendering|--nv-hardware-rendering)
				_arg_nv_hardware_rendering="on"
				test "${1:0:5}" = "--no-" && _arg_nv_hardware_rendering="off"
				;;
			--no-nv-hybrid-encoding|--nv-hybrid-encoding)
				_arg_nv_hybrid_encoding="on"
				test "${1:0:5}" = "--no-" && _arg_nv_hybrid_encoding="off"
				;;
			--no-nv-fast-encoding|--nv-fast-encoding)
				_arg_nv_fast_encoding="on"
				test "${1:0:5}" = "--no-" && _arg_nv_fast_encoding="off"
				;;
			--no-nv-direct-encoding|--nv-direct-encoding)
				_arg_nv_direct_encoding="on"
				test "${1:0:5}" = "--no-" && _arg_nv_direct_encoding="off"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'route_id'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_route_id "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
# ] <-- needed because of Argbash


set -ex

# Echo `mount`
echo "$(mount)"

# Echo `env`
echo "$(env)"

# Echo where's this libcuda.so
echo "$(find /usr/ -name 'libcuda.so.*')" || true

# Echo nvidia-smi -q
echo "$(nvidia-smi -q)" || true

# Cleanup processes for easy fast testing.
# Rely on Docker to clean up containers processes in production though
function cleanup() {
    tmux list-panes -s -t clipper -F "#{pane_pid} #{pane_current_command}" \
    | grep -v tmux | awk '{print $1}' | xargs kill -9 || true
		# Kill any processes named "replay" or "ui", in case they're still running
		# somehow
		pkill -f "replay" || true
		pkill -f "ui" || true
		# Kill any tmux processes too
		pkill -f "tmux" || true
}

function ctrl_c() {
    cleanup
    pkill -P $$ || true
}
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
trap ctrl_c ERR

# # Cleanup stale stuff from last run
cleanup

STARTING_SEC=$_arg_start_seconds
# Sometimes it takes a bit of time for openpilot drawing to settle in.
SMEAR_AMOUNT=$_arg_smear_amount
SMEARED_STARTING_SEC=$(($STARTING_SEC - $SMEAR_AMOUNT))
# SMEARED_STARTING_SEC must be greater than 0
if [ $SMEARED_STARTING_SEC -lt 0 ]; then
		SMEARED_STARTING_SEC=0
fi
RECORDING_LENGTH=$_arg_length_seconds
RECORDING_LENGTH_PLUS_SMEAR=$(($RECORDING_LENGTH + $SMEAR_AMOUNT))
# Cleanup trailing segment count. Seconds is what matters
ROUTE=$(echo "$_arg_route_id" | sed -E 's/--[0-9]{1,4}$//g')
# Segment ID is the floor of the starting seconds divided by 60
SEGMENT_NUM=$(($STARTING_SEC / 60))
SEGMENT_ID="$ROUTE--$SEGMENT_NUM"
RENDER_METRIC_SYSTEM=$_arg_metric
NVIDIA_HARDWARE_RENDERING=$_arg_nv_hardware_rendering
NVIDIA_DIRECT_ENCODING=$_arg_nv_direct_encoding
NVIDIA_HYBRID_ENCODING=$_arg_nv_hybrid_encoding
NVIDIA_FAST_ENCODING=$_arg_nv_fast_encoding
JWT_AUTH=$_arg_jwt_token
VIDEO_CWD=$_arg_video_cwd
VIDEO_RAW_OUTPUT=clip_raw.mkv
VIDEO_OUTPUT=$_arg_output
# Target an appropiate bitrate of filesize of 8MB for the video length
TARGET_MB=$_arg_target_mb
TARGET_BYTES=$((($TARGET_MB) * 1024 * 1024))
TARGET_BITRATE=$(($TARGET_BYTES * 8 / $RECORDING_LENGTH))
TARGET_BITRATE_PLUS_SMEAR=$(($TARGET_BYTES * 8 / $RECORDING_LENGTH_PLUS_SMEAR))
VIDEO_FORMAT=$_arg_format
VNC_PORT=$_arg_vnc
# Data dir is used to pass in a pre-downloaded data dir to replay
DATA_DIR=$_arg_data_dir

# URL Encode Route
URL_ROUTE=$(echo "$ROUTE" | sed 's/|/%7C/g')

# Get route info
if [ -n "$JWT_AUTH" ]; then
	ROUTE_INFO=$(curl --fail -H "Authorization: JWT $JWT_AUTH" https://api.commadotai.com/v1/route/$URL_ROUTE/)
else
	ROUTE_INFO=$(curl --fail https://api.commadotai.com/v1/route/$URL_ROUTE/)
fi

# Check if format is valid
if [ "$VIDEO_FORMAT" != "h264" ] && [ "$VIDEO_FORMAT" != "hevc" ]; then
	echo "Invalid format $VIDEO_FORMAT. Must be h264 or hevc."
	exit 1
fi

ROUTE_INFO_GIT_REMOTE=$(echo "$ROUTE_INFO" | jq -r '.git_remote')
ROUTE_INFO_GIT_BRANCH=$(echo "$ROUTE_INFO" | jq -r '.git_branch')
ROUTE_INFO_GIT_COMMIT=$(echo "$ROUTE_INFO" | jq -r '.git_commit' | cut -c1-8)
ROUTE_INFO_GIT_DIRTY=$(echo "$ROUTE_INFO" | jq -r '.git_dirty')

# Get platform of route
ROUTE_INFO_PLATFORM=$(echo "$ROUTE_INFO" | jq -r '.platform')

# Get date since it's no longer inside the segment id
ROUTE_INFO_START_TIME=$(echo "$ROUTE_INFO" | jq -r '.start_time')

# Render speed
# RECORD_FRAMERATE = SPEEDHACK_AMOUNT * 20
SPEEDHACK_AMOUNT=$_arg_speedhack_ratio
RECORD_FRAMERATE=$(echo "($SPEEDHACK_AMOUNT * 20)/1" | bc)

pushd /home/batman/openpilot

if [ -n "$JWT_AUTH" ]; then
    mkdir -p "$HOME"/.comma/
    echo "{\"access_token\": \"$JWT_AUTH\"}" > "$HOME"/.comma/auth.json
fi

# Start processes
if [ "$NVIDIA_HARDWARE_RENDERING" = "on" ]; then
	# Does not work on WSL2
	GPU_BOARD=$(nvidia-smi --query-gpu=name --format=csv,noheader)
	GPU_PCI=$(nvidia-smi --query-gpu=pci.bus_id --format=csv,noheader | awk -F ':' '{printf("PCI:%d:%d:0", "0x"$2, "0x"$3)}')

	mkdir -p /etc/X11
cat <<EOT > /etc/X11/xorg.conf
Section "Files"
		ModulePath      "/usr/lib/xorg/modules"
		ModulePath      "/usr/local/nvidia"
EndSection

Section "Device"
		Identifier     "Device0"
		Driver         "nvidia"
		VendorName     "NVIDIA Corporation"
		BoardName      "$GPU_BOARD"
		BusID          "$GPU_PCI"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    Option         "DPMS"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Virtual     1920 1080
        Depth       24
				Modes       "1920x1080"
    EndSubSection
EndSection

EOT

	tmux new-session -d -s clipper -n x11 "Xorg -noreset +extension GLX +extension RANDR +extension RENDER -logfile /tmp/xserver.log -logverbose 0 vt1 $DISPLAY"
else
	# Non-accelerated UI rendering
	tmux new-session -d -s clipper -n x11 "Xtigervnc :0 -geometry 1920x1080 -SecurityTypes None -rfbport $VNC_PORT"
fi

if [ -n "$DATA_DIR" ]; then
	# If data dir is passed in, use it
	REPLAY_CMD="./tools/replay/replay --ecam --start \"$SMEARED_STARTING_SEC\" --data_dir \"$DATA_DIR\" \"$ROUTE\""
else
	# Otherwise, have replay download/decompress the route on demand
	REPLAY_CMD="./tools/replay/replay --ecam --start \"$SMEARED_STARTING_SEC\" \"$ROUTE\""
fi

tmux new-window -n replay -t clipper: "TERM=xterm-256color eatmydata faketime -m -f \"+0 x$SPEEDHACK_AMOUNT\" $REPLAY_CMD"
tmux new-window -n ui -t clipper: "cd ./selfdrive/ui && eatmydata faketime -m -f \"+0 x$SPEEDHACK_AMOUNT\" ./ui"

# If it's not a local replay with data dir, then we need to wait for the route to download
if [ -z "$DATA_DIR" ]; then
	# Pause replay and let it download the route
	tmux send-keys -t clipper:replay Space

	sleep 2
	# Wait until netstat shows less than 2 connections from ./tools/replay process
	while [ "$(netstat -tuplan | grep -E '443.*repl' | wc -l)" -gt 1 ]; do
			echo "Waiting for segments to download..."
			sleep 3
	done
fi

# Set back to smeared starting sec and immediately pause
tmux send-keys -t clipper:replay Enter "$SMEARED_STARTING_SEC" Enter
tmux send-keys -t clipper:replay Space
# Wait for settle
sleep 1
# Play the route
tmux send-keys -t clipper:replay Space
# Continue on with recording.

popd

# Construct Displayed Segment ID to $DISPLAYED_SEGMENT_ID
# If hidden dongle id is enabled, replace the characters before | with <Hidden>
if [ $_arg_hidden_dongle_id = "on" ]; then
		DISPLAYED_SEGMENT_ID=$(echo "$SEGMENT_ID" | sed -E 's/^[^|]*\|/<Hidden>|/g')
else
		DISPLAYED_SEGMENT_ID=$SEGMENT_ID
fi

# Generate and start overlay
CLIP_DESC="Segment ID: $DISPLAYED_SEGMENT_ID, Route Time: $ROUTE_INFO_START_TIME, Starting Second: $STARTING_SEC, Clip Length: $RECORDING_LENGTH, \
$ROUTE_INFO_GIT_REMOTE, $ROUTE_INFO_GIT_BRANCH, $ROUTE_INFO_GIT_COMMIT, Dirty: \
$ROUTE_INFO_GIT_DIRTY, $ROUTE_INFO_PLATFORM"
echo -n "$CLIP_DESC" > /tmp/overlay.txt

# Record with ffmpeg
mkdir -p "$VIDEO_CWD"
pushd "$VIDEO_CWD"

# Make parameters directory
mkdir -p ~/.comma/params/d/

# Use metric system in the ui
if [ "$RENDER_METRIC_SYSTEM" = "on" ]; then
	echo -n "1" > ~/.comma/params/d/IsMetric
else
	echo -n "0" > ~/.comma/params/d/IsMetric
fi

DRAW_TEXT_FILTER="drawtext=textfile=/tmp/overlay.txt:reload=1:fontcolor=white:fontsize=14:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=10"

BUFSIZE=$(($TARGET_BITRATE * 2))

# Set vcodec to hevc if format is hevc
VCODEC="h264_nvenc"
if [ "$VIDEO_FORMAT" = "hevc" ]; then
	VCODEC="hevc_nvenc"
fi

if [ "$NVIDIA_DIRECT_ENCODING" = "on" ]; then
	# Directly encode with nvidia hardware to the target file
	# Good for setups where the video renders fast.
	eatmydata ffmpeg -framerate "$RECORD_FRAMERATE" -video_size 1920x1080 -f x11grab -draw_mouse 0 -i :0.0 -ss "$SMEAR_AMOUNT" -vcodec $VCODEC -b:v "$TARGET_BITRATE" -maxrate "$TARGET_BITRATE" -bufsize "$BUFSIZE" -r 20 -filter:v "setpts=$SPEEDHACK_AMOUNT*PTS,scale=1920:1080,$DRAW_TEXT_FILTER" -y -t "$RECORDING_LENGTH" "$VIDEO_OUTPUT"
	cleanup
elif [ "$NVIDIA_HYBRID_ENCODING" = "on" ]; then
	# Directly encode with nvidia hardware to the target file with the smear amount also recorded.
	# Then lop it off with copy mode.
	eatmydata ffmpeg -framerate "$RECORD_FRAMERATE" -video_size 1920x1080 -f x11grab -draw_mouse 0 -i :0.0  -vcodec $VCODEC -b:v "$TARGET_BITRATE" -maxrate "$TARGET_BITRATE" -bufsize "$BUFSIZE" -g 20 -r 20 -filter:v "setpts=$SPEEDHACK_AMOUNT*PTS,scale=1920:1080,$DRAW_TEXT_FILTER" -y -t "$RECORDING_LENGTH_PLUS_SMEAR" "$VIDEO_RAW_OUTPUT"
	cleanup
	ffmpeg -y -ss "$SMEAR_AMOUNT" -i "$VIDEO_RAW_OUTPUT" -vcodec copy -movflags +faststart -f MP4 "$VIDEO_OUTPUT"
elif [ "$NVIDIA_FAST_ENCODING" = "on" ]; then
	# Directly save the full video, then reencode with acceleration /cut it so the smear amount is cut off the front.
	# For some reason, when Nvidia "direct" encoding is used, the first few frames stutter on CPU bound systems.
	ffmpeg -framerate "$RECORD_FRAMERATE" -video_size 1920x1080 -f x11grab -draw_mouse 0 -i :0.0  -vcodec libx264rgb -crf 0 -preset ultrafast -r 20 -filter:v "setpts=$SPEEDHACK_AMOUNT*PTS,scale=1920:1080,$DRAW_TEXT_FILTER" -y -t "$RECORDING_LENGTH_PLUS_SMEAR" "$VIDEO_RAW_OUTPUT"
	# The setup is no longer needed. Just transcode now.
	cleanup
	ffmpeg -hwaccel auto -i "$VIDEO_RAW_OUTPUT" -ss "$SMEAR_AMOUNT" -c:v $VCODEC -b:v "$TARGET_BITRATE" -y -pix_fmt yuv420p -movflags +faststart -f MP4 "$VIDEO_OUTPUT"
else
	# Complete CPU rendering
	ffmpeg -framerate "$RECORD_FRAMERATE" -video_size 1920x1080 -f x11grab -draw_mouse 0 -i :0.0  -vcodec libx264rgb -crf 0 -preset ultrafast -r 20 -filter:v "setpts=$SPEEDHACK_AMOUNT*PTS,scale=1920:1080,$DRAW_TEXT_FILTER" -y -t "$RECORDING_LENGTH_PLUS_SMEAR" "$VIDEO_RAW_OUTPUT"
	# The setup is no longer needed. Just transcode now.
	cleanup
	# Unused two pass, it's just excessive
	# ffmpeg -y -i "$VIDEO_RAW_OUTPUT" -c:v libx264 -b:v "$TARGET_BITRATE" -pix_fmt yuv420p -preset medium -pass 1 -an -f MP4 /dev/null
	# ffmpeg -y -i "$VIDEO_RAW_OUTPUT" -c:v libx264 -b:v "$TARGET_BITRATE" -pix_fmt yuv420p -preset medium -pass 2 -movflags +faststart -f MP4 "$VIDEO_OUTPUT"
	ffmpeg -y -i "$VIDEO_RAW_OUTPUT" -ss "$SMEAR_AMOUNT" -c:v libx264 -b:v "$TARGET_BITRATE" -pix_fmt yuv420p -preset medium -movflags +faststart -f MP4 "$VIDEO_OUTPUT"
fi

# If the codec is hevc, make sure to tag it as such so that it's compatible on Apple devices
if [ "$VIDEO_FORMAT" = "hevc" ]; then
	# Move the output to a temporary file
	mv "$VIDEO_OUTPUT" "$VIDEO_OUTPUT.tmp"
	ffmpeg -i "$VIDEO_OUTPUT.tmp" -c copy -movflags +faststart -f MP4 -vtag hvc1 "$VIDEO_OUTPUT"
	rm "$VIDEO_OUTPUT.tmp"
fi

ctrl_c

RENDER_COMPLETE_MESSAGE="Finished rendering $SEGMENT_ID to $VIDEO_OUTPUT."
# If _arg_ntfysh is defined, send a notification to a ntfy.sh topic
if [ ! -z "$_arg_ntfysh" ]; then
	curl -X POST -H "Title: Rendering Complete" -d "$RENDER_COMPLETE_MESSAGE" "https://ntfy.sh/$_arg_ntfysh"
fi
echo -e "$RENDER_COMPLETE_MESSAGE\n" "Please remember to include the segment ID if posting for comma to look at!\n" "\`$SEGMENT_ID\`"
