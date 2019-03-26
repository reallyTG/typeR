library(Fragman)


### Name: saturate
### Title: Checking and correcting saturated peaks
### Aliases: saturate

### ** Examples

data(my.plants)
y <- my.plants[[1]][,3]
layout(matrix(1:2,2,1))
plot(y, type="l", xlim=c(2750,2850))
y2 <- saturate(y=y)
plot(y2, type="l", xlim=c(2750,2850))



