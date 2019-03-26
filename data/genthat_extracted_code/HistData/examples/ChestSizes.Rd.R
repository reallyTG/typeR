library(HistData)


### Name: ChestSizes
### Title: Chest measurements of 5738 Scottish Militiamen
### Aliases: ChestSizes
### Keywords: datasets

### ** Examples

data(ChestSizes)
## maybe str(ChestSizes) ; plot(ChestSizes) ...

# frequency polygon
plot(ChestSizes, type='b')
#barplot
barplot(ChestSizes[,2], ylab="Frequency", xlab="Chest size")



