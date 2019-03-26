library(MLID)


### Name: effect
### Title: Consider the effect of particular places upon the ID
### Aliases: effect

### ** Examples

## Not run: 
##D data(aggdata)
##D index <- id(aggdata, vars = c("Bangladeshi", "WhiteBrit"),
##D levels = c("MSOA","LAD","RGN"))
##D ci <- confint(index)
##D catplot(ci)
##D # Note Tower Hamlets and Newham. Obtain the predictions for them:
##D effect(index, "Tower Hamlets")
##D effect(index, "Newham")
##D effect(index, c("Tower Hamlets","Newham"))
## End(Not run)



