library(RSclient)


### Name: RCC
### Title: Functions to talk to an Rserve instance (new version)
### Aliases: RCC RS.connect RS.close RS.eval RS.eval.qap RS.login RS.switch
###   RS.authkey RS.collect RS.assign RS.oobCallbacks RS.server.shutdown
###   RS.server.eval RS.server.source
### Keywords: interface

### ** Examples

## Not run: 
##D   c <- RS.connect()
##D   RS.eval(c, data(stackloss))
##D   RS.eval(c, library(MASS))
##D   RS.eval(c, rlm(stack.loss ~ ., stackloss)$coeff)
##D   RS.eval(c, getwd())
##D   x <- rnorm(1e5)
##D   ## this sends the contents of x to the remote side and runs `sum` on
##D   ## it without actually creating the binding x on the remote side
##D   RS.eval(c, as.call(list(quote(sum), x)), lazy=FALSE)
##D   RS.close(c)
##D   
## End(Not run)



