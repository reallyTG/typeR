library(valaddin)


### Name: components
### Title: Decompose a firmly applied function
### Aliases: components firm_core firm_checks firm_error firm_args

### ** Examples

f <- function(x, y, ...) NULL
f_fm <- firmly(f, ~is.numeric, list(~x, ~y - x) ~ {. > 0})

identical(firm_core(f_fm), f)                  # [1] TRUE
firm_checks(f_fm)                              # 4 x 4 data frame
firm_error(f_fm)                               # [1] "simpleError"
firm_args(f_fm)                                # NULL
firm_args(firmly(f_fm, .warn_missing = "y"))   # [1] "y"




