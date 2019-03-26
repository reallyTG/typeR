library(gsDesign)


### Name: gsBoundCP
### Title: 2.5: Conditional Power at Interim Boundaries
### Aliases: gsBoundCP
### Keywords: design

### ** Examples

# set up a group sequential design
x <- gsDesign(k=5)
x

# compute conditional power based on interim treatment effects
gsBoundCP(x)

# compute conditional power based on original x$delta
gsBoundCP(x, theta=x$delta)



