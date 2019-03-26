library(plumbr)


### Name: ItemSelection-class
### Title: The 'ItemSelection' class implements 'Selection' for the very
###   common case of selecting items in a dataset, optionally with weights.
### Aliases: class:ItemSelection ItemSelection-class ItemSelection
###   coerce,ItemSelection,vector-method as.vector,ItemSelection-method
###   coerce,ItemSelection,integer-method as.integer,ItemSelection-method
###   coerce,ItemSelection,numeric-method as.numeric,ItemSelection-method
###   coerce,ItemSelection,logical-method as.logical,ItemSelection-method
###   coerce,ItemSelection,factor-method as.factor,ItemSelection-method
###   which,ItemSelection-method

### ** Examples

  ## Assume we have a dataset:
  data(Cars93, package="MASS")
  mf <- mutaframe(Cars93)
  mf$.color <- "gray"
  ## First step is to create a base selection
  sel <- ItemSelection()
  ## Now, link that selection to other cases in same dataset by some variable
  linked_sel <- sel$link(match_any_linker(Cars93["Manufacturer"]))
  ## Finally, scale that linked selection to the data
  linked_sel$scale(function(x, d) {
    d[as.logical(x), ".color"] <- "red"
  }, mf)
  ## To test, select some cases
  cases <- rep(FALSE, nrow(mf))
  cases[seq(1, 10, 2)] <- TRUE
  sel$replace(cases)



