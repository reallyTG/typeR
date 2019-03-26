library(aqp)


### Name: unroll
### Title: Unroll Genetic Horizons
### Aliases: unroll
### Keywords: manip

### ** Examples

data(sp1)

# subset a single soil profile:
sp1.1 <- subset(sp1, subset=id == 'P001')

# demonstrate how this function works
x <- with(sp1.1, unroll(top, bottom, prop, max_depth=50))
plot(x, 1:length(x), ylim=c(90,0), type='b', cex=0.5)	



