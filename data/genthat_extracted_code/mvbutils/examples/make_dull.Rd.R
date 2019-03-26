library(mvbutils)


### Name: make_dull
### Title: Hide dull columns in data frames
### Aliases: make_dull make.dull
### Keywords: misc

### ** Examples

# Becos more logical syntax:
rsample <- function (n = length(pop), pop, replace = FALSE, prob = NULL){
  pop[sample(seq_along(pop) - 1, size = n, replace = replace, prob = prob) + 1]
}
df <- data.frame( x=1:3,
    y=apply( matrix( rsample( 150, as.raw( 33:127), rep=TRUE), 50, 3), 2, rawToChar),
    stringsAsFactors=FALSE) # s.A.F. value shouldn't matter
df # zzzzzzzzzzzzzzz
df <- make_dull( df, 'y')
df # wow, exciting!
df$y # zzzzzzzzzzzzzz



