library(Ecfun)


### Name: createX2matchY
### Title: Create X to match Y
### Aliases: createX2matchY
### Keywords: manip

### ** Examples

##
## 1.  NULL 
## -
null <- createX2matchY(NULL, NULL)
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(null, NULL)
## Don't show: 
)
## End(Don't show)
##
## 2.  logical 
##
lgcl3 <- createX2matchY(NULL, 
           c(FALSE, TRUE, FALSE))

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(lgcl3, logical(3))
## Don't show: 
)
## End(Don't show)

##
## 3.  integer
##
int3 <- createX2matchY(integer(0), 
           c(FALSE, TRUE, FALSE))
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(int3, integer(3))
## Don't show: 
)
## End(Don't show)

##
## 4.  list -> character
##
ch3 <- createX2matchY(integer(0), 
         list(a=1, b=2, c=3))
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(ch3, character(3))
## Don't show: 
)
## End(Don't show)



