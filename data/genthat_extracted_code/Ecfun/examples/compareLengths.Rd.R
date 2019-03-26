library(Ecfun)


### Name: compareLengths
### Title: Compare the lengths of two objects
### Aliases: compareLengths
### Keywords: manip

### ** Examples

##
## 1.  equal 
##
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(compareLengths(1:3, 4:6), c("equal", ''))
## Don't show: 
)
## End(Don't show)

##
## 2.  compatible 
##
a <- 1:2
b <- letters[1:6]
comp.ab <- compareLengths(a, b, message0='Chk:')
comp.ba <- compareLengths(b, a, message0='Chk:')
# check 
chk.ab <- c('compatible', 
            'Chk: length(b) = 6 is 3 times length(a) = 2')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(comp.ab, chk.ab) 
## Don't show: 
)
## End(Don't show)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(comp.ba, chk.ab) 
## Don't show: 
)
## End(Don't show)

##
## 3.  incompatible 
##
Z <- LETTERS[1:3]
comp.aZ <- compareLengths(a, Z)
# check 
chk.aZ <- c('incompatible', 
    ' length(Z) = 3 is not a multiple of length(a) = 2')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(comp.aZ, chk.aZ) 
## Don't show: 
)
## End(Don't show)
##
## 4.  problems with name.x and name.y 
##
comp.ab2 <- compareLengths(a, b, '', '')
# check 
chk.ab2 <- c('compatible', 
             'in compareLengths: length(y) = 6 is 3 times length(x) = 2')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(comp.ab2, chk.ab2) 
## Don't show: 
)
## End(Don't show)
##
## 5.  zeroLength 
##
zeroLen <- compareLengths(logical(0), 1) 
# check 
zeroL <- c('compatible', ' length(logical(0)) = 0')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(zeroLen, zeroL)
## Don't show: 
)
## End(Don't show)



