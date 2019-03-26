library(pkgmaker)


### Name: .silenceF
### Title: Silencing Functions
### Aliases: .silenceF

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


f <- function(){
	cat("stdout message\n")
 message("stderr message")
	warning("stderr warning", immediate. = TRUE)
}

# example of generated wrapper
g <- .silenceF(f)
g

# use of silencing level
for(l in 7:-7){ message("\nLevel: ", l); .silenceF(f, l)() }

# inline functions
ifun <- .silenceF(function(){ f(); invisible(1) })
ifun()
ifun <- .silenceF(function(){ f(); 1 })
ifun()
ifun <- .silenceF(function(){ f(); 1 }, 2L)
ifun()




