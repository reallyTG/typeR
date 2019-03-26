library(sfsmisc)


### Name: rotn
### Title: Generalized Rot13 Character Translation (Rotation)
### Aliases: rotn
### Keywords: manip

### ** Examples

rotn(c("ABC", "a","b","c"), 1)
rotn(c("ABC", "a","b","c"), 2)
rotn(c("ABC", "a","b","c"), 26) # rotation by 26 does not change much

(ch <- paste("Hello", c("World!", "you too")))
rotn(ch)
rotn( rotn(ch ) ) # rotn(*, 13) is its own inverse



