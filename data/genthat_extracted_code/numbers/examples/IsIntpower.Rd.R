library(numbers)


### Name: isIntpower
### Title: Powers of Integers
### Aliases: isIntpower

### ** Examples

isIntpower(1)    #  1  1
isIntpower(15)   # 15  1
isIntpower(17)   # 17  1
isIntpower(64)   #  8  2
isIntpower(36)   #  6  2
isIntpower(100)  # 10  2
## Not run: 
##D   for (p in 5^7:7^5) {
##D       pp <- isIntpower(p)
##D       if (pp[2] != 1) cat(p, ":\t", pp, "\n")
##D   }
## End(Not run)



