library(linkim)


### Name: link.im
### Title: Linkage information based genotype imputation method
### Aliases: link.im
### Keywords: link.im

### ** Examples

data(barley)
dat <- barley[,-1]
r <- as.numeric(dat[1,])
data <- dat[-1,]
new.data <- link.im(data,r)




