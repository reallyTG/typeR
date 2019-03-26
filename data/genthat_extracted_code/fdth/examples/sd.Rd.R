library(fdth)


### Name: sd
### Title: Standard deviation of frequency distribution table (numerical
###   variable)
### Aliases: sd sd.default sd.fdt sd.fdt.multiple

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
      sd)

sd(fdt(mdf))      



