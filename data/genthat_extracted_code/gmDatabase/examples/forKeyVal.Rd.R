library(gmDatabase)


### Name: forKeyVal
### Title: forKeyVal - Looping named lists
### Aliases: forKeyVal
### Keywords: utilities

### ** Examples

forKeyVal(name,x,c(a=1,b=5,c=6),{
  cat(name,"=>",x,"\n")
})

forKeyVal(name,x,list(a=4,b=1:7,c=c(a="Aber",b="nicht")), {
  cat(name,"\n",sep="")
  if(is.null(names(x)))
    names(x) <- 1:length(x)
  forKeyVal(iname,x,x,{
    cat(name,".",iname,"=>",x,"\n",sep="")
  })
})



