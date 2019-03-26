library(rWBclimate)


### Name: kml_to_sp
### Title: Convert kml to polygon
### Aliases: kml_to_sp

### ** Examples

## Not run: 
##D sa_map <- create_map_df(locator=SoAm_country)
##D sa_dat <- get_ensemble_temp(SoAm_country,"annualanom",2080,2100)
##D sa_dat <- subset(sa_dat,sa_dat$scenario == "a2")
##D sa_dat <- subset(sa_dat,sa_dat$percentile == 50)
##D sa_poly <- kml_to_sp(sa_map,df = sa_dat)
##D ### colors are a bit off, but just to verify that data is
##D spplot(sa_poly,"data")
##D 
## End(Not run)



