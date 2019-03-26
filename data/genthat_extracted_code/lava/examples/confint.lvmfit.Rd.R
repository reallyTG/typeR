library(lava)


### Name: confint.lvmfit
### Title: Calculate confidence limits for parameters
### Aliases: confint.lvmfit confint.multigroupfit
### Keywords: models regression

### ** Examples


m <- lvm(y~x)
d <- sim(m,100)
e <- estimate(lvm(y~x), d)
confint(e,3,profile=TRUE)
confint(e,3)
## No test: 
 ## Reduce Ex.timings
B <- bootstrap(e,R=50)
B
## End(No test)



