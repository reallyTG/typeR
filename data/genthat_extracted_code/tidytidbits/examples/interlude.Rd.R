library(tidytidbits)


### Name: interlude
### Title: An interlude in a magrittr pipeline
### Aliases: interlude

### ** Examples

library(tibble)
library(magrittr)
library(dplyr)
x <- c() # now x exists in the calling env
tibble(a=1, b=2) %>%
   mutate(b=a+3) %>%
   interlude(x <- .$b) %>%
   mutate(a=a+1)
# x is set to 4



