library(robCompositions)


### Name: intArray
### Title: Interaction array
### Aliases: intArray

### ** Examples

data(precipitation) 
tab1prob <- prop.table(precipitation)
tab1 <- indTab(precipitation)
tabINT <- intTab(tab1prob, tab1)
intArray(tabINT)



