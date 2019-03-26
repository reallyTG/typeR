library(BurStMisc)


### Name: Cfrag.list
### Title: Write a Fragment of a C Program
### Aliases: Cfrag.list

### ** Examples

test.list <- list(adoub=as.double(rnorm(20)), anint=as.integer(92:109),
	achar=c("aaa", "bbbb", "ccccc"))

Cfrag.list(test.list, file="")

## Not run: 
##D Cfrag.list(test.list, file="test.c")
##D 
##D Cfrag.list(test.list[1], file="test.c", dec=TRUE)
##D Cfrag.list(test.list[-1], file="test.c", dec=FALSE, append=TRUE)
## End(Not run)



