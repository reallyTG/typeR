library(SWMPrExtension)


### Name: assign_season
### Title: Assign seasons to SWMP sampling data
### Aliases: assign_season

### ** Examples

## Don't show: 
data(apacpwq)

seas <- assign_season(apacpwq$datetimestamp, abb = FALSE)
levels(seas)
## End(Don't show)

## Not run: 
##D data(elksmwq)
##D dat <- elksmwq
##D 
##D seas <- assign_season(dat$datetimestamp, abb = FALSE)
##D levels(seas)
##D 
##D seas <- assign_season(dat$datetimestamp, abb = TRUE)
##D levels(seas)
##D 
##D seas <- assign_season(dat$datetimestamp, season_start = 'Mar')
##D levels(seas)
##D 
##D seas <- assign_season(dat$datetimestamp, abb = FALSE, season_start = 'March')
##D levels(seas)
##D 
##D seas <- assign_season(dat$datetimestamp,
##D season_grps = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12)),
##D season_names = c('Winter', 'Spring', 'Summer', 'Fall'), season_start = 'Spring')
##D levels(seas)
##D 
##D seas <- assign_season(dat$datetimestamp, season_grps = list(c(10:12, 1:3), c(4:9)),
##D season_names = c('Wet', 'Dry'))
##D levels(seas)
## End(Not run)




