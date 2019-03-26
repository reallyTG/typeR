library(qccrs)


### Name: xrs
### Title: Xbar Control Charts Under Repetitive Sampling
### Aliases: xrs xrs.default

### ** Examples


library(magrittr)
library(purrr)

c(0.0, 0.1, 0.20, 0.3, 0.4, 0.5, 1.0, 1.5, 2, 3) %>%
purrr::map(
function(x) 
    xrs(
        .c     = x
      , .n     = 10
      , .k1    = 2.9301
      , .k2    = 0.9825))




