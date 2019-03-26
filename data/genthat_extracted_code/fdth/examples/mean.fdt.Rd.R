library(fdth)


### Name: mean.fdt
### Title: Mean of frequency distribution table (numerical variable)
### Aliases: mean.fdt mean.fdt.multiple

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
      mean)

mean(fdt(mdf))      



