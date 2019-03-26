library(dials)


### Name: new_quant_param
### Title: Tools for creating new parameter objects
### Aliases: new_quant_param new_qual_param

### ** Examples

num_subgroups <-
  new_quant_param(
    type = "integer",
    range = c(1L, 20L),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(num_subgroups = "# Subgroups"),
    finalize = NULL
  )



