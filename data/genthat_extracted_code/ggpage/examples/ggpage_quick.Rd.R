library(ggpage)


### Name: ggpage_quick
### Title: Creates a quick visualization of the page layout
### Aliases: ggpage_quick

### ** Examples

## No test: 
library(dplyr)
library(stringr)
library(ggplot2)
library(tidytext)
library(ggpage)
# quick
## data.frame with full lines
ggpage_quick(tinderbox)
## vector with full lines
ggpage_quick(tinderbox %>%
               pull(text))
## data.frame with single words
ggpage_quick(tinderbox %>%
               unnest_tokens(text, text))
## vector with single words
ggpage_quick(tinderbox %>%
               unnest_tokens(text, text) %>%
               pull(text))

# nrow and ncol
ggpage_quick(tinderbox, nrow = 2)
ggpage_quick(tinderbox, ncol = 2)
## End(No test)



