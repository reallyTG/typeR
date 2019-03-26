library(lattice)


### Name: C_07_shingles
### Title: shingles
### Aliases: equal.count plot.shingle print.shingle
###   as.character.shingleLevel print.shingleLevel summary.shingle
###   as.data.frame.shingle as.factorOrShingle as.shingle [.shingle
###   is.shingle shingle
### Keywords: print hplot methods classes

### ** Examples

z <- equal.count(rnorm(50))
plot(z)
print(z)
print(levels(z))
## Don't show: 
data.frame(x = equal.count(rnorm(100)), y = rnorm(100))
## End(Don't show)



