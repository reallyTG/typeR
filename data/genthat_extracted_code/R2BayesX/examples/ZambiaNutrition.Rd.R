library(R2BayesX)


### Name: ZambiaNutrition
### Title: Determinants of Childhood Malnutrition in Zambia
### Aliases: ZambiaNutrition zambia
### Keywords: datasets

### ** Examples

## Not run: 
##D ## load zambia data and map
##D data("ZambiaNutrition")
##D data("ZambiaBnd")
##D 
##D ## estimate model
##D zm <- bayesx(stunting ~ memployment + meducation + urban + gender + 
##D   sx(mbmi) + sx(agechild) + sx(district, bs = "mrf", map = ZambiaBnd) +
##D   sx(district, bs = "re"), iter = 12000, burnin = 2000, step = 10,
##D   data = ZambiaNutrition)
##D 
##D summary(zm)
##D 
##D ## plot smooth effects
##D plot(zm, term = c("sx(bmi)", "sx(agechild)", "sx(district)"), map = ZambiaBnd)
##D 
##D ## for more examples 
##D demo("zambia")
## End(Not run)



