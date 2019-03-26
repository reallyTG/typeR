library(Momocs)


### Name: def_ldk_tips
### Title: Define tips as new landmarks
### Aliases: def_ldk_tips

### ** Examples

is_ldk(olea) # no ldk for olea
olea %>%
slice(1:3) %>% #for the sake of speed
def_ldk_tips %>%
def_ldk_angle(3*pi/4) %>% def_ldk_angle(pi/4) %T>% stack %>%
coo_slice(ldk=1:4) -> oleas
stack(oleas[[1]])
stack(oleas[[2]]) # etc.



