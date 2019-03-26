library(twl)


### Name: TWLsample
### Title: Main function to obtain posterior samples from a TWL model.
### Aliases: TWLsample

### ** Examples

data(data_and_output)
## Not run: 
##D clus_save <- TWLsample(misaligned_mat,misaligned,output_every=50,num_its=5000,manip=FALSE)
##D outpu_new <- pairwise_clus(clus_save,BURNIN=2000)
## End(Not run)
post_analy_cor(outpu_new,c("title1","title2","title3","title4","title5"),
tempfile(),ords='none') 
clus_labs <- post_analy_clus(outpu_new,clus_save,c(2:6),rep(0.6,5),c("title1","title2",
"title3","title4","title5"),tempfile())
output_nest <- cross_dat_analy(clus_save,4900)



