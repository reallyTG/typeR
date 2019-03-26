library(cwhmisc)


### Name: functions
### Title: Functions for testing and other
### Aliases: Cayley chsvd divmod divmodL dsm equal equalFuzzy exch frac int
###   inrange Km Ko last LE loop.vp LS lV mod modR modS norm2 one onebyx
###   powr pythag quotmean safeDiv signp solveQeq sqrtH sqr submod zero
### Keywords: arith

### ** Examples

int (c(0,pi,2*pi,30*pi))    # 0  3  6 94
frac(c(0,pi,2*pi,30*pi))    # 0.000000 0.141593 0.283185 0.247780
frac(c(0,pi,2*pi,30*pi), 3) # 0 142 283 248
y <- c( Inf, -Inf,NA,  NaN, -NaN,-1, 0, 1 )
signp(c(-1:1,NA,NaN,Inf, -Inf)) # -1   1   1  1  1     1  1
#  instead of sign() =            -1   0   1  NA NaN   1  -1
mod((-3:5),4 ) # 1 2 3 0 1 2 3 0 1
modS((-3:5),4) # -3 -2 -1  0  1  2  3  0  1
x <- 200; y <- x + 0.1
equalFuzzy(x,y,0.1*c(10^(-3:0))) # FALSE  TRUE  TRUE  TRUE
equalFuzzy(x,y,0.1*c(10^(-3:0)),FALSE) # FALSE FALSE FALSE  TRUE
loop.vp(1:4) #  1 2 3 4 1
loop.vp(matrix(1:12,nrow=3),c(2,4))
#     [,1] [,2] [,3] [,4] [,5] [,6]
#[1,]    1    4    7   10    4   10
#[2,]    2    5    8   11    5   11
#[3,]    3    6    9   12    6   12
safeDiv(0:3,c(0,0:2)) # 1.552518e+231
signp(c(-1:1,NA,NaN,Inf, -Inf)) # -1   1   1  1  1     1  1
#  instead of sign() =            -1   0   1  NA NaN   1  -1
solveQeq(0,0,1) # NA NA
solveQeq(0,1,0) # 0
solveQeq(0,1,1) # -1
solveQeq(1,0,0) #  0 0
solveQeq(1,0,1) # 0-1i 0+1i
solveQeq(1,1,0) #  -1  0
solveQeq(1,1,1) #  -0.5-0.866025i  -0.5+0.866025i
solveQeq(sample(1:4,1),sample(1:4,1),sample(1:4,1))
x <- matrix(rnorm(9),3,3)
s <- svd(x)
lV(s$d)
norm(chsvd(s) - x) # 9.4368957e-16
submod(8.1,c(10.3, 31) )  # 0.0 8.1
submod(18.1,c(10.3, 31) )  # 1.0 7.8
exch(LETTERS, "A", "Y") # "Y" "B" ... "W" "X" "A" "Z"
exch(1:5, "2", "Y") # "1" "Y" "3" "4" "5"
pythag(19,180) # 1.8100000e+02 3.8414499e-23



