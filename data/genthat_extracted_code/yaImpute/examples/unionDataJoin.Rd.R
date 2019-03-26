library(yaImpute)


### Name: unionDataJoin
### Title: Combines data from several sources
### Aliases: unionDataJoin
### Keywords: misc

### ** Examples

require(yaImpute)

d1=data.frame(x1=c("a","b","c","d","e","f"))
d2=data.frame(x1=as.character(seq(1,4)),row.names=seq(5,8))
d3=data.frame(x2=seq(1:10))

# note the levels
levels(d1$x1)
# [1] "a" "b" "c" "d" "e" "f"

levels(d2$x1)
# [1] "1" "2" "3" "4"

all=unionDataJoin(d1,d2,d3,warn=FALSE)
all
#      x1 x2
# 1     a  1
# 2     b  2
# 3     c  3
# 4     d  4
# 5     1  5
# 6     2  6
# 7     3  7
# 8     4  8
# 9  <NA>  9
# 10 <NA> 10

levels(all$x1)
# [1] "1" "2" "3" "4" "a" "b" "c" "d"




