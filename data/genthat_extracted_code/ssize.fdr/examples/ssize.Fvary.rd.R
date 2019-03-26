library(ssize.fdr)


### Name: ssize.Fvary
### Title: Sample Size Calculations for Multi-Sample Microarray Experiments
###   with Differing Variances among Genes
### Aliases: ssize.Fvary

### ** Examples

 ##Sample size calculation for three-treatment loop design microarray experiment
 des<-matrix(c(1,-1,0,0,1,-1),ncol=2,byrow=FALSE)	##design matrix of loop design experiment
 b<-c(1,-0.5)			##difference between first two treatments is 1 and second and third 
               ##treatments is -0.5
 df<-function(n){3*n-2}		##degrees of freedom for this design is 3n-2
 alph<-3;beta<-1	##variances among genes follow an Inverse Gamma(3,1)
 a1<-0.05	##fdr to be fixed
 pwr<-0.8	##desired power
 p0<-c(0.9,0.95,0.995)		##proportions of non-differentially expressed genes
 N1<-35		##maximum sample size to be used in calculations

 ftv<-ssize.Fvary(X=des,beta=b,dn=df,a=alph,b=beta,fdr=a1,power=pwr,pi0=p0,maxN=N1)
 ftv$ssize	##first sample sizes to reach desired power
 ftv$power	##calculated power for each sample size
 ftv$crit.vals	##calculated critical value for each sample sizeft$ssize




