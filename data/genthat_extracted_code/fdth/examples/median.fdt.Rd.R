library(fdth)


### Name: median.fdt
### Title: Median of frequency distribution table (numerical variable)
### Aliases: median.fdt median.fdt.multiple

### ** Examples

mdf <- data.frame(x=rnorm(1e3, 
                          20, 
                          2),
                  y=rnorm(1e3, 
                          30,
                          3),
                  z=rnorm(1e3,
                          40,
                          4))

head(mdf)

apply(mdf,
      2,
      median)

median(fdt(mdf))      



