library(memisc)


### Name: recode
### Title: Recode Items, Factors and Numeric Vectors
### Aliases: recode recode,vector-method recode,item-method
###   recode,factor-method
### Keywords: manip

### ** Examples

x <- as.item(sample(1:6,20,replace=TRUE),
        labels=c( a=1,
                  b=2,
                  c=3,
                  d=4,
                  e=5,
                  f=6))
print(x)

# A recoded version of x is returned
# containing the values 1, 2, 3, which are
# labelled as "A", "B", "C".
recode(x,
  A = 1 <- range(min,2),
  B = 2 <- 3:4,
  C = 3 <- range(5,max), # this last comma is ignored
  )

# This causes an error action: the sets
# of original values overlap.
try(recode(x,
  A = 1 <- range(min,2),
  B = 2 <- 2:4,
  C = 3 <- range(5,max)
  ))

recode(x,
  A = 1 <- range(min,2),
  B = 2 <- 3:4,
  C = 3 <- range(5,6),
  D = 4 <- 7
  )
  
# This results in an all-missing vector:
recode(x,
  D = 4 <- 7,
  E = 5 <- 8
  )

f <- as.factor(x)
x <- as.integer(x)

recode(x,
  1 <- range(min,2),
  2 <- 3:4,
  3 <- range(5,max)
  )

# This causes another error action:
# the third argument is an invalid
# expression for a recoding.
try(recode(x,
  1 <- range(min,2),
  3:4,
  3 <- range(5,max)
  ))

# The new values are character strings,
# therefore a factor is returned.
recode(x,
  "a" <- range(min,2),
  "b" <- 3:4,
  "c" <- range(5,6)
  )
  
recode(x,
  1 <- 1:3,
  2 <- 4:6
  )
  
recode(x,
  4 <- 7,
  5 <- 8,
  otherwise = "copy"
  )

recode(f,
  "A" <- c("a","b"),
  "B" <- c("c","d"),
  otherwise="copy"
  )

recode(f,
  "A" <- c("a","b"),
  "B" <- c("c","d"),
  otherwise="C"
  )
 
recode(f,
  "A" <- c("a","b"),
  "B" <- c("c","d")
  )




