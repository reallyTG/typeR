library(gbutils)


### Name: nposargs
### Title: Function to count the number of positional arguments used in a
###   call
### Aliases: nposargs
### Keywords: programming

### ** Examples

f <- function(x,y,z,...){
    call <- sys.call()
    nposargs(call)
}
f(a,b,c)  # 3
f(a, , )  # 3
f(a,  )   # 2
f(a)      # 1
f(,  )    # 2
f(, a,  ) # 3
f()       # 0



