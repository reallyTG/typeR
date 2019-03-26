library(ridittools)


### Name: seritdiff
### Title: Compute standard error of difference between two mean ridits
### Aliases: seriditdiff

### ** Examples

seriditdiff(semiauto[ , "Ind"], semiauto[ , "Rep"])

## The function is currently defined as
function(g1, g2) {
  sqrt(sum(g1) + sum(g2)) / (2 * sqrt(3 * sum(g1) * sum(g2)))
}



