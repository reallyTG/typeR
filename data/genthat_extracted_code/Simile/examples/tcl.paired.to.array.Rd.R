library(Simile)


### Name: tcl.paired.to.array
### Title: Re-format model value array
### Aliases: tcl.paired.to.array

### ** Examples

Simile:::tcl.paired.to.array("1 {1 7 2 4} 2 {1 8 2 6} 3 {1 9 2 1}",
c(3,2), FALSE)
#     [,1] [,2] [,3]
#[1,]    7    8    9
#[2,]    4    6    1



