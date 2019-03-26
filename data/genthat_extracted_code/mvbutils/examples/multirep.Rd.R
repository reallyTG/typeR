library(mvbutils)


### Name: multirep
### Title: Replacement and insertion functions with more/less than 1
###   replacement per spot
### Aliases: multirep multinsert massrep
### Keywords: misc

### ** Examples

multirep( cq( the, cat, sat, on, the, mat), c( 2, 6),
    list( cq( big, bug), cq( elephant, howdah, cushion)))
# [1] "the" "big" "bug" "sat" "on" "the" "elephant" "howdah" "cushion"
multirep( cq( the, cat, sat, on, the, mat), c( 2, 6),
    list( cq( big, bug), character(0)))
# [1] "the" "big" "bug" "sat" "on" "the"
# NB the 0 in next example:
multinsert( cq( cat, sat, on, mat), c( 0, 4),
    list( cq( fat), cq( cleaning, equipment)))
# [1] "fat" "cat" "sat" "on" "mat" "cleaning" "equipment"



