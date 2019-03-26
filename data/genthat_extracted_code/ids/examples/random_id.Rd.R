library(ids)


### Name: random_id
### Title: Cryptographically generated random identifiers
### Aliases: random_id

### ** Examples

# Generate a random id:
random_id()

# Generate 10 of them!
random_id(10)

# Different length ids
random_id(bytes = 8)
# (note that the number of characters is twice the number of bytes)

# The ids are not affected by R's RNG state:
set.seed(1)
(id1 <- random_id())
set.seed(1)
(id2 <- random_id())
# The generated identifiers are different, despite the seed being the same:
id1 == id2

# If you need these identifiers to be reproducible, pass use_openssl = FALSE
set.seed(1)
(id1 <- random_id(use_openssl = FALSE))
set.seed(1)
(id2 <- random_id(use_openssl = FALSE))
# This time they are the same:
id1 == id2

# Pass \code{n = NULL} to generate a function that binds your arguments:
id8 <- random_id(NULL, bytes = 8)
id8(10)



