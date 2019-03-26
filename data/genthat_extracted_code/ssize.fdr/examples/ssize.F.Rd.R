library(ssize.fdr)


### Name: ssize.F
### Title: Sample Size Calculations for Multi-Sample Microarray Experiments
### Aliases: ssize.F

### ** Examples

 ##Sample size calculation for three-treatment loop design microarray experiment
 ##See Figure S2 of Liu & Hwang (2007)
 des<-matrix(c(1,-1,0,0,1,-1),ncol=2,byrow=FALSE)	##design matrix of loop design experiment
 b<-c(1,-0.5)			##difference between first two treatments is 1 and second and 
                ##third treatments is -0.5
 df<-function(n){3*n-2}		##degrees of freedom for this design is 3n-2
 s<-1				##standard deviation
 a<-0.05			##false discovery rate to be controlled
 pwr1<-0.8			##desired power
 p0<-c(0.5,0.9,0.95,0.995)	##proportions of non-differentially expressed genes
 N1<-20				##maximum sample size for calculations

 ft<-ssize.F(X=des,beta=b,dn=df,sigma=s,fdr=a,power=pwr1,pi0=p0,maxN=N1)
 ft$ssize	##first sample sizes to reach desired power for each proportion of 
            ##non-differentially expressed genes
 ft$power	##power for each sample size
 ft$crit.vals	##critical value for each sample size




