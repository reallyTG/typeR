library(riverdist)


### Name: sequenceverts
### Title: Store Vertices in Ascending Sequence
### Aliases: sequenceverts

### ** Examples

data(Gulk)
Gulk <- setmouth(seg=1, vert=1, rivers=Gulk)
str(Gulk)

Gulk.dir <- sequenceverts(rivers=Gulk)
str(Gulk.dir)



