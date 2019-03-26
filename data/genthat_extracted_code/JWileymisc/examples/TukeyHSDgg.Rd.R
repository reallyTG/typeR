library(JWileymisc)


### Name: TukeyHSDgg
### Title: Tukey HSD Plot
### Aliases: TukeyHSDgg
### Keywords: plot

### ** Examples


## examples using it with single level data
## differences based on an ANOVA and follow up contrasts
TukeyHSDgg("cyl", "mpg", mtcars)

## Not run: 
##D TukeyHSDgg("Species", "Sepal.Length", iris)
##D 
##D ## example based on multilevel data
##D ## differences based on model fit with lmer and follow up contrasts
##D TukeyHSDgg("treatment", "decrease", OrchardSprays, idvar = "colpos")
## End(Not run)



