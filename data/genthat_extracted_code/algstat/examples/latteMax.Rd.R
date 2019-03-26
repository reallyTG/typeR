library(algstat)


### Name: latteMax
### Title: Solve a Linear Program (Maximization)
### Aliases: latteMax

### ** Examples

## Not run: 
##D 
##D latteMax("-2 x + 3 y", c("x + y <= 10", "x >= 0", "y >= 0"))
##D 
##D 
##D df <- expand.grid(x = 0:10, y = 0:10)
##D df <- subset(df, x + y <= 10)
##D df$val <- apply(df, 1, function(v) -2*v[1] + 3*v[2])
##D df[which.max(df$val),]
##D 
##D library(ggplot2)
##D qplot(x, y, data = df, size = val)
##D 
##D 
##D 
## End(Not run)



