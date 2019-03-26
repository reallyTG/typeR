library(magic)


### Name: process
### Title: Force index arrays into range
### Aliases: process
### Keywords: array

### ** Examples

# extract the broken diagonal of magic.2np1(4) that passes
# through element [1,5]:

a <- magic.2np1(4)
index <- t(c(1,5)+rbind(1:9,1:9))
a[process(index,9)]



