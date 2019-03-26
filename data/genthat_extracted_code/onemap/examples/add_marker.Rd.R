library(onemap)


### Name: add_marker
### Title: Creates a new sequence by adding markers.
### Aliases: add_marker

### ** Examples

data(example_out)
twopt <- rf_2pts(example_out)
all_mark <- make_seq(twopt,"all")
groups <- group(all_mark)
(LG1 <- make_seq(groups,1))
(LG.aug<-add_marker(LG1, c(4,7)))




