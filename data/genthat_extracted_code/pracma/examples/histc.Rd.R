library(pracma)


### Name: histc
### Title: Histogram Count (Matlab style)
### Aliases: histc
### Keywords: manip

### ** Examples

x <- seq(0.0, 1.0, by = 0.05)
e <- seq(0.1, 0.9, by = 0.10)
histc(x, e)
# $cnt
# [1] 2 2 2 2 2 2 2 2 1
# $bin
# [1] 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 0 0

## Not run: 
##D # Compare
##D findInterval(x, e)
##D # [1] 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 9
##D findInterval(x, e, all.inside = TRUE)
##D # [1] 1 1 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 8 8 8
##D # cnt[i] <- sum(findInterval(x, e) == i)
## End(Not run)

x <- matrix( c(0.5029, 0.2375, 0.2243, 0.8495,
               0.0532, 0.1644, 0.4215, 0.4135,
               0.7854, 0.0879, 0.1221, 0.6170), 3, 4, byrow = TRUE)
e <- seq(0.0, 1.0, by = 0.2)
histc(x, e)
# $cnt
#      [,1] [,2] [,3] [,4]
# [1,]    1    2    1    0
# [2,]    0    1    1    0
# [3,]    1    0    1    1
# [4,]    1    0    0    1
# [5,]    0    0    0    1
# [6,]    0    0    0    0
# 
# $bin
#      [,1] [,2] [,3] [,4]
# [1,]    3    2    2    5
# [2,]    1    1    3    3
# [3,]    4    1    1    4



