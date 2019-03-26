library(tsdf)


### Name: opt.design
### Title: Zhong's 2-/3- stage Phase II design
### Aliases: opt.design

### ** Examples

 alpha1 <- 0.15
 alpha2 <- 0.10
 beta <- 0.15
 pc <- 0.25
 pt <- pc + 0.20
 # calculate optimal two-stage design without using alpha-spending
 opt.design(alpha1, alpha2, beta, pc, pt, stage=2)
 
 # calculate optimal two-stage design with Pocock-like spending function 
 opt.design(alpha1, alpha2, beta, pc, pt, stage = 2, sf.param = 1)
 
 # calculate optimal three-stage design with =O’Brien-Fleming like spending function
 opt.design(alpha1, alpha2, beta, pc, pt, stage = 3, sf.param = -4)



