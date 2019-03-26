library(REAT)


### Name: GoettingenHealth1
### Title: Healthcare providers in South Lower Saxony
### Aliases: GoettingenHealth1

### ** Examples

## Not run: 
##D data(GoettingenHealth1)
##D # general practitioners, psychotherapists and pharmacies
##D 
##D area_goe <- 1753000000
##D # area of Landkreis Goettingen (sqm)
##D area_nom <- 1267000000
##D # area of Landkreis Northeim (sqm)
##D area_gn <- area_goe+area_nom
##D sqrt(area_gn/pi)
##D 
##D # this takes some seconds
##D ripley(GoettingenHealth1[GoettingenHealth1$type == "phys_gen",], 
##D "location", "lat", "lon", area = area_gn, t.max = 30000, t.sep = 300)
##D 
##D ripley(GoettingenHealth1[GoettingenHealth1$type == "pharm",], 
##D "location", "lat", "lon", area = area_gn, t.max = 30000, t.sep = 300)
##D 
##D ripley(GoettingenHealth1[GoettingenHealth1$type == "psych",], 
##D "location", "lat", "lon", area = area_gn, t.max = 30000, t.sep = 300)
## End(Not run)



