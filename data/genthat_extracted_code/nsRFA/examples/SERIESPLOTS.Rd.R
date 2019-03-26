library(nsRFA)


### Name: SERIESPLOTS
### Title: Series plots
### Aliases: SERIESPLOTS serieplot consistencyplot
### Keywords: hplot

### ** Examples


data(hydroSIMN)
annualflows[c(1:10),]
x <- annualflows["dato"][,]
y <- annualflows["anno"][,]
cod <- annualflows["cod"][,]
consistencyplot(y,cod)


for (i in unique(cod)) {
 serieplot(x[cod==i], y[cod==i], c(0,max(x)), c(min(y),max(y)),
           xlab="", ylab="D [mm]", main=i)
 readline()
}



