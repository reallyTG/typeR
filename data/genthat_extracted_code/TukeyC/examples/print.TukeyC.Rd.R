library(TukeyC)


### Name: print.TukeyC
### Title: Print Method for 'TukeyC' objects.
### Aliases: print.TukeyC
### Keywords: package TukeyC

### ** Examples

data(RCBD) 

tk <- with(RCBD,
           TukeyC(y ~ blk + tra,
                  data=dfm,
                  which='tra'))
tk
 



