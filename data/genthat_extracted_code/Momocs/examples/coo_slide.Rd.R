library(Momocs)


### Name: coo_slide
### Title: Slides coordinates
### Aliases: coo_slide

### ** Examples

stack(hearts)
# set the first landmark as the starting point
stack(coo_slide(hearts, ldk=1))
# set the 50th point as the starting point (everywhere)
stack(coo_slide(hearts, id=50))
# set the id-random-th point as the starting point (everywhere)
set.seed(123) # just for the reproducibility
id_random <- sample(x=min(sapply(hearts$coo, nrow)), size=length(hearts),
replace=TRUE)
stack(coo_slide(hearts, id=id_random))



