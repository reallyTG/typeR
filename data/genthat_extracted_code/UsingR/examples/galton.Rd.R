library(UsingR)


### Name: galton
### Title: Galton's height data for parents and children
### Aliases: galton
### Keywords: datasets

### ** Examples

data(galton)
plot(galton)
## or with some jitter.
plot(jitter(child,5) ~ jitter(parent,5),galton)
## sunflowerplot shows flowers for multiple plots (Thanks MM)
sunflowerplot(galton)



