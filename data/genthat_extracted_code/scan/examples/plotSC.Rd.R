library(scan)


### Name: plotSC
### Title: Plot single-case data
### Aliases: plotSC

### ** Examples

## Request the default plot of the data from Borckhardt (2014)
plotSC(Borckardt2014)

## Plot the three cases from Grosche (2011) and visualize the phase A trend
plotSC(Grosche2011, fill = "tomato", lines = "trendA")

## Request the local regression line for Georg from that data set and customize the plot
plotSC(Grosche2011$Georg, fill = "grey", type = "n", ylim = c(0,NA),
       xlab = "Training session", ylab = "Words per minute",
       phase.names = c("Baseline", "Intervention"), 
       lines = list("loreg", lty = "solid", col = "black", lwd = 3))

## Plot a random MBD over three cases and mark interesting MTs
dat <- rSC(3)
plotSC(dat, marks = list(positions = list(c(2,4,5),c(1,2,3),c(7,8,9)), col = "blue",
       cex = 1.4),annotations = list(label = "values","col" = "red", cex = 0.75,
       offset = 1, round = 0))



