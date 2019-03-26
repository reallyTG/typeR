library(anchors)


### Name: anchors.order
### Title: Calculate frequency of vignette orderings
### Aliases: anchors.order anchors.order.calc
### Keywords: hplot

### ** Examples

data(mexchn)
z <- anchors.order( ~ xsay1 + xsay2 + xsay3 + xsay4 + xsay5, mexchn, ties  = "set")
summary(z,top=10,digits=3)
barplot(z)

z <- anchors.order( ~ xsay5 + xsay4 + xsay3 + xsay2 + xsay1, mexchn, ties  = "set")
summary(z,top=10,digits=3)

## other option
z <- anchors.order( ~ xsay5 + xsay4 + xsay3 + xsay2 + xsay1, mexchn, ties  = "nominal")
summary(z,top=10,digits=3)
barplot(z)





