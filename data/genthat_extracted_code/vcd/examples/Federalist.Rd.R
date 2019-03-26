library(vcd)


### Name: Federalist
### Title: 'May' in Federalist Papers
### Aliases: Federalist
### Keywords: datasets

### ** Examples

data("Federalist")
gf <- goodfit(Federalist, type = "nbinomial")
summary(gf)
plot(gf)



