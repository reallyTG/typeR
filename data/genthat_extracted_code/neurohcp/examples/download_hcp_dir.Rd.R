library(neurohcp)


### Name: download_hcp_dir
### Title: Download an entire directory from HCP
### Aliases: download_hcp_dir download_fcp_dir download_openneuro_dir

### ** Examples

if (have_aws_key()) {
   prefix = "HCP/100307/release-notes"
   res = download_hcp_dir(prefix = prefix, verbose = FALSE)
}



