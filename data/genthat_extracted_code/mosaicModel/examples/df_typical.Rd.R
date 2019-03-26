library(mosaicModel)


### Name: df_typical
### Title: Find typical levels of explanatory variables in a model/dataset.
### Aliases: df_typical

### ** Examples

## Not run: 
##D df_typical(mosaicData::Galton, nlevels = 2, father = 70, mother = 68, nkids = 3)
##D df_typical(mosaicData::Galton, nlevels = 2)
##D mod1 <- lm(wage ~ age * sex + sector, data = mosaicData::CPS85)
##D df_typical(model = mod1, nlevels = 3)
## End(Not run)



