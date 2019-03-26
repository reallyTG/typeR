library(umx)


### Name: umx_means
### Title: umx_means
### Aliases: umx_means

### ** Examples

tmp = mtcars[,1:4]
tmp$cyl = ordered(mtcars$cyl) # ordered factor
tmp$hp  = ordered(mtcars$hp)  # binary factor
umx_means(tmp, ordVar = 0, na.rm = TRUE)



