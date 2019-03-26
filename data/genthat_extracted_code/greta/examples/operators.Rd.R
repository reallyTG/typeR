library(greta)


### Name: operators
### Title: arithmetic, logical and relational operators for greta arrays
### Aliases: operators

### ** Examples

## Not run: 
##D 
##D x <- as_data(-1:12)
##D 
##D # arithmetic
##D a <- x + 1
##D b <- 2 * x + 3
##D c <- x %% 2
##D d <- x %/% 5
##D 
##D # logical
##D e <- (x > 1) | (x < 1)
##D f <- e & (x < 2)
##D g <- !f
##D 
##D # relational
##D h <- x < 1
##D i <- (-x) >= x
##D j <- h == x
## End(Not run)



