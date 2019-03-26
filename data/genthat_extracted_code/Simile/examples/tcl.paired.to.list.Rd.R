library(Simile)


### Name: tcl.paired.to.list
### Title: Re-format model value array
### Aliases: tcl.paired.to.list
### Keywords: internal

### ** Examples

Simile:::tcl.paired.to.list("1 {1 7 2 4} 2 {1 8} 3 {2 1}", FALSE)
# [[1]]
# [[1]][[1]]
# [1] 7
# 
# [[1]][[2]]
# [1] 4
# 
# 
# [[2]]
# [[2]][[1]]
# [1] 8
# 
# 
# [[3]]
# [[3]][[1]]
# NULL
# 
# [[3]][[2]]
# [1] 1



