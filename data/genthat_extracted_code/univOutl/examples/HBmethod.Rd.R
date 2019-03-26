library(univOutl)


### Name: HBmethod
### Title: Hiroglou-Berthelot procedure for detecting outliers with
###   periodic data
### Aliases: HBmethod
### Keywords: univar survey

### ** Examples


set.seed(222)
x0 <- rnorm(30, 50, 5)
x0[1] <- NA
set.seed(333)
rr <- runif(30, 0.9, 1.2)
rr[10] <- 2
x1 <- x0 * rr
x1[20] <- 0

out <- HBmethod(yt1 = x0, yt2 = x1)
out$excluded
out$median.r
out$bounds.E
out$outliers
cbind(x0[out$outliers], x1[out$outliers])

out <- HBmethod(yt1 = x0, yt2 = x1,  
                return.dataframe = TRUE)
out$excluded
head(out$data)




