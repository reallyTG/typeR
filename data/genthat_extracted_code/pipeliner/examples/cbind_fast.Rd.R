library(pipeliner)


### Name: cbind_fast
### Title: Faster alternative to 'cbind_fast'
### Aliases: cbind_fast

### ** Examples

## Not run: 
##D df1 <- data.frame(x = 1:5, y = 1:5 * 0.1)
##D df2 <- data.frame(a = 6:10, b = 6:10 * 0.25)
##D df3 <- cbind_fast(df1, df2)
##D df3
##D #   x   y  a    b
##D # 1 1 0.1  6 1.50
##D # 2 2 0.2  7 1.75
##D # 3 3 0.3  8 2.00
##D # 4 4 0.4  9 2.25
##D # 5 5 0.5 10 2.50
## End(Not run)



