library(phylotate)


### Name: mb_attrs
### Title: Parse MrBayes-supplied attributes from a NEXUS file
### Aliases: mb_attrs
### Keywords: phylo

### ** Examples

  # Parse the example data included with this package
  data(finches)
  t <- parse_annotated(finches, format="nexus")

  # Obtain a table of MrBayes attributes for each node
  attrs <- mb_attrs(t)



