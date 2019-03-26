library(multimode)


### Name: stamps
### Title: Stamps thickness
### Aliases: stamps stamps1 stamps2 stampstable
### Keywords: datasets

### ** Examples

data("stamps")
# Histogram of Wilson (bin width 0.008)
seqx=seq(0.0585,0.1385,by=0.008)
hist(stamps,breaks=seqx)
# Histogram of Figure 1, Izenman and Sommer (bin width 0.002)
seqx=seq(0.0585,0.1385,by=0.002)
hist(stamps,breaks=seqx)

# Kernel density estimation of Izenman and Sommer (number of modes: 7)
locmodes(stamps,mod0=7,lowsup=0.04,uppsup=0.15,display=TRUE)
# Kernel density estimation of Ameijeiras-Alonso et al. (number of modes: 4)
locmodes(stamps,mod0=4,lowsup=0.04,uppsup=0.15,display=TRUE)




