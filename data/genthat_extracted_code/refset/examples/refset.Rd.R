library(refset)


### Name: refset
### Title: Create a reference to a subset of an object
### Aliases: refset `%r%` %r%

### ** Examples

dfr <- data.frame(a=1:4, b=1:4)
ss <- dfr[1:2,]
refset(rs, dfr[1:2,])
dfr$a <- 4:1
ss # 1:2
rs # 4:3

# same:
refset(rs, dfr, 1:2, )

# same:
rs %r% dfr[1:2,]

vec <- 1:10
refset(middle, vec[4:6])
vec[4:6] <- NA
middle 
middle <- 4:6 + 100
vec

# dynamic versus static indices:
dfr <- data.frame(a=rnorm(100), b=rnorm(100))
refset(ss, dfr, a>1,)
refset(ss.static, dfr, a>1,, dyn.idx=FALSE)
nrow(ss) == nrow(ss.static)
dfr$a <- dfr$a + 2 * dfr$b


precious.data <- rnorm(100)
refset(big, precious.data, precious.data>1, read.only=TRUE)
big
## Not run: 
##D big <- big * 2 # throws an error
## End(Not run)

# Using refset with other functions:
# dynamically updated calculated column
dfr <- data.frame(a=rnorm(10), b=rnorm(10))
refset(rs, transform(dfr, x=a+2*b+rnorm(10)))
rs
rs # different

# Non-readonly refset with other functions. Works but gives a warning:
## Not run: 
##D vec <- 1:5
##D refset(ssv, names(vec), read.only=FALSE)
##D ssv <- LETTERS[1:5]
##D vec
## End(Not run)




