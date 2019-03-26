library(jwutil)


### Name: binary_col_names
### Title: names of fields which are numeric, binary or combinations
###   thereof
### Aliases: binary_col_names binary_cols

### ** Examples

dat <- data.frame(c("a", "b"), c(TRUE, FALSE), c(1, 0), c(1L, 0L),
                  c(1L, 2L), c(0.1, 0.2), c("9", "8"))
names(dat) <- c("char", "bin", "binfloat", "binint",
                "int", "float", "charint")
binary_cols(dat)
binary_col_names(dat)
binary_col_names(dat, invert = TRUE)



