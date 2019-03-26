library(fdth)


### Name: quantile.fdt
### Title: Quantile of frequency distribution table (numerical variable)
### Aliases: quantile.fdt quantile.fdt.multiple

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
      quantile)[2,]              # The first quartile

quantile(fdt(mdf))               # Notice that the i default is 1 (the first quartile)

## A small (but didactic) joke  
quantile(fdt(mdf),
         i=2,
         probs=seq(0, 
                   1, 
                   0.25))        # The quartile 2
quantile(fdt(mdf),
         i=5,
         probs=seq(0, 
                   1, 
                   0.10))        # The decile 5 

quantile(fdt(mdf),
         i=50,
         probs=seq(0, 
                   1, 
                   0.01))        # The percentile 50

quantile(fdt(mdf),
         i=500,
         probs=seq(0, 
                   1, 
                   0.001))       # The permile 500

median(fdt(mdf))                 # The median (all the results are the same) ;)



