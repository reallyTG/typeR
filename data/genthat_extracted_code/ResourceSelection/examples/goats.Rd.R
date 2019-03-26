library(ResourceSelection)


### Name: goats
### Title: Mountain Goats Data Set
### Aliases: goats
### Keywords: datasets

### ** Examples

data(goats)
str(goats)
summary(goats)

## Not run: 
##D goats$exp.HLI <- exp(goats$HLI)
##D goats$sin.SLOPE <- sin(pi * goats$SLOPE / 180)
##D goats$ELEVATION <- scale(goats$ELEVATION)
##D goats$ET <- scale(goats$ET)
##D goats$TASP <- scale(goats$TASP)
##D m1 <- rspf(STATUS ~ TASP + sin.SLOPE + ELEVATION, goats, m=0, B = 99)
##D m2 <- rspf(STATUS ~ TASP + ELEVATION, goats, m=0, B = 99)
##D summary(m1)
##D summary(m2)
##D AIC(m1, m2)
##D plot(m1)
## End(Not run)



