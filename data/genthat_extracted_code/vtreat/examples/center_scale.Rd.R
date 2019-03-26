library(vtreat)


### Name: center_scale
### Title: Center and scale a set of variables.
### Aliases: center_scale

### ** Examples


d <- data.frame(x = 1:5, 
                y = c('a', 'a', 'b', 'b', 'b'))
vars_to_transform = "x"
t <- base::scale(as.matrix(d[, vars_to_transform, drop = FALSE]), 
                 center = TRUE, scale = TRUE)
t

centering <- attr(t, "scaled:center")
scaling <- attr(t, "scaled:scale")
center_scale(d, center = centering, scale = scaling)




