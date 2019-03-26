library(qtlcharts)


### Name: scat2scat
### Title: Scatterplot driving another scatterplot
### Aliases: scat2scat
### Keywords: hplot

### ** Examples

# simulate some data
p <- 500
n <- 300
SD <- runif(p, 1, 5)
r <- runif(p, -1, 1)
scat2 <- vector("list", p)
for(i in 1:p)
   scat2[[i]] <- matrix(rnorm(2*n), ncol=2) %*% chol(SD[i]^2*matrix(c(1, r[i], r[i], 1), ncol=2))
scat1 <- cbind(SD=SD, r=r)
# plot it
scat2scat(scat1, scat2)




