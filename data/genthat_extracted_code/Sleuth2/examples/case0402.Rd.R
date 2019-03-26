library(Sleuth2)


### Name: case0402
### Title: Cognitive Load
### Aliases: case0402
### Keywords: datasets

### ** Examples

str(case0402)
stem(subset(case0402, Treatmt=="Conventional", Time, drop=TRUE))
stem(subset(case0402, Treatmt=="Modified", Time, drop=TRUE))
wilcox.test(Time ~ Treatmt, case0402)



