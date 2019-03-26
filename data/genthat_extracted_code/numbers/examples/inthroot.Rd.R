library(numbers)


### Name: iNthroot
### Title: Integer N-th Root
### Aliases: iNthroot

### ** Examples

iNthroot(0.5, 6)    # 0
iNthroot(1, 6)      # 1
iNthroot(5^6, 6)    # 5
iNthroot(5^6-1, 6)  # 4
## Not run: 
##D # Define a function that tests whether 
##D isNthpower <- function(p, n) {
##D     q <- iNthroot(p, n)
##D     if (q^n == p) { return(TRUE)
##D     } else { return(FALSE) }
##D   }
##D   
## End(Not run)



