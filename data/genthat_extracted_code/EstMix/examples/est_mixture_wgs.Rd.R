library(EstMix)


### Name: est_mixture_wgs
### Title: It is a function that takes the count data obtained from whole
###   genome sequencing (WGS) data and returns the estimated tumor and
###   normal proportions. Currently, the function can performs the
###   proportion estimations by assuming the number of tumor clones to be 1
###   or 2. The normalization step is not required and the normalization
###   constant will be returned by this function. The function will output
###   two sets of solutions corresponding to the top 2 optimal solutions
###   based on the posterior distribution. You can choose according to your
###   expertise the one that is more reasonable.
### Aliases: est_mixture_wgs

### ** Examples

exp_data = "data_exp_eg" ## exp_data.intervals should be the file name of the segments.
## For the format of the input files, you can use the example code below.
normal_snp = "snp_norm_eg" ## snp_norm_eg.txt should be the count file name for the normal sample.
tumor_snp = "snp_tum_eg" ## snp_tum_eg.txt should be the count file name for the tumor sample.
f_path = system.file("extdata",package="EstMix")
## f_path should be the absolute path of folder that contains the txt and interval files.
out_wgs = est_mixture_wgs(exp_data, normal_snp, tumor_snp,f_path,num_tumor = 1)
out_wgs$sol1_pct
out_wgs$sol1_scale

## for the format of the input files, please see the following code
data_exp_path = file.path(f_path, paste("/", exp_data, ".intervals", sep=""))
snp_norm_path = file.path(f_path, paste("/",normal_snp, ".txt", sep=""))
snp_tumor_path = file.path(f_path, paste("/",tumor_snp, ".txt", sep=""))
data_exp = read.table(data_exp_path);
colnames(data_exp) = c("ID","chrm","start","end","tumorCount","normalCount")
snp_norm = read.table(snp_norm_path)
snp_tum = read.table(snp_tumor_path)

## References: Quantification of multiple tumor clones using gene array and sequencing data.
## Y Cheng, JY Dai, TG Paulson, X Wang, X Li, BJ Reid, C Kooperberg.
## Annals of Applied Statistics 11 (2), 967-991



