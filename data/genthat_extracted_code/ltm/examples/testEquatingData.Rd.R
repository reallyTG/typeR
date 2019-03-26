library(ltm)


### Name: testEquatingData
### Title: Prepares Data for Test Equating
### Aliases: testEquatingData
### Keywords: multivariate

### ** Examples


# Let two data-sets with common and unique items
dat1 <- as.data.frame(rmvlogis(20, cbind(c(-2, 1, 2, 1), 1)))
names(dat1) <- c("CIt2", "CIt3", "CIt4", "W")

dat2 <- as.data.frame(rmvlogis(10, cbind(c(-2, -1, 1, 2, 0.95), 1)))
names(dat2) <- c("CIt1", "CIt2", "CIt3", "CIt4", "K")

# combine in one data-set by
lisForms <- list(dat1, dat2)
testEquatingData(lisForms)




