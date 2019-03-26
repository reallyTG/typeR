library(sfsmisc)


### Name: tapplySimpl
### Title: More simplification in tapply() result
### Aliases: tapplySimpl
### Keywords: iteration category

### ** Examples

  ## Using tapply() would give a list (with dim() of a matrix);
  ## here we get 3-array:

  data(esoph)
  with(esoph, {
       mima <<- tapplySimpl(ncases/ncontrols, list(agegp, alcgp),  range)
       stopifnot(dim(mima) == c(2, nlevels(agegp), nlevels(alcgp)))
       })
  aperm(mima)



