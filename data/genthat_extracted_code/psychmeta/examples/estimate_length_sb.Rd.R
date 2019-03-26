library(psychmeta)


### Name: estimate_length_sb
### Title: Inverse Spearman-Brown formula to estimate the amount by which a
###   measure would have to be lengthened or shorted to achieve a desired
###   level of reliability
### Aliases: estimate_length_sb

### ** Examples

## Estimated k to achieve a reliability of .8 from a measure with an initial reliability of .7
estimate_length_sb(rel_initial = .7, rel_desired = .8)

## Estimated k to achieve a reliability of .8 from a measure with an initial reliability of .9
estimate_length_sb(rel_initial = .9, rel_desired = .8)



