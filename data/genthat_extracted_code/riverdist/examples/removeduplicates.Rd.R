library(riverdist)


### Name: removeduplicates
### Title: Remove Duplicates
### Aliases: removeduplicates

### ** Examples

data(abstreams0)
zoomtoseg(seg=c(170,171,157),rivers=abstreams0)

abstreams1 <- removeduplicates(rivers=abstreams0)
zoomtoseg(seg=c(166,167,154),rivers=abstreams1)



