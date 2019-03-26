library(DataVisualizations)


### Name: Crosstable
### Title: Crosstable plot
### Aliases: Crosstable
### Keywords: cross table plot table

### ** Examples

data(ITS)
data(MTY)
#simple but not a good transformation
Data=(cbind(ITS/max(ITS),MTY/max(MTY)))*100
#choice for bins could be better
Crosstable(Data)



