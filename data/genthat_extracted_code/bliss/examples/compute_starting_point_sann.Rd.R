library(bliss)


### Name: compute_starting_point_sann
### Title: compute_starting_point_sann
### Aliases: compute_starting_point_sann

### ** Examples

data(res_bliss1)
mystart<-compute_starting_point_sann(apply(res_bliss1$beta_sample[[1]],2,mean))



