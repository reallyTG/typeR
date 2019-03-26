library(riverdist)


### Name: removeunconnected
### Title: Remove Unconnected Segments
### Aliases: removeunconnected

### ** Examples

data(Koyukuk2)
Koy_subset <- trimriver(trimto=c(30,28,29,3,19,27,4),rivers=Koyukuk2)
Koy_subset <- setmouth(seg=1,vert=427,rivers=Koy_subset)
plot(Koy_subset)

Koy_subset_trim <- removeunconnected(Koy_subset)
plot(Koy_subset_trim)



