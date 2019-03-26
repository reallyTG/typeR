library(wiod)


### Name: wiod
### Title: World Input Output Database 1995-2011
### Aliases: wiod wiod-package

### ** Examples

data(wiod95)

library(decompr)

w95 <- decomp(inter95,
              final95,
              countries,
              industries,
              output95,
              method="leontief")

library(gvc)

i2e95 <- i2e(w95)



