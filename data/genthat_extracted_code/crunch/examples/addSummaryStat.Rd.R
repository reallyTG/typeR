library(crunch)


### Name: addSummaryStat
### Title: Add summary statistics to a CrunchCube
### Aliases: addSummaryStat

### ** Examples

## Not run: 
##D pet_feelings
##D #                   animals
##D #feelings            cats dogs
##D #  extremely happy      9    5
##D #  somewhat happy      12   12
##D #  neutral             12    7
##D #  somewhat unhappy    10   10
##D #  extremely unhappy   11   12
##D 
##D # add a mean summary statistic to a CrunchCube
##D addSummaryStat(pet_feelings, stat = "mean", var = "feelings")
##D #                 animals
##D #feelings                      cats             dogs
##D #  extremely happy                9                5
##D #   somewhat happy               12               12
##D #          neutral               12                7
##D # somewhat unhappy               10               10
##D #extremely unhappy               11               12
##D #             mean 4.90740740740741 4.34782608695652
##D 
##D # we can also store the CrunchCube for use elsewhere
##D pet_feelings <- addSummaryStat(pet_feelings, stat = "mean", var = "feelings")
##D pet_feelings
##D #                 animals
##D #feelings                      cats             dogs
##D #  extremely happy                9                5
##D #   somewhat happy               12               12
##D #          neutral               12                7
##D # somewhat unhappy               10               10
##D #extremely unhappy               11               12
##D #             mean 4.90740740740741 4.34782608695652
##D 
##D # `addSummaryStat` returns a CrunchCube that has had the summary statistic
##D # added to it, so that you can still use the Crunch logic for multiple
##D # response variables, missingness, etc.
##D class(pet_feelings)
##D #[1] "CrunchCube"
##D #attr(,"package")
##D #[1] "crunch"
##D 
##D # Since `pet_feelings` is a CrunchCube, although it has similar properties
##D # and behaviors to arrays, it is not a R array:
##D is.array(pet_feelings)
##D #[1] FALSE
##D 
##D # cleanup transforms
##D transforms(pet_feelings) <- NULL
##D # add a median summary statistic to a CrunchCube
##D pet_feelings <- addSummaryStat(pet_feelings, stat = "median", var = "feelings")
##D pet_feelings
##D #                 animals
##D #feelings             cats    dogs
##D #  extremely happy       9       5
##D #   somewhat happy      12      12
##D #          neutral      12       7
##D # somewhat unhappy      10      10
##D #extremely unhappy      11      12
##D #           median       5       5
##D 
##D # additionally, if you want a true matrix object from the CrunchCube, rather
##D # than the CrunchCube object itself, `applyTransforms()` will return the
##D # array with the summary statistics (just like subtotals and headings)
##D pet_feelings_array <- applyTransforms(pet_feelings)
##D pet_feelings_array
##D #                 animals
##D #feelings             cats    dogs
##D #  extremely happy       9       5
##D #   somewhat happy      12      12
##D #          neutral      12       7
##D # somewhat unhappy      10      10
##D #extremely unhappy      11      12
##D #           median       5       5
##D 
##D # and we can see that this is an array and no longer a CrunchCube
##D is.array(pet_feelings_array)
##D #[1] TRUE
## End(Not run)




