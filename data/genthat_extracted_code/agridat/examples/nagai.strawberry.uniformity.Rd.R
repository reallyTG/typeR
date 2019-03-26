library(agridat)


### Name: nagai.strawberry.uniformity
### Title: Uniformity trial of strawberry
### Aliases: nagai.strawberry.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(nagai.strawberry.uniformity)
##D   dat <- nagai.strawberry.uniformity
##D   
##D   # CV matches Nagai
##D   # with(dat, sd(yield)/mean(yield))
##D   # 23.42
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           flip=TRUE, aspect=(5.4)/(43.2), # true aspect
##D           main="nagai.strawberry.uniformity")
## End(Not run)



