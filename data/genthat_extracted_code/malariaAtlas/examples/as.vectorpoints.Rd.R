library(malariaAtlas)


### Name: as.vectorpoints
### Title: Convert data.frames to vector.points objects.
### Aliases: as.vectorpoints

### ** Examples

## No test: 
library(dplyr)
Brazil_vec <- getVecOcc(country = "Brazil")

# Filter data.frame then readd vector points class so autoplot can be used. 
Brazil_vec %>% 
  filter(sample_method1 == 'larval collection') %>% 
  as.vectorpoints %>% 
  autoplot
## End(No test)



