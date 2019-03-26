library(onemap)


### Name: drop_marker
### Title: Creates a new sequence by dropping markers.
### Aliases: drop_marker

### ** Examples

data(example_out)
twopt <- rf_2pts(example_out)
all_mark <- make_seq(twopt,"all")
groups <- group(all_mark)
(LG1 <- make_seq(groups,1))
(LG.aug<-drop_marker(LG1, c(10,14)))




