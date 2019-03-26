library(rnoaa)


### Name: ghcnd
### Title: Get all GHCND data from a single weather site
### Aliases: ghcnd

### ** Examples

## Not run: 
##D # Get data
##D ghcnd(stationid = "AGE00147704")
##D 
##D stations <- ghcnd_stations()
##D ghcnd(stations$id[40])
##D ghcnd(stations$id[4000])
##D ghcnd(stations$id[10000])
##D ghcnd(stations$id[80000])
##D ghcnd(stations$id[80300])
##D 
##D library("dplyr")
##D ghcnd(stations$id[80300]) %>% select(id, element) %>% slice(1:3)
##D 
##D # manipulate data
##D ## using built in fxns
##D dat <- ghcnd(stationid = "AGE00147704")
##D (alldat <- ghcnd_splitvars(dat))
##D library("ggplot2")
##D ggplot(subset(alldat$tmax, tmax >= 0), aes(date, tmax)) + geom_point()
##D 
##D ## using dplyr
##D library("dplyr")
##D dat <- ghcnd(stationid = "AGE00147704")
##D dat %>%
##D  filter(element == "PRCP", year == 1909)
## End(Not run)



