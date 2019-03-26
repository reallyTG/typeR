library(astsa)


### Name: hor
### Title: Hawaiian occupancy rates
### Aliases: hor
### Keywords: datasets

### ** Examples

plot(hor, type='c')                            # plot data and
text(hor, labels=1:4, col=c(1,4,2,6), cex=.9)  # add quarter labels
#
plot(stl(hor, s.window=15))  # fit structural model



