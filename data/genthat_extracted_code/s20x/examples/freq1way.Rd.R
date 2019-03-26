library(s20x)


### Name: freq1way
### Title: Analysis of 1-dimensional frequency tables
### Aliases: freq1way
### Keywords: htest

### ** Examples


##Body image data:
data(body.df)
eth.table = with(body.df, table(ethnicity))
freq1way(eth.table)
freq1way(eth.table,hypothprob=c(0.2,0.4,0.3,0.1))




