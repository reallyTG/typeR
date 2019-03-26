## ---- echo=FALSE---------------------------------------------------------
numero=10000

## ----echo=FALSE----------------------------------------------------------
### DEFINITIONS OF FORMULAS

prop_11<-function(x,y){
  return((length(which(apply(cbind(x, y), 1, function(row) all(row[1] > 0 & row[2] > 0)))))/length(x))
}

prop_01<-function(x,y){
  return((length(which(apply(cbind(x, y), 1, function(row) all(row[1] == 0 & row[2] > 0)))))/length(x))
}


prop_10<-function(x,y){
  return((length(which(apply(cbind(x, y), 1, function(row) all(row[1] > 0 & row[2] == 0)))))/length(x))
}

tau_T <- function(x, y, estimator = "values", p11 = 0, p01 = 0, p10 = 0) {

  nz <- which(apply(cbind(x, y), 1, function(row) all(row[1] > 0 & row[2] > 0)))
  nz_data <- cbind(x, y)[nz, ]

  if (length(nz) > 1) {
    if (length(which(!duplicated(nz_data[, 1]))) == 1 | length(which(!duplicated(nz_data[, 2]))) == 1) {
      t_11 <- 0  #positive ties treated as in Kendall's tau-b; i.e. they bring no contribution
    } else {
      t_11 <- cor(nz_data[, 1], nz_data[, 2], method = "kendall")
    }
  } else {
    t_11 <- 0  #in case of only one positive entry, it is impossible to measure concordance or discordance
  }

  if (estimator == "values") {
    p11 <-prop_11(x,y)
    p01 <-prop_01(x,y)
    p10 <-prop_10(x,y)
  }

  p_00 <- 1 - (p11 + p01 + p10)
  if (p11 == 1 | p11 == 0 | p01 == 1 | p01 == 0 | p10 == 1 | p10 == 0 | p_00 == 1 | p_00 == 0){
    ### cases when variance formula cannot be applied
    return(cor(x, y, method = "kendall"))
    }
  return(p11^2 * t_11 + 2 * (p_00 * p11 - p01 * p10))
}

tau_P<-function(x,y){
  data=cbind(x,y)
  nz=which(apply(data,1,function(row) all(row[1]>0 & row[2]>0)))
  p11=length(nz)/dim(data)[1]
  nz_data=data[nz,]
  
  Y0= which(apply(data,1,function(row) all(row[2]==0)))
  Y1= which(apply(data,1,function(row) all(row[2]>0)))
  X0= which(apply(data,1,function(row) all(row[1]==0)))
  X1= which(apply(data,1,function(row) all(row[1]>0)))
  
  if (length(Y0)>0 & length(Y1)>0){
    count_1=0
    for (i in data[Y0,1]){
      count_1= count_1 + sum (sapply(data[Y1,1], function(x) X =if({x-i}<0){return (1)} else{return (0)}))
    }
  p_1= count_1 /(length(Y0)*length(Y1))
  }
  else{
    p_1=0
  }
  
  if (length(X0) & length(X1)>0){
  count_2=0
  for (i in data[X0,2]){
   count_2=count_2+sum(sapply(data[X0,2], function(x) if({x-i}<0){return (1)} else{return (0)}))
  }
  p_2= count_2/(length(X0)*length(X1))
  }
  else{
    p_2=0
  }
    
  p01= (length(which(apply(data,1,function(row) all(row[1]==0 & row[2]>0)))))/dim(data)[1]
  p10= (length(which(apply(data,1,function(row) all(row[2]==0 & row[1]>0)))))/dim(data)[1]
  p_00= (length(which(apply(data,1,function(row) all(row==0)))))/dim(data)[1]
  
  if (length(nz)>1){
    if (sd(nz_data[,1])==0 | sd(nz_data[,2])==0) {t_11=0}
    else {t_11= cor(nz_data[,1],nz_data[,2],method="kendall")}
    }
  else {t_11=0}
  
  return (p11^2*t_11+2*(p_00*p11-p01*p10)+ 2*p11*(p10*((2*p_1)-1)+ p01*((2*p_2)-1)))
}

addendum<-function(x,y){ ##difference between two formulas
  data=cbind(x,y)
  nz=which(apply(data,1,function(row) all(row[1]>0 & row[2]>0)))
  p11=length(nz)/dim(data)[1]
  nz_data=data[nz,]
  
  Y0= which(apply(data,1,function(row) all(row[2]==0)))
  Y1= which(apply(data,1,function(row) all(row[2]>0)))
  X0= which(apply(data,1,function(row) all(row[1]==0)))
  X1= which(apply(data,1,function(row) all(row[1]>0)))
  
  if (length(Y0)>0 & length(Y1)>0){
    count_1=0
    for (i in data[Y0,1]){
      count_1= count_1 + sum (sapply(data[Y1,1], function(x) X =if({x-i}<0){return (1)} else{return (0)}))
    }
  p_1= count_1 /(length(Y0)*length(Y1))
  }
  else{
    p_1=0
  }
  
  if (length(X0) & length(X1)>0){
  count_2=0
  for (i in data[X0,2]){
   count_2=count_2+sum(sapply(data[X0,2], function(x) if({x-i}<0){return (1)} else{return (0)}))
  }
  p_2= count_2/(length(X0)*length(X1))
  }
  else{
    p_2=0
  }
    
  p01= (length(which(apply(data,1,function(row) all(row[1]==0 & row[2]>0)))))/dim(data)[1]
  p10= (length(which(apply(data,1,function(row) all(row[2]==0 & row[1]>0)))))/dim(data)[1]
  p_00= (length(which(apply(data,1,function(row) all(row==0)))))/dim(data)[1]
  
  return (2*p11*(p10*((2*p_1)-1)+ p01*((2*p_2)-1)))
}


