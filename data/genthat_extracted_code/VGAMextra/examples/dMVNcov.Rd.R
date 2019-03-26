library(VGAMextra)


### Name: dmultinorm
### Title: Density for the multivariate Normal distribution
### Aliases: dmultinorm

### ** Examples

###
### Two - dimensional Normal density.
###
set.seed(180228)
nn  <- 25
mean1 <- 1; mean2 <- 1.5; mean3 = 2
var1 <- exp(1.5); var2 <- exp(-1.5); var3 <- exp(1); cov12 = 0.75
dmvndata <- rbinorm(nn, mean1 = 1, mean2 = 1.5, var1 = var1, var2 = var2,
                    cov12 = cov12)

## Using dbinorm() from VGAM.
d2norm.data <- dbinorm(x1 = dmvndata[, 1], x2 = dmvndata[, 2],
                        mean1 = mean1, mean2 = mean2, var1 = var1, var2 = var2,
                        cov12 = cov12)
## Using dmultinorm().
d2norm.data2 <- dmultinorm(vec.x = dmvndata, vec.mean = c(mean1, mean2),
                        mat.cov = c(var1, var2, cov12))
summary(d2norm.data)
summary(d2norm.data2)
##
## 3--dimensional Normal.
##
dmvndata <- cbind(dmvndata, rnorm(nn, mean3, sqrt(var3)))

d2norm.data3 <- dmultinorm(dmvndata, vec.mean = c(mean1, mean2, mean3),
                       mat.cov = c(var1, var2, var3, cov12, 0, 0))

hist(d2norm.data3)
summary(d2norm.data3)




