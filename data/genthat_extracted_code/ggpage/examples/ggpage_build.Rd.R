library(ggpage)


### Name: ggpage_build
### Title: Creates a data frame for further analysis and plotting
### Aliases: ggpage_build

### ** Examples

## No test: 
library(dplyr)
library(stringr)
library(ggplot2)
library(tidytext)
library(ggpage)
# build and plot
## data.frame with full lines
ggpage_build(tinderbox) %>%
  ggpage_plot()
## vector with full lines
ggpage_build(book = tinderbox %>%
  pull(text)) %>%
  ggpage_plot()
## data.frame with single words
ggpage_build(tinderbox) %>%
  unnest_tokens(text, word) %>%
  ggpage_plot()
## vector with single words
ggpage_build(tinderbox %>%
  unnest_tokens(text, text) %>%
  pull(text)) %>%
  ggpage_plot()

# nrow and ncol
ggpage_build(tinderbox, nrow = 2) %>%
  ggpage_plot()
ggpage_build(tinderbox, ncol = 2) %>%
  ggpage_plot()

# Include analysis within
ggpage_build(tinderbox) %>%
  mutate(word_length = str_length(word)) %>%
  ggpage_plot(aes(fill = word_length))
## End(No test)



