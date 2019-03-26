library(Momocs)


### Name: filter
### Title: Subset based on conditions
### Aliases: filter

### ** Examples

olea
# we retain on dorsal views
filter(olea, view=="VD")
# only dorsal views and Aglan+PicMa varieties
filter(olea, view=="VD", var %in% c("Aglan", "PicMa"))
# we create an id column and retain the 120 first shapes
olea %>% mutate(id=1:length(olea)) %>% filter(id > 120)



