library(WordPools)


### Name: CatProp
### Title: Joelson-Hermann Category Properties
### Aliases: CatProp
### Keywords: datasets

### ** Examples

data(CatProp)
summary(CatProp)
plot(CatProp[,3:10])

# try a biplot
CP <- CatProp
rownames(CP) <- CP$catname
biplot(prcomp(na.omit(CP[,3:12]), scale=TRUE))

# select some categories where the rated age of acquisition is between 2-4
cats <- pickList(CatProp, list(rageoaq=c(2,4)))
cats[,2:9]

# pick some fruit
pickList(subset(Battig, catname=="fruit"))



