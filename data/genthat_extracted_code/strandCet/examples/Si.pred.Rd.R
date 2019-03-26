library(strandCet)


### Name: Si.pred
### Title: Predict Siler model
### Aliases: Si.pred
### Keywords: Siler mortality

### ** Examples


modSi <- Si.mod(data = cetaceans, rm = 2,
                par = c(0.3159462,  0.1860541, -1.2802880,  1.1733226,  0.0170314))

Si.pred(data = cetaceans, Sout = modSi, rm = 2)




