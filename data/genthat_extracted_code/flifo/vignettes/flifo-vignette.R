## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(flifo)

## ------------------------------------------------------------------------
# Create an empty LIFO
s <- lifo()
print(s)

is.empty(s)
is.fifo(s)
is.lifo(s)

## ------------------------------------------------------------------------
# Add values to 's'
push(s, 0.3)
push(s, data.frame(x=1:2, y=2:3))
print(s)
size(s)# in bytes

# Retrive the last element inserted
pop(s)
size(s)

## ---- eval=FALSE---------------------------------------------------------
#  s <- fifo(max_length = 3)
#  max_length(s)
#  #> [1] 3
#  
#  # max_length can be changed
#  max_length(s) <- 2
#  push(s, 1)
#  push(s, 2)
#  push(s, 3) # generates an error
#  #> Error in push(s, 3) : '.stack' is full

## ------------------------------------------------------------------------
s <- lifo()
x <- 3.14
exists("x")
push(s, x)
exists("x")

## ---- eval=FALSE---------------------------------------------------------
#  s <- nino()
#  push(s, "foo")
#  print(s)
#  #> NINO stack: no element can be reached
#  pop(s) # generates an error
#  #> Error in pop(s) : cannont retrieve elements from a 'nino' stack

