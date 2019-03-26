library(breakage)


### Name: err.breakage
### Title: Error function for estimated tip geometry
### Aliases: err.breakage

### ** Examples

# estimate breakage data for one geometry
brks <- 0.2 * 0:10
res <- resist.breakage(brks, theta=4*pi/180, r=0.05, rho=64)
dat <- list(x=brks, y=res)

# compare it to different geometry
err.breakage(c(2*pi/180, 0.1), dat, rho=64)
err.breakage(c(6*pi/180, 0.02), dat, rho=64)



