library(WordPools)


### Name: Paivio
### Title: Paivio, Yuille & Madigan Word Pool
### Aliases: Paivio
### Keywords: datasets

### ** Examples

data(Paivio)
summary(Paivio)
plot(Paivio[,c(3:5,9)])

# density plots

plotDensity(Paivio, "imagery")
plotDensity(Paivio, "concreteness")
plotDensity(Paivio, "meaningfulness")
plotDensity(Paivio, "frequency")
plotDensity(Paivio, "syl")
plotDensity(Paivio, "letters")
plotDensity(Paivio, "freerecall")



# find ranges & 5 num summaries
ranges <- as.data.frame(apply(Paivio[,-(1:2)], 2, function(x) range(na.omit(x))))
rownames(ranges) <- c("min", "max")
ranges

P5num <- as.data.frame(apply(Paivio[,3:5], 2, fivenum))
rownames(P5num) <- c("min", "Q1", "med", "Q3", "max")
P5num







