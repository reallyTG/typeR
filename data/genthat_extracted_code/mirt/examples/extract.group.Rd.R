library(mirt)


### Name: extract.group
### Title: Extract a group from a multiple group mirt object
### Aliases: extract.group
### Keywords: extract

### ** Examples


## Not run: 
##D set.seed(12345)
##D a <- matrix(abs(rnorm(15,1,.3)), ncol=1)
##D d <- matrix(rnorm(15,0,.7),ncol=1)
##D itemtype <- rep('2PL', nrow(a))
##D N <- 1000
##D dataset1 <- simdata(a, d, N, itemtype)
##D dataset2 <- simdata(a, d, N, itemtype, mu = .1, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('D1', N), rep('D2', N))
##D models <- 'F1 = 1-15'
##D 
##D mod_configural <- multipleGroup(dat, models, group = group)
##D group.1 <- extract.group(mod_configural, 1) #extract first group
##D summary(group.1)
##D plot(group.1)
## End(Not run)



