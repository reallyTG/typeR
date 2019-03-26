library(PTXQC)


### Name: correctSetSize
### Title: Re-estimate a new set size to split a number of items into
###   equally sized sets.
### Aliases: correctSetSize

### ** Examples

 stopifnot(
   correctSetSize(8, 5) == 4
 )
 stopifnot(
   correctSetSize(101, 25) == 26
 )
 



