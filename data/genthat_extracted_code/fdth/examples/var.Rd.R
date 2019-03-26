library(fdth)


### Name: var
### Title: Variance of frequency distribution table (numerical variable)
### Aliases: var var.default var.fdt var.fdt.multiple

### ** Examples

mdf <- data.frame(x=rnorm(1e2, 
                          20, 
                          2),
                  y=rnorm(1e2, 
                          30,
                          3),
                  z=rnorm(1e2,
                          40,
                          4))

head(mdf)

apply(mdf,
      2,
      var)

var(fdt(mdf))      



