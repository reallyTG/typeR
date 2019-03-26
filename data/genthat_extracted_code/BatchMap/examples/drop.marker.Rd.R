library(BatchMap)


### Name: drop.marker
### Title: Creates a new sequence by dropping markers.
### Aliases: drop.marker

### ** Examples

data(example.out)
twopt <- rf.2pts(example.out)
all.mark <- make.seq(twopt,"all")
groups <- group(all.mark)
(LG1 <- make.seq(groups,1))
(LG.aug<-drop.marker(LG1, c(10,14)))




