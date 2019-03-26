library(metamisc)


### Name: plot.riley
### Title: Plot the summary of the bivariate model from Riley et al.
###   (2008).
### Aliases: plot.riley
### Keywords: forest

### ** Examples

data(Scheidler)

#Perform the analysis
fit <- riley(Scheidler[which(Scheidler$modality==1),])
plot(fit)

require(ggplot2)
plot(fit, sort="none", theme=theme_gray())




