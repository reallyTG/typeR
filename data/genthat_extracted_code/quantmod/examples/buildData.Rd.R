library(quantmod)


### Name: buildData
### Title: Create Data Object for Modelling
### Aliases: buildData
### Keywords: datagen

### ** Examples

## Not run: 
##D   buildData(Next(OpCl(DIA)) ~ Lag(TBILL) + I(Lag(OpHi(DIA))^2))
##D   buildData(Next(OpCl(DIA)) ~ Lag(TBILL), na.rm=FALSE)
##D   buildData(Next(OpCl(DIA)) ~ Lag(TBILL), na.rm=FALSE, return.class="ts")
## End(Not run)



