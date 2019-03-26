## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
set.seed(1)
kappa<- 3
p1 <- 0.1
p2 <- 0.85
p <- p1+p2
p0 <-1-p1-p2

N<- 10000

#Simulate from the bivariate negative binomial distribution
y <- trawl::Bivariate_NBsim(N,kappa,p1,p2)

#Compare the empirical and theoretical mean of the first component
base::mean(y[,1])
kappa*p1/(1-p)

#Compare the empirical and theoretical variance of the first component
stats::var(y[,1])
kappa*p1*(1-p2)/(1-p)^2

#Compare the empirical and theoretical mean of the second component
base::mean(y[,2])
kappa*p2/(1-p)

#Compare the empirical and theoretical variance of the second component
stats::var(y[,2])
kappa*p2*(1-p1)/(1-p)^2

#Compare the empirical and theoretical correlation between the two components
stats::cor(y[,1],y[,2])
(p1*p2/(p0+p1)*(p0+p2))^(1/2)



## ------------------------------------------------------------------------
set.seed(1)
p1<-0.15
p2<-0.3

N<-10000

#Simulate N realisations from the bivariate LSD 
y<-trawl::Bivariate_LSDsim(N, p1, p2)

#Compute the empirical and theoretical mean of the first component
base::mean(y[,1])
trawl::ModLSD_Mean(base::log(1-p2)/base::log(1-p1-p2),p1/(1-p2))

#Compute the empirical and theoretical mean of the second component
base::mean(y[,2])
trawl::ModLSD_Mean(base::log(1-p1)/base::log(1-p1-p2),p2/(1-p1))

#Compute the empirical and theoretical variance of the first component
stats::var(y[,1])
trawl::ModLSD_Var(base::log(1-p2)/base::log(1-p1-p2),p1/(1-p2))

#Compute the empirical and theoretical variance of the second component
stats::var(y[,2])
trawl::ModLSD_Var(base::log(1-p1)/base::log(1-p1-p2),p2/(1-p1))

##Compute the empirical and theoretical correlation between the two components
stats::cor(y[,1],y[,2])
trawl::BivLSD_Cor(p1,p2)

##Compute the empirical and theoretical covariance between the two components
stats::cov(y[,1],y[,2])
trawl::BivLSD_Cov(p1,p2)


## ------------------------------------------------------------------------
set.seed(1)
p1<-0.15
p2<-0.25
p3<-0.55

N<- 10000

#Simulate N realisations from the bivariate LSD 
y<-trawl::Trivariate_LSDsim(N, p1, p2, p3)

#Compute the empirical and theoretical mean of the first component
base::mean(y[,1])
trawl::ModLSD_Mean(base::log(1-p2-p3)/base::log(1-p1-p2-p3),p1/(1-p2-p3))

#Compute the empirical and theoretical mean of the second component
base::mean(y[,2])
trawl::ModLSD_Mean(base::log(1-p1-p3)/base::log(1-p1-p2-p3),p2/(1-p1-p3))

#Compute the empirical and theoretical mean of the third component
base::mean(y[,3])
trawl::ModLSD_Mean(base::log(1-p1-p2)/base::log(1-p1-p2-p3),p3/(1-p1-p2))

#Compute the empirical and theoretical variance of the first component
stats::var(y[,1])
trawl::ModLSD_Var(base::log(1-p2-p3)/base::log(1-p1-p2-p3),p1/(1-p2-p3))

#Compute the empirical and theoretical variance of the second component
stats::var(y[,2])
trawl::ModLSD_Var(base::log(1-p1-p3)/base::log(1-p1-p2-p3),p2/(1-p1-p3))

#Compute the empirical and theoretical variance of the third component
stats::var(y[,3])
trawl::ModLSD_Var(base::log(1-p1-p2)/base::log(1-p1-p2-p3),p3/(1-p1-p2))

#Computing the bivariate covariances and correlations
#Cor(X1,X2):
delta <- base::log(1-p3)/base::log(1-p1-p2-p3)
hatp1 <-p1/(1-p3)
hatp2<-p2/(1-p3)

stats::cov(y[,1],y[,2])
trawl::BivModLSD_Cov(delta,hatp1,hatp2)

stats::cor(y[,1],y[,2])
trawl::BivModLSD_Cor(delta,hatp1,hatp2)

#Cor(X1,X3):
delta <- log(1-p2)/log(1-p1-p2-p3)
hatp1 <-p1/(1-p2)
hatp2<-p3/(1-p2)

stats::cov(y[,1],y[,3])
trawl::BivModLSD_Cov(delta,hatp1,hatp2)

stats::cor(y[,1],y[,3])
trawl::BivModLSD_Cor(delta,hatp1,hatp2)

#Cor(X2,X3):
delta <- log(1-p1)/log(1-p1-p2-p3)
hatp1 <-p2/(1-p1)
hatp2<-p3/(1-p1)

stats::cov(y[,2],y[,3])
trawl::BivModLSD_Cov(delta,hatp1,hatp2)
stats::cor(y[,2],y[,3])
trawl::BivModLSD_Cor(delta,hatp1,hatp2)

