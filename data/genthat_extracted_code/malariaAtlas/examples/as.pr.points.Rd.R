library(malariaAtlas)


### Name: as.pr.points
### Title: Convert data.frames to pr.points objects.
### Aliases: as.pr.points

### ** Examples

#Download PfPR data for Nigeria and Cameroon and map the locations of these points using autoplot
## No test: 
library(dplyr)
NGA_CMR_PR <- getPR(country = c("Nigeria", "Cameroon"), species = "Pf")

# Filter the data frame then readd pr.points class so that autoplot can be used.
NGA_CMR_PR %>% 
  filter(year_start > 2010) %>% 
  as.pr.points %>% 
  autoplot

## End(No test)



