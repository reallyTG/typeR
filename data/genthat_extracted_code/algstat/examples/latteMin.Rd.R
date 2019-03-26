library(algstat)


### Name: latteMin
### Title: Solve a Linear Program (Minimization)
### Aliases: latteMin

### ** Examples

## Not run: 
##D 
##D latteMin("-2 x + 3 y", c("x + y <= 10", "x >= 0", "y >= 0"))
##D latteMin("-2 x + 3 y", c("x + y <= 10", "x >= 0", "y >= 0"),
##D   method = "cones") # ??
##D 
##D 
##D df <- expand.grid(x = 0:10, y = 0:10)
##D df <- subset(df, x + y <= 10)
##D df$val <- apply(df, 1, function(v) -2*v[1] + 3*v[2])
##D df[which.min(df$val),]
##D 
##D library(ggplot2)
##D qplot(x, y, data = df, size = val)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D latteMin("-2 x - 3 y - 4 z", c(
##D   "3 x + 2 y + z <= 10",
##D   "2 x + 5 y + 3 z <= 15",
##D   "x >= 0", "y >= 0", "z >= 0"
##D ), "cones",quiet = FALSE)
##D 
##D df <- expand.grid(x = 0:10, y = 0:10, z = 0:10)
##D df <- subset(df,
##D   (3*x + 2*y + 1*z <= 10) &
##D   (2*x + 5*y + 3*z <= 15)
##D )
##D 
##D df$val <- apply(df, 1, function(v) -2*v[1] + -3*v[2] + -4*v[3])
##D df[which.min(df$val),]
##D 
##D 
##D 
##D 
## End(Not run)



