library(ramify)


### Name: tr
### Title: Trace of a Matrix
### Aliases: tr

### ** Examples

tr(ones(5, 10))
x <- replicate(1000, tr(rand(25, 25)))
hist(x)



