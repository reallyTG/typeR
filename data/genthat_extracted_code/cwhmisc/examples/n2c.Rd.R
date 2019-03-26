library(cwhmisc)


### Name: n2c
### Title: Show absolute values as characters, prepare for plotting
### Aliases: n2c indexLine n2cCompact charMat explainLegend
### Keywords: print

### ** Examples

n2c(c(10e20,-10e5,10,(10:0)/10,0.05)) 
#   "X" "6" "1" "0" "&" "%" "#" "*" "=" "+" "-" ":" "," " "
# attr(,"legend")
# [1] ">=1:log, >=0. 9& 8% 7# 6* 5= 4+ 3- 2: 1, 05. ' ' "

n2c(matrix(c(10e20,10e5,20,10,0.7,0.6,0,0.5,0.1),3,3),FALSE)
#      [,1] [,2] [,3]
# [1,] "X"  "1"  " " 
# [2,] "5"  "#"  "=" 
# [3,] "1"  "*"  "," 
# attr(,"legend")
# [1] ">=1: log, >=0. 9& 8% 7# 6* 5= 4+ 3- 2: 1, 05. ' ' "
m <- matrix(rnorm(500),nrow=50,ncol=10)
n2c(m,symm=TRUE)
indexLine(ncol(m))
(n2 <- n2cCompact(m, symm=FALSE))
charMat(n2)
explainLegend() # 



