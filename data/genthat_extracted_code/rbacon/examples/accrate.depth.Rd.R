library(rbacon)


### Name: accrate.depth
### Title: Obtain estimated accumulation rates as for any depth of a core.
### Aliases: accrate.depth

### ** Examples

  Bacon(run=FALSE, coredir=tempfile()) 
  agedepth(yr.res=50, d.res=50, d.by=10)
  d20 <- accrate.depth(20)
  hist(d20)
  d20 <- accrate.depth(20, cmyr=TRUE) # to calculate accumulation rates in cm/yr
  mean(d20)



