library(pointRes)


### Name: pointer.plot
### Title: Plot pointer years for multiple sites
### Aliases: pointer.plot

### ** Examples

## Plot negative pointer years for multiple sites from pointer.rgc output
data(s033)
site1 <- pointer.rgc(s033, nb.yrs = 4)
site2 <- pointer.rgc(s033, nb.yrs = 6)
sites <- list(site1, site2)
pointer.plot(sites, sign = "neg", start.yr = 1950, end.yr = NULL) 

## Plot pointer years for multiple sites from pointer.norm output (method "Neuwirth")
data(s033)
site1 <- pointer.norm(s033, window = 5, method.thresh = "Neuwirth")
site2 <- pointer.norm(s033, window = 11, method.thresh = "Neuwirth")
sites <- list(site1, site2)
site.names <- c("schneetal5", "schneetal11")
pointer.plot(sites, start.yr = 1950, end.yr = NULL, labels = site.names) 
           



