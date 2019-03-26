library(nlmeU)


### Name: missPat
### Title: Extract pattern of missing data
### Aliases: missPat

### ** Examples

dtf <- subset(armd.wide,
             select = c(visual12, visual24, visual52))
missPat(dtf, symbols = c("?","+"))



