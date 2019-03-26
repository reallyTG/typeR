library(OpenMx)


### Name: mxGREMLDataHandler
### Title: Helper Function for Structuring GREML Data
### Aliases: mxGREMLDataHandler

### ** Examples

dat <- cbind(rnorm(100),rep(1,100))
colnames(dat) <- c("y","x")
dat[42,1] <- NA
dat[57,2] <- NA
dat2 <- mxGREMLDataHandler(data=dat, yvars="y", Xvars=list("x"),
  addOnes = FALSE)
str(dat2)



