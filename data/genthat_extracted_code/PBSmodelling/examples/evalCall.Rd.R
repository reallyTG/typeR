library(PBSmodelling)


### Name: evalCall
### Title: Evaluate a Function Call
### Aliases: evalCall
### Keywords: programming character

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  # A user may have a function that calls other functions
  # using specific defaults (e.g., blue triangles)
  #------------------------------------------------------
  pbsfun = function(..., use.evalCall=TRUE) {
    plotAsp(0,0,type="n",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),
      axes=FALSE, frame.plot=TRUE, xlab="",ylab="")
    if (use.evalCall)
      evalCall(polygon, ...,
        argu=list(x=c(-1,1,0),y=c(1,1,-1), col="dodgerblue", border="grey"))
    else
      polygon(x=c(-1,1,0),y=c(1,1,-1),col="dodgerblue",border="grey",...) 
  }
  par(mfrow=c(2,1))
  pbsfun(lwd=4,use.evalCall=FALSE)
  #------------------------------------------------------
  # But what if the user wants pink triangles?
  pbsfun(col="pink",lwd=4,use.evalCall=TRUE,checkpar=TRUE)
  par(oldpar)
})

# Without 'evalCall' an error occurs due to duplicated arguments
## Not run: pbsfun(col="pink",lwd=4,use.evalCall=FALSE)



