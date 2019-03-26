library(packS4)


### Name: detectGlobal
### Title: ~ Function: detectGlobal ~
### Aliases: detectGlobal

### ** Examples

### example 1
f <- function(x)x^2
detectGlobal(f)

g <- function(x)x^2*y
detectGlobal(g)


###########
### example 2
f <- function(x)x^2

### the next line should ring a bell, because 2^2 is not 8
detectGlobal(f(2),8)

### the next line should not ring a bell, because 2^2 is not 8, and we ask for conter-example
detectGlobal(f(2),8,FALSE)


###########
### example 3
h <- function(x){
   apply(matrix(1:x),1,length)
}

### 'length' is detected as a global variable whereas it is a function
detectGlobal(h)

### So we use tolerance=1
detectGlobal(h,,,1)



