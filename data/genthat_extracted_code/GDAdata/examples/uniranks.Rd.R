library(GDAdata)


### Name: uniranks
### Title: The Guardian University League Table 2013
### Aliases: uniranks
### Keywords: datasets

### ** Examples

data(uniranks, package="GDAdata")
with(uniranks, table(UniGroup))
library(ggplot2)
ggplot(uniranks, aes(x=NSSTeaching, y=NSSFeedback)) + geom_point()
ggplot(uniranks, aes(x=UniGroup, y=SpendPerStudent)) + geom_boxplot()



