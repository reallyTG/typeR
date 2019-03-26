library(baytrends)


### Name: filterWgts
### Title: Create filter weights
### Aliases: filterWgts
### Keywords: internal

### ** Examples

wgts<- filterWgts(0,"uniform")
wgts<- filterWgts(7,"uniform")
wgts<- filterWgts(7,"centered")
wgts<- filterWgts(7,"weighted")
x <- 1:100
filter(x, filterWgts(7,"weighted"), sides=1)



