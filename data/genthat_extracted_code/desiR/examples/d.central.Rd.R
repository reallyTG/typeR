library(desiR)


### Name: d.central
### Title: Central values are desirable
### Aliases: d.central

### ** Examples

set.seed(1)
x <- rnorm(1000, mean=100, sd =5) # generate data
d <- d.central(x, cut1=90, cut2=95, cut3=105, cut4=110, scale=1)

# plot data
hist(x, breaks=30)
# add line
des.line(x, "d.central", des.args=c(cut1=90, cut2=95, cut3=105,
cut4=110, scale=1))

hist(x, breaks=30)
des.line(x, "d.central", des.args=c(cut1=90, cut2=95, cut3=105,
cut4=110, des.min=0.1, des.max=0.95, scale=1.5))

# target value
hist(x, breaks=30)
des.line(x, "d.central", des.args=c(cut1=90, cut2=99.9, cut3=100.1, cut4=110))



