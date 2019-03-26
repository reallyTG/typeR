library(quantmod)


### Name: modelData
### Title: Extract Dataset Created by specifyModel
### Aliases: modelData
### Keywords: data utilities

### ** Examples

## Not run: 
##D m <- specifyModel(Next(OpCl(SPY)) ~ Cl(SPY) + OpHi(SPY) + Lag(Cl(SPY)))
##D modelData(m) 
## End(Not run)



