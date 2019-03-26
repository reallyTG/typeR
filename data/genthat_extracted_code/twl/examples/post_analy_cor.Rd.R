library(twl)


### Name: post_analy_cor
### Title: Creates and saves correlation plots based on posterior
###   similarity matrices
### Aliases: post_analy_cor

### ** Examples

data(data_and_output)
## Not run: 
##D clus_save <- TWLsample(misaligned_mat,misaligned,output_every=50,num_its=5000,manip=FALSE)
##D outpu_new <- pairwise_clus(clus_save,BURNIN=2000)
##D post_analy_cor(outpu_new,c("title1","title2","title3","title4","title5"),
##D tempfile(),ords='none') 
##D clus_labs <- post_analy_clus(outpu_new,clus_save,c(2:6),rep(0.6,5),c("title1","title2",
##D "title3","title4","title5"),tempfile())
##D output_nest <- cross_dat_analy(clus_save,4750)
## End(Not run)



