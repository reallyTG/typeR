library(MInt)


### Name: estimate
### Title: Estimate parameters
### Aliases: estimate

### ** Examples

x <- system.file("extdata", "x.txt", package="MInt");
y <- system.file("extdata", "y.txt", package="MInt");
m <- mint(y,x,fmla = ~feature1 + feature2)
m <- estimate(m)



