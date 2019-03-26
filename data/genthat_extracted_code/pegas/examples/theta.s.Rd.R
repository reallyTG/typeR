library(pegas)


### Name: theta.s
### Title: Population Parameter THETA using Segregating Sites
### Aliases: theta.s theta.s.DNAbin theta.s.default
### Keywords: manip univar

### ** Examples

data(woodmouse)
theta.s(woodmouse)
theta.s(woodmouse, variance = TRUE)
## using the default:
s <- length(seg.sites(woodmouse))
n <- nrow(woodmouse)
theta.s(s, n)



