library(formattable)


### Name: vmap
### Title: Vectorized map from element to case by index or string value
### Aliases: vmap

### ** Examples

x <- c("normal","normal","error","unknown","unknown")
vmap(x, normal = 0, error = -1, unknown = -2)

x <- c(1,1,2,1,2,2,1,1,2)
vmap(x, "type-A", "type-B")



