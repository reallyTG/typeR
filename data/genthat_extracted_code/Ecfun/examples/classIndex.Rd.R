library(Ecfun)


### Name: classIndex
### Title: Convert class to an integer 1-8 and vice versa
### Aliases: classIndex index2class
### Keywords: manip

### ** Examples

##
## 1.  classIndex
##
x1 <- classIndex(NULL)
x2 <- classIndex(logical(0))
x3 <- classIndex(integer(1))
x4 <- classIndex(numeric(2))
x5 <- classIndex(complex(3))
x6 <- classIndex(raw(4))
x7 <- classIndex(character(5))
x8 <- classIndex(list())

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(c(x1, x2, x3, x4, x5, x6, x7, x8), 1:8)
## Don't show: 
)
## End(Don't show)

##
## 2.  index2class 
##
c1 <- index2class(1)
c2 <- index2class(2)
c3 <- index2class(3)
c4 <- index2class(4)
c5 <- index2class(5) 
c6 <- index2class(6) 
c7 <- index2class(7)
c8 <- index2class(8)
c8o <- index2class(8, FALSE)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(c(c1, c2, c3, c4, c5, c6, c7, c8, c8o), 
          c('NULL', 'logical', 'integer', 'numeric', 
            'complex', 'raw', 'character', 'character', 
            'other'))
## Don't show: 
)
## End(Don't show)




