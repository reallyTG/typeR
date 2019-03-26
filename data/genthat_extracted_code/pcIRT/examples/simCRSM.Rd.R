library(pcIRT)


### Name: simCRSM
### Title: simulate data according to CRSM
### Aliases: simCRSM
### Keywords: continuous model rating scale simulation

### ** Examples


#set item parameters
item_p <- c(-1.5,-0.5,0.5,1)

#set dispersion parameter for items
dis_p <- 5

#generate person parameters by a standard normal dispersion
pp <- rnorm(50, 0,1)

#simulate data set
#this is only an illustrating example for simulating data!
#In practice, a sample size of n=50 will be too small for most application
#demands
simdatC <- simCRSM(item_p, dis_p, pp)





