library(gsDesign)


### Name: gsDesign package overview
### Title: 1.0 Group Sequential Design
### Aliases: 'gsDesign package overview'
### Keywords: design

### ** Examples

# assume a fixed design (no interim) trial with the same endpoint
# requires 200 subjects for 90% power at alpha=.025, one-sided
x <- gsDesign(n.fix=200)
plot(x)



