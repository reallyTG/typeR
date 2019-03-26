library(BatchMap)


### Name: add.marker
### Title: Creates a new sequence by adding markers.
### Aliases: add.marker

### ** Examples

data(example.out)
twopt <- rf.2pts(example.out)
all.mark <- make.seq(twopt,"all")
groups <- group(all.mark)
(LG1 <- make.seq(groups,1))
(LG.aug<-add.marker(LG1, c(4,7)))




