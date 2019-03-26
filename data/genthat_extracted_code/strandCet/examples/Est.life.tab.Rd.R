library(strandCet)


### Name: Est.life.tab
### Title: Estimated life table.
### Aliases: Est.life.tab
### Keywords: Heligman-Pollard Siler life-table

### ** Examples


modSi <- Si.mod(data = cetaceans, rm = 2,
                par = c(0.3159462,  0.1860541, -1.2802880,  1.1733226,  0.0170314))

dataSi <- Si.pred(data = cetaceans, Sout = modSi, rm = 2)

Est.life.tab(Est.qx = dataSi$qx.tot, age = 0:29, n = 1000)




