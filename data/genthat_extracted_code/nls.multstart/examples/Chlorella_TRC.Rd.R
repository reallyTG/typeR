library(nls.multstart)


### Name: Chlorella_TRC
### Title: Example metabolic thermal response curves
### Aliases: Chlorella_TRC
### Keywords: dataset

### ** Examples

data("Chlorella_TRC")
library(ggplot2)
ggplot(Chlorella_TRC) +
 geom_point(aes(temp, ln.rate, col = process)) +
 facet_wrap(~ growth.temp + flux)



