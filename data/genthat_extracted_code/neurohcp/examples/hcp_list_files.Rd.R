library(neurohcp)


### Name: hcp_list_files
### Title: List files from HCP bucket
### Aliases: hcp_list_files fcp_list_files openneuro_list_files
###   hcp_list_dirs fcp_list_dirs openneuro_list_dirs

### ** Examples

if (have_aws_key()){
x = hcp_list_files(prefix = "HCP/100307/unprocessed/3T/Diffusion",
   delimiter="bval")
t1_niis = hcp_list_files(prefix ="HCP/100307/T1w",
delimiter = ".nii.gz")
all_dirs = hcp_list_dirs("HCP/")
}

if (have_aws_key()){
 all_dirs = hcp_list_dirs("HCP/")
 cr =parse_list_files(all_dirs)$prefixes
}
## Not run: 
##D res = fcp_list_dirs()
##D projects = unlist(parse_list_files(res)$prefixes)
##D projects = unname(projects)
##D head(projects)
##D head(basename(projects))
## End(Not run)
res = openneuro_list_dirs()
projects = unlist(parse_list_files(res)$prefixes)
projects = unname(projects)
head(projects)
if (length(projects) > 0) {
head(basename(projects))
}



