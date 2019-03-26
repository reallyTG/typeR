library(neurohcp)


### Name: parse_list_files
### Title: Parse listed files from HCP bucket
### Aliases: parse_list_files

### ** Examples

if (have_aws_key()){
   ret = hcp_list_files(prefix = "HCP/100307/unprocessed/3T/Diffusion")
   parsed = parse_list_files(ret)
   stopifnot(!is.null(parsed$contents))
 }



