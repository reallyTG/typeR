library(Hmisc)


### Name: smean.sd
### Title: Compute Summary Statistics on a Vector
### Aliases: smean.cl.normal smean.sd smean.sdl smean.cl.boot smedian.hilow
### Keywords: nonparametric htest

### ** Examples

set.seed(1)
x <- rnorm(100)
smean.sd(x)
smean.sdl(x)
smean.cl.normal(x)
smean.cl.boot(x)
smedian.hilow(x, conf.int=.5)  # 25th and 75th percentiles

# Function to compute 0.95 confidence interval for the difference in two means
# g is grouping variable
bootdif <- function(y, g) {
 g <- as.factor(g)
 a <- attr(smean.cl.boot(y[g==levels(g)[1]], B=2000, reps=TRUE),'reps')
 b <- attr(smean.cl.boot(y[g==levels(g)[2]], B=2000, reps=TRUE),'reps')
 meandif <- diff(tapply(y, g, mean, na.rm=TRUE))
 a.b <- quantile(b-a, c(.025,.975))
 res <- c(meandif, a.b)
 names(res) <- c('Mean Difference','.025','.975')
 res
}




