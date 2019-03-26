library(Momocs)


### Name: rm_uncomplete
### Title: Remove shapes with incomplete slices
### Aliases: rm_uncomplete

### ** Examples

# we load olea
data(olea)
# we select the var Aglan since it is the only one complete
ol <- filter(olea, var == "Aglan")
# everything seems fine
table(ol$view, ol$ind)
# indeed
rm_uncomplete(ol, id="ind", by="view")

# we mess the ol object by removing a single shape
ol.pb <- slice(ol, -1)
table(ol.pb$view, ol.pb$ind)
# the counterpart has been removed with a notice
ol.ok <- rm_uncomplete(ol.pb, "ind", "view")
# now you can combine them
table(ol.ok$view, ol.ok$ind)



