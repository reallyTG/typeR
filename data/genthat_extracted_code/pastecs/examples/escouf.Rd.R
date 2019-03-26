library(pastecs)


### Name: escouf
### Title: Choose variables using the Escoufier's equivalent vectors method
### Aliases: escouf extract.escouf identify.escouf lines.escouf plot.escouf
###   print.escouf print.summary.escouf summary.escouf
### Keywords: multivariate

### ** Examples

data(marbio)
marbio.esc <- escouf(marbio)
summary(marbio.esc)
plot(marbio.esc)
# The x-axis has short labels. For more info., enter: 
marbio.esc$vr
# Define a level at which to extract most significant variables
marbio.esc$level <- 0.90
# Show it on the graph
lines(marbio.esc)
# This can also be done interactively on the plot using:
# marbio.esc$level <- identify(marbio.esc)
# Finally, extract most significant variables
marbio2 <- extract(marbio.esc)
names(marbio2)



