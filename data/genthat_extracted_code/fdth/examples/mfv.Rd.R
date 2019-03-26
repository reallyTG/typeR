library(fdth)


### Name: mfv
### Title: Most frequent value (statistical mode) of frequency distribution
###   table (numerical and categorical variable)
### Aliases: mfv mfv.default mfv.fdt mfv.fdt.multiple mfv.fdt_cat
###   mfv.fdt_cat.multiple

### ** Examples

## Numerical
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

mfv(mdf$x)   # From vector x
mfv(mdf$y)   # From vector y
mfv(mdf$z)   # From vector z

(tb <- fdt(mdf))

mfv(tb)      # From agruped dad in a fdt


## Categorical
mdf <- data.frame(c1=sample(letters[1:5],
                            1e3,
                            rep=TRUE),
                  c2=sample(letters[6:10],
                            1e3,
                            rep=TRUE),
                  c3=sample(letters[11:21],
                            1e3,
                            rep=TRUE))
head(mdf)

mfv(mdf$c1)   # From vector c1
mfv(mdf$c2)   # From vector c2
mfv(mdf$c3)   # From vector c3

(tb <- fdt_cat(mdf))

mfv(tb)      # From agruped dad in a fdt 



