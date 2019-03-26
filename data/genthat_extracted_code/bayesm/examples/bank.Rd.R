library(bayesm)


### Name: bank
### Title: Bank Card Conjoint Data
### Aliases: bank
### Keywords: datasets

### ** Examples

data(bank)
cat(" table of Binary Dep Var", fill=TRUE)
print(table(bank$choiceAtt[,2]))
cat(" table of Attribute Variables", fill=TRUE)
mat = apply(as.matrix(bank$choiceAtt[,3:16]), 2, table)
print(mat)
cat(" means of Demographic Variables", fill=TRUE)
mat=apply(as.matrix(bank$demo[,2:3]), 2, mean)
print(mat)

## example of processing for use with rhierBinLogit
if(0) {

  choiceAtt = bank$choiceAtt
  Z = bank$demo
  
  ## center demo data so that mean of random-effects
  ## distribution can be interpreted as the average respondent
  Z[,1] = rep(1,nrow(Z))
  Z[,2] = Z[,2] - mean(Z[,2])
  Z[,3] = Z[,3] - mean(Z[,3])
  Z[,4] = Z[,4] - mean(Z[,4])
  Z = as.matrix(Z)
  
  hh = levels(factor(choiceAtt$id))
  nhh = length(hh)
  lgtdata = NULL
  for (i in 1:nhh) {
    y = choiceAtt[choiceAtt[,1]==hh[i], 2]
    nobs = length(y)
    X = as.matrix(choiceAtt[choiceAtt[,1]==hh[i], c(3:16)])
    lgtdata[[i]] = list(y=y, X=X)
  }
  cat("Finished Reading data", fill=TRUE)
  
  Data = list(lgtdata=lgtdata, Z=Z)
  Mcmc = list(R=10000, sbeta=0.2, keep=20)
  
  set.seed(66)
  out = rhierBinLogit(Data=Data, Mcmc=Mcmc)
  
  begin = 5000/20
  summary(out$Deltadraw, burnin=begin)
  summary(out$Vbetadraw, burnin=begin)
  
  ## plotting examples
  if(0){
    
    ## plot grand means of random effects distribution (first row of Delta)
    index = 4*c(0:13)+1
    matplot(out$Deltadraw[,index], type="l", xlab="Iterations/20", ylab="",
            main="Average Respondent Part-Worths")
    
    ## plot hierarchical coefs
    plot(out$betadraw)
    
    ## plot log-likelihood
    plot(out$llike, type="l", xlab="Iterations/20", ylab="", 
         main="Log Likelihood")
  }
}



