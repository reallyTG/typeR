library(rnoaa)


### Name: seaice
### Title: Get sea ice data.
### Aliases: seaice

### ** Examples

## Not run: 
##D # Look at data.frame's for a series of years for Feb, South pole
##D urls <- sapply(seq(1979,1990,1), function(x) seaiceeurls(yr=x,
##D   mo='Feb', pole='S'))
##D out <- lapply(urls, seaice)
##D lapply(out, head)
##D 
##D # Map a single year/month/pole combo
##D urls <- seaiceeurls(mo='Apr', pole='N', yr=1990)
##D out <- seaice(urls)
##D library('ggplot2')
##D ggplot(out, aes(long, lat, group=group)) +
##D    geom_polygon(fill="steelblue") +
##D    theme_ice()
## End(Not run)



