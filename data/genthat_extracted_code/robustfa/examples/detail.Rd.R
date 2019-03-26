library(robustfa)


### Name: detail
### Title: Show Details of an Object
### Aliases: detail
### Keywords: robust

### ** Examples

data(stock611)
detail(stock611)

facovRegOgk=FaCov(x=scale(stock611[,3:12]), factors=3, cov.control = CovControlOgk(), 
scoresMethod = "regression"); facovRegOgk
detail(facovRegOgk)




