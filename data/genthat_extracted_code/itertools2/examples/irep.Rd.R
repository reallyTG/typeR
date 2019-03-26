library(itertools2)


### Name: irep
### Title: Iterator that replicates elements of an iterable object
### Aliases: irep irep_len

### ** Examples

it <- irep(1:3, 2)
unlist(as.list(it)) == rep(1:3, 2)

it2 <- irep(1:3, each=2)
unlist(as.list(it2)) == rep(1:3, each=2)

it3 <- irep(1:3, each=2, length.out=4)
as.list(it3)



