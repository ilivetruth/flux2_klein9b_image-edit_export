# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# NOTE: No registry-verified custom nodes were provided in the workflow.
# The workflow lists two custom nodes under unknown_registry but they have no aux_id (GitHub repo) so they cannot be automatically installed.
# Skipping unknown_registry node MarkdownNote - no aux_id provided; could not resolve.
# Skipping unknown_registry node MarkdownNote - no aux_id provided; could not resolve.

# download models into comfyui
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.2-klein-9b-kv-fp8/resolve/main/flux-2-klein-9b-kv-fp8.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b-kv-fp8.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein-9B/resolve/main/split_files/text_encoders/qwen_3_8b_fp8mixed.safetensors --relative-path models/clip --filename qwen_3_8b_fp8mixed.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
