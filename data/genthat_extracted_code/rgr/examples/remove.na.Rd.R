library(rgr)


### Name: remove.na
### Title: Remove and Count NAs
### Aliases: remove.na
### Keywords: misc

### ** Examples

## remove NAs
xx <- c(15, 39, 18, 16, NA, 53)
temp.x <- remove.na(xx)
x <- temp.x$x[1:temp.x$n]

## to recover the other values returned
n <- temp.x$n
m <- temp.x$m
nna <- temp.x$nna

## to remove NA replacing a -9999 in kola.o
data(kola.o)
kola.o.fixed <- ltdl.fix.df(kola.o, coded = -9999)
temp.x <- remove.na(kola.o.fixed$pH)
x <- temp.x$x[1:temp.x$n]

## Clean-up
rm(xx)
rm(temp.x)
rm(x)
rm(n)
rm(m)
rm(nna)
rm(kola.o.fixed)



