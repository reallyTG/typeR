library(MESS)


### Name: kwdata
### Title: Non-parametric Kruskal Wallis data example
### Aliases: kwdata
### Keywords: datasets

### ** Examples


data(kwdata)
newdata <- stack(kwdata)
kruskal.test(values ~ ind, newdata)




