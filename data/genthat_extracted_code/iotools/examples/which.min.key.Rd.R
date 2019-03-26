library(iotools)


### Name: which.min.key
### Title: Determine the next key in bytewise order
### Aliases: which.min.key
### Keywords: manip

### ** Examples

which.min.key(c("g","a","b",NA,"z","a"))
which.min.key(c("g","a|z","b",NA,"z|0","a"))
which.min.key(c("g","a|z","b",NA,"z|0","a"), "")
which.min.key(list("X",1,NULL,"F","Z"))
which.min.key(as.character(c(NA, NA)))
which.min.key(NA_character_)
which.min.key(list())



