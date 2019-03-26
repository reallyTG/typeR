library(car)


### Name: Tapply
### Title: Apply a Function to a Variable Within Factor Levels
### Aliases: Tapply
### Keywords: misc manip

### ** Examples

Tapply(conformity ~ partner.status + fcategory, mean, data=Moore)
Tapply(conformity ~ partner.status + fcategory, mean, data=Moore, 
    trim=0.2)

Moore[1, 2] <- NA
Tapply(conformity ~ partner.status + fcategory, mean, data=Moore)
Tapply(conformity ~ partner.status + fcategory, mean, data=Moore, 
  na.rm=TRUE)
Tapply(conformity ~ partner.status + fcategory, mean, data=Moore, 
  na.action=na.omit)  # equivalent
remove("Moore")



