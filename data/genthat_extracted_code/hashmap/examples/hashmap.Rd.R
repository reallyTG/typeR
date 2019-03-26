library(hashmap)


### Name: hashmap
### Title: Atomic vector hash map
### Aliases: hashmap

### ** Examples


x <- replicate(10e3,
    paste0(sample(letters, 12, TRUE),
           collapse = "")
)
y <- rnorm(length(x))
z <- sample(x, 100)

H <- hashmap(x, y)

all.equal(y[match(z, x)], H[[z]])

## Not run: 
##D microbenchmark::microbenchmark(
##D     "R" = y[match(z, x)],
##D     "H" = H[[z]],
##D     times = 500L
##D )
## End(Not run)



