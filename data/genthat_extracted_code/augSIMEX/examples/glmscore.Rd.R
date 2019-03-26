library(augSIMEX)


### Name: glmscore
### Title: Score Value in Generalized Linear Model
### Aliases: glmscore
### Keywords: function

### ** Examples

### The user specified function to be checked. (logit link in binomial family)
scorefunction=function(beta,Y,data,weight,offset){
  results<-lapply(1:dim(data)[2],
                  FUN=function(i){
                    S<-lapply(1:dim(data)[1],function(x){
                      eta<- matrix(beta,nrow=1) 
                      return(weight[x]*Y[x]*data[x,i]-weight[x]*exp(eta)/(1+exp(eta))*data[x,i])})
                    return(S)}
  )
  return(matrix(unlist(results),ncol=dim(data)[2]))
}

data(ToyUni)

### Data need to rearranged. See detail.
nsize<-length(ToyUni$Main[,"Y"])
data.in.score<-data.frame(intercept=1,X=ToyUni$Main[,"Xstar"],
                          W=ToyUni$Main[,"W"],Z=ToyUni$Main[,"Zstar"])

## compare. The results should be identical.
glmscore(rep(0,4),ToyUni$Main[,"Y"],data.in.score,rep(1,nsize),
         rep(0,nsize),family=binomial(link=logit))
scorefunction(rep(0,4),ToyUni$Main[,"Y"],data.in.score,rep(1,nsize),rep(0,nsize))