## ----echo=FALSE,message=FALSE--------------------------------------------
# repeat loop in R or repeat function in r
compare_P<-function(infl, goal){
  v=c()
  sum= 0
  while (sum<=goal){
    library("gamlss.dist")
    x=abs(rBEZI(30, mu = 0.9, sigma = 1, nu = infl))
    y=abs(rBEZI(30, mu = 0.9, sigma = 1, nu = infl))
    if (sd(x)!= 0 & sd(y)!= 0){ ### cannot test constant vectors, because Kendall's formula does not apply
      sum = sum+1
      C=cor(x,y,method='kendall')
      v=c(v,(C-tau_P(x,y)))
    }
    }
  return(v)
}

compare_T<-function(infl, goal){
  v=c()
  sum= 0
  while (sum<goal){
    library("gamlss.dist")
    x=abs(rBEZI(30, mu = 0.9, sigma = 1, nu = infl))
    y=abs(rBEZI(30, mu = 0.9, sigma = 1, nu = infl))
    if (sd(x)!= 0 & sd(y)!= 0){ ### cannot test constant vectors, because Kendall's formula does not apply
      sum = sum+1
        C=cor(x,y,method='kendall')
        v=c(v,(C-tau_T(x,y)))
    }
    }
  return(v)
}

compare_d<-function(infl, goal){
  v=c()
  sum= 0
  while (sum<goal){ ### cannot test constant vectors, because Kendall's formula does not apply
    library("gamlss.dist")
    x=abs(rBEZI(30, mu = 0.9, sigma = 1, nu = infl))
    y=abs(rBEZI(30, mu = 0.9, sigma = 1, nu = infl))
    if (sd(x)!= 0 & sd(y)!= 0){
      sum = sum+1
      v=c(v,addendum(x,y))
    }
    }
  return(v)
  }

### histograms of difference of Kendall's Tau and proposed alternative formula

par(mfrow = c(1, 3))
hist(compare_P(0.3, numero),main=paste("tau_b-tau_P, infl=", 0.3),pin=c(1,1))
hist(compare_P(0.5, numero),main=paste("tau_b-tau_P, infl=", 0.5),pin=c(1,1))
hist(compare_P(0.8, numero),main=paste("tau_b-tau_P, infl=", 0.8),pin=c(1,1))

## ----echo=FALSE,message=FALSE--------------------------------------------
par(mfrow = c(1, 3))
hist(compare_T(0.3, numero),main=paste("tau_b-tau_T, infl=", 0.3),pin=c(1,1))
hist(compare_T(0.5, numero),main=paste("tau_b-tau_T, infl=", 0.5),pin=c(1,1))
hist(compare_T(0.8, numero),main=paste("tau_b-tau_T, infl=", 0.8),pin=c(1,1))


## ----echo=FALSE----------------------------------------------------------
### histograms of difference of two formulas
par(mfrow = c(1, 3))

hist(compare_d(0.3, numero),main=paste("tau_P-tau_T, infl=", 0.3),pin=c(5,5))
hist(compare_d(0.5, numero),main=paste("tau_P-tau_T, infl=", 0.5),pin=c(5,5))
hist(compare_d(0.8, numero),main=paste("tau_P-tau_T, infl=", 0.8),pin=c(5,5))

## ---- echo=FALSE, results='asis'-----------------------------------------
m=matrix(c(mean(compare_P(0.3, numero)),mean(compare_P(0.5, numero)),
           mean(compare_P(0.8, numero)),mean(compare_T(0.3, numero)),
           mean(compare_T(0.5, numero)),mean(compare_T(0.8, numero))),
         3, byrow=FALSE)
colnames(m)<- c("tau_p", "tau_t")
row.names(m)<-c("infl=0.3", "infl=0.5", "infl=0.8")
knitr::kable(m, caption="means of the two statistics")

## ------------------------------------------------------------------------
library(mazeinda)

set.seed(234)

x=abs(rBEZI(50, mu = 0.9, sigma = 1, nu = 0.7))
y=abs(rBEZI(50, mu = 0.9, sigma = 1, nu = 0.2))
associate(x,y)
test_associations(x,y)
combine(x,y)


x=matrix(abs(rBEZI(50, mu = 0.9, sigma = 1, nu = 0.6)),5)
y=matrix(abs(rBEZI(30, mu = 0.9, sigma = 1, nu = 0.3)),5)
knitr::kable(associate(x,y), digits=3, caption="associate(x,y)")
knitr::kable(suppressWarnings(test_associations(x,y)),
             digits=3, caption="test_associations(x,y)")
knitr::kable(suppressWarnings(combine(x,y)),
             digits=3,caption="combine(x,y)")

knitr::kable(suppressWarnings(associate(x,x)),
             digits=3, caption="associate all vectors in the matrix x pairwise")

## ------------------------------------------------------------------------
knitr::kable(associate(x,y, estimator="own", p11=0.1,p10=0.1, p01=0.1), digits=3,
             caption="parameters specified")
m1=matrix(abs(rBEZI(50, mu = 0.9, sigma = 1, nu = 0.7)),5)
m2=matrix(abs(rBEZI(30, mu = 0.9, sigma = 1, nu = 0.3)),5)
knitr::kable(associate(x,y, estimator="mean", d1=m1,d2=m2), digits=3,
             caption="parameters estimated as population mean")

