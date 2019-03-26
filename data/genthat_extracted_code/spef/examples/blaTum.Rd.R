library(spef)


### Name: blaTum
### Title: Bladder Tumors Cancer Recurrences
### Aliases: blaTum

### ** Examples

data(blaTum)
library(ggplot2)
ggplot(blaTum, aes(time, id)) + geom_tile(aes(fill=count)) +
   facet_grid(treatment ~ ., scales="free_y", )



