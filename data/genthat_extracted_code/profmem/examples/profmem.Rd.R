library(profmem)


### Name: profmem
### Title: Memory profiling R
### Aliases: profmem profmem_begin profmem_end profmem_suspend
###   profmem_resume profmem_status profmem_depth

### ** Examples

if (capabilities("profmem")) {

## Memory profile an R expression
p <- profmem({
  x <- raw(1000)
  A <- matrix(rnorm(100), ncol = 10)
})

## Display the results
print(p)

## Total amount of memory allocation
total(p)

## Allocations greater than 1 kB
p2 <- subset(p, bytes > 1000)
print(p2)

## The expression is evaluated in the calling environment
str(x)
str(A)

}



