library(rnpn)


### Name: npn_obsspbyday
### Title: Get observations by day for a particular species or set of
###   species.
### Aliases: npn_obsspbyday

### ** Examples

## Not run: 
##D out <- npn_obsspbyday(speciesid=357, startdate='2010-04-01', enddate='2012-01-05')
##D head(out[[1]])
##D 
##D # Lookup names
##D temp <- lookup_names(name='bird', type='common')
##D comnames <- temp[temp$species_id %in% c(357, 359, 1108), 'common_name']
##D 
##D out <- npn_obsspbyday(speciesid=c(357, 359, 1108), startdate='2010-04-01', enddate='2013-09-31')
##D names(out) <- comnames
##D library("plyr")
##D df <- ldply(out)
##D df$date <- as.Date(df$date)
##D 
##D library('ggplot2')
##D ggplot(df, aes(date, count)) +
##D  geom_line() +
##D  theme_grey(base_size=20) +
##D  facet_grid(.id ~.)
## End(Not run)



