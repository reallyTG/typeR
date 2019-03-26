library(rapportools)


### Name: lambda.test
### Title: Goodman and Kruskal's lambda
### Aliases: lambda.test

### ** Examples

## Not run: 
##D ## quick example
##D x <- data.frame(x = c(5, 4, 3), y = c(9, 8, 7), z = c(7, 11, 22), zz = c(1, 15, 8))
##D lambda.test(x)    # 0.1 and 0.18333
##D lambda.test(t(x)) # 0.18333 and 0.1
##D 
##D ## historical data (see the references above: p. 744)
##D men.hair.color <- data.frame(
##D b1 = c(1768, 946, 115),
##D b2 = c(807, 1387, 438),
##D b3 = c(189, 746, 288),
##D b4 = c(47, 53, 16)
##D )
##D row.names(men.hair.color) <- paste0('a', 1:3)
##D lambda.test(men.hair.color)
##D lambda.test(t(men.hair.color))
##D 
##D ## some examples on mtcars
##D lambda.test(table(mtcars$am, mtcars$gear))
##D lambda.test(table(mtcars$gear, mtcars$am))
##D lambda.test(table(mtcars$am, mtcars$gear), 1)
##D lambda.test(table(mtcars$am, mtcars$gear), 2)
## End(Not run)



