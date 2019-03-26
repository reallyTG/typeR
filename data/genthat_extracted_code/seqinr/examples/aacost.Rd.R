library(seqinr)


### Name: aacost
### Title: Aerobic cost of amino-acids in Escherichia coli and G+C classes
### Aliases: aacost
### Keywords: datasets

### ** Examples

data(aacost)
levels(aacost$gc) <- c("low G+C", "mid G+C", "high G+C")
stripchart(aacost$tot~aacost$gc, pch = 19, ylim = c(0.5,3.5),
     xlim = c(0, max(aacost$tot)),
     xlab = "Metabolic cost (high-energy phosphate bonds equivalent)",
     main = "Metabolic cost of the 20 amino-acids\nas function of their G+C class" )
boxplot(aacost$tot~aacost$gc, horizontal = TRUE, add = TRUE)   



