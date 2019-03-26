library(greta)


### Name: as_data
### Title: convert other objects to greta arrays
### Aliases: as_data

### ** Examples

## Not run: 
##D 
##D # numeric/integer/logical vectors, matrices and arrays can all be coerced to
##D # data greta arrays
##D 
##D vec <- rnorm(10)
##D mat <- matrix(seq_len(3 * 4), nrow = 3)
##D arr <- array(sample(c(TRUE, FALSE), 2 * 2 * 2, replace = TRUE),
##D              dim = c(2, 2, 2))
##D (a <- as_data(vec))
##D (b <- as_data(mat))
##D (c <- as_data(arr))
##D 
##D # dataframes can also be coerced, provided all the columns are numeric,
##D # integer or logical
##D df <- data.frame(x1 = rnorm(10),
##D                  x2 = sample(1L:10L),
##D                  x3 = sample(c(TRUE, FALSE), 10, replace = TRUE))
##D (d <- as_data(df))
## End(Not run)



