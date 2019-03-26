library(bayesm)


### Name: margarine
### Title: Household Panel Data on Margarine Purchases
### Aliases: margarine
### Keywords: datasets

### ** Examples

data(margarine)
cat(" Table of Choice Variable ", fill=TRUE)
print(table(margarine$choicePrice[,2]))

cat(" Means of Prices", fill=TRUE)
mat=apply(as.matrix(margarine$choicePrice[,3:12]), 2, mean)
print(mat)

cat(" Quantiles of Demographic Variables", fill=TRUE)
mat=apply(as.matrix(margarine$demos[,2:8]), 2, quantile)
print(mat)


## example of processing for use with 'rhierMnlRwMixture'
if(0) {
  select = c(1:5,7)  ## select brands
  chPr = as.matrix(margarine$choicePrice)
  
  ## make sure to log prices
  chPr = cbind(chPr[,1], chPr[,2], log(chPr[,2+select]))
  demos = as.matrix(margarine$demos[,c(1,2,5)])
  
  ## remove obs for other alts
  chPr = chPr[chPr[,2] <= 7,]
  chPr = chPr[chPr[,2] != 6,]
  
  ## recode choice
  chPr[chPr[,2] == 7,2] = 6
  
  hhidl = levels(as.factor(chPr[,1]))
  lgtdata = NULL
  nlgt = length(hhidl)
  p = length(select)  ## number of choice alts
  
  ind = 1
  for (i in 1:nlgt) {
    nobs = sum(chPr[,1]==hhidl[i])
    if(nobs >=5) {
      data = chPr[chPr[,1]==hhidl[i],]
      y = data[,2]
      names(y) = NULL
      X = createX(p=p, na=1, Xa=data[,3:8], nd=NULL, Xd=NULL, INT=TRUE, base=1)
      lgtdata[[ind]] = list(y=y, X=X, hhid=hhidl[i])
      ind = ind+1
    }
  }
  nlgt = length(lgtdata)
  
  ## now extract demos corresponding to hhs in lgtdata
  Z = NULL
  nlgt = length(lgtdata)
  for(i in 1:nlgt){
     Z = rbind(Z, demos[demos[,1]==lgtdata[[i]]$hhid, 2:3])
  }
  
  ## take log of income and family size and demean
  Z = log(Z)
  Z[,1] = Z[,1] - mean(Z[,1])
  Z[,2] = Z[,2] - mean(Z[,2])
  
  keep = 5
  R = 20000
  mcmc1 = list(keep=keep, R=R)
  
  out = rhierMnlRwMixture(Data=list(p=p,lgtdata=lgtdata, Z=Z),
                          Prior=list(ncomp=1), Mcmc=mcmc1)
  
  summary(out$Deltadraw)
  summary(out$nmix)
  
  ## plotting examples
  if(0){
    plot(out$nmix)
    plot(out$Deltadraw)
  }
}



