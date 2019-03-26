library(lmviz)


### Name: BadLM
### Title: BadLM shiny app
### Aliases: BadLM

### ** Examples

## Not run:
if (interactive()){
BadLM()

# function to generate Y
dist=function(n,my,parvet,par,x) {
  my+parvet*rt(n,df=par[1])
}
# function to give the true value of the variance
varfun=function(my,parvet,par,x){
  if (par[1]>2) {
    veravar=parvet^2*par[1]/(par[1]-2)
  } else {
    veravar=-1
  }
  return(veravar)
}
# dist and varfun must have those argument where
#  my is the vector mean of Y
#  parvet is g() computed at x values
#  par is a vector of two parameters
param=list(nome="Student-t (bis)", #name of dist for drop down menu (optional)
           nomepar1="Gradi di libertà", #name of parameter 1 (optional)
           minpar1=1,maxpar1=30, #min/max of param 1 (needed)
           valuepar1=10, #initial value of param1 (optional)
           steppar1=0.1, #increment of param1 (optional)
           enableVarFunPanel=TRUE #whether the panel to input g should appear
)

BadLM(dist.custom=dist,dist.custom.veravar = varfun,dist.custom.param=param)


dist=function(n,my,parvet,par,x) {
 my+rnorm(n,0,sqrt(par[1]+par[2]*x^2))
}
# function to give the true value of the variance
varfun=function(my,parvet,par,x){
 return(par[1]+par[2]*x^2)
}
# dist and varfun must have those argument where
#  my is the vector mean of Y
#  parvet is g() computed at x values
#  par is a vector of two parameters
param=list(nome="N(.,b1+b2*x^2)", #name of dist for drop down menu (optional)
           nomepar1="b1", #name of parameter 1 (optional)
           minpar1=1,maxpar1=3, #min/max of param 1 (needed)
           valuepar1=1, #initial value of param1 (optional)
           steppar1=0.1, #increment of param1 (optional)
           nomepar2="b2", #name of parameter 1 (optional)
           minpar2=0,maxpar2=3, #min/max of param 1 (needed)
           valuepar2=1, #initial value of param1 (optional)
           steppar2=0.1, #increment of param1 (optional)
           enableVarFunPanel=FALSE, #whether the panel to input g should appear
           showVarFun=TRUE
)

  BadLM(dist.custom=dist,dist.custom.veravar = varfun,dist.custom.param=param)
}
## End(Not run)



