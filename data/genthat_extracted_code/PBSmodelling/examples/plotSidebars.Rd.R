library(PBSmodelling)


### Name: plotSidebars
### Title: Plot Table as Horizontal Sidebars
### Aliases: plotSidebars
### Keywords: hplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  pbsfun = function () {
    meanmarg = function(x){x=x[!is.na(x)]; 
      if (length(x)==0 | all(x==0)) NA else sum((x/sum(x))*as.numeric(names(x)))}
    data(CCA.qbr,envir=.PBSmodEnv)
    plotSidebars(CCA.qbr,scale=4,las=1,border="navyblue",mar=c(4,4,1,1),
      lbl=c("Year","Quillback Rockfish Age"),margin=function(x){round(meanmarg(x),0)})
    invisible() }
  pbsfun()
  par(oldpar)
})



