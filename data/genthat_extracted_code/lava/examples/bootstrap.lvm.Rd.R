library(lava)


### Name: bootstrap.lvm
### Title: Calculate bootstrap estimates of a lvm object
### Aliases: bootstrap.lvm bootstrap.lvmfit
### Keywords: models regression

### ** Examples

m <- lvm(y~x)
d <- sim(m,100)
e <- estimate(lvm(y~x), data=d)
## No test: 
 ## Reduce Ex.Timings
B <- bootstrap(e,R=50,parallel=FALSE)
B
## End(No test)



