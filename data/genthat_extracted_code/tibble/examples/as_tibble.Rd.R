library(tibble)


### Name: as_tibble
### Title: Coerce lists, matrices, and more to data frames
### Aliases: as_tibble as_tibble.data.frame as_tibble.list as_tibble.matrix
###   as_tibble.table as_tibble.NULL as_tibble.default

### ** Examples

l <- list(x = 1:500, y = runif(500), z = 500:1)
df <- as_tibble(l)

m <- matrix(rnorm(50), ncol = 5)
colnames(m) <- c("a", "b", "c", "d", "e")
df <- as_tibble(m)

as_tibble(as.list(1:3), .name_repair = "unique")

# Prefer enframe() for vectors
enframe(1:3)
enframe(1:3, name = NULL)

# For list-like inputs, `as_tibble()` is considerably simpler than
# `as.data.frame()` and hence faster
## Not run: 
##D if (requireNamespace("bench", quietly = TRUE)) {
##D   l2 <- replicate(26, sample(letters), simplify = FALSE)
##D   names(l2) <- letters
##D   bench::mark(
##D     as_tibble(l2, .name_repair = "universal"),
##D     as_tibble(l2, .name_repair = "unique"),
##D     as_tibble(l2, .name_repair = "minimal"),
##D     as_tibble(l2),
##D     as.data.frame(l2),
##D     check = FALSE
##D   )
##D }
## End(Not run)



