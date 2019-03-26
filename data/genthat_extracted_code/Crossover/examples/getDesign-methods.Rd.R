library(Crossover)


### Name: getDesign
### Title: Extract Design from a CrossoverSearchResult
### Aliases: getDesign getDesign,CrossoverSearchResult-method
###   getDesign,character-method getDesign,matrix-method

### ** Examples


# n=c(100,10) is very small, but it's just an example and should not take much time
x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, n=c(100,10))
getDesign(x)

getDesign("williams4t")




