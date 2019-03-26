library(neurohcp)


### Name: download_hcp_file
### Title: Download HCP file
### Aliases: download_hcp_file download_fcp_file download_openneuro_file

### ** Examples

if (have_aws_key()){
path_to_file <- "HCP_900/100206/MNINonLinear/100206.164k_fs_LR.wb.spec"
download_hcp_file(path_to_file = path_to_file)
}



