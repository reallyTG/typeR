library(climdex.pcic)


### Name: select.blocks.gt.length
### Title: Select blocks of TRUE values of sufficient length.
### Aliases: select.blocks.gt.length
### Keywords: climate ts

### ** Examples


## Return only the first sequence of TRUE... second sequence will be FALSE.
foo <- select.blocks.gt.length(c(rep(TRUE, 4), FALSE, rep(TRUE, 3)), 3)




