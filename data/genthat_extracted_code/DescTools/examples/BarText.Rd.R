library(DescTools)


### Name: BarText
### Title: Add the Value Labels to a Barplot
### Aliases: BarText
### Keywords: aplot

### ** Examples

b <- barplot(VADeaths, horiz = FALSE, col=hblue, beside = TRUE)
BarText(VADeaths, b=b, horiz = FALSE, beside = TRUE, cex=0.8)
BarText(VADeaths, b=b, horiz = FALSE, beside = TRUE, cex=0.8, top=FALSE)

b <- barplot(VADeaths, horiz = TRUE, col=hblue, beside = TRUE)
BarText(VADeaths, b=b, horiz = TRUE, beside = TRUE, cex=0.8)

b <- barplot(VADeaths)
BarText(VADeaths, b=b)

b <- barplot(VADeaths, horiz = TRUE)
BarText(VADeaths, b=b, horiz = TRUE, col="red", cex=1.5)



