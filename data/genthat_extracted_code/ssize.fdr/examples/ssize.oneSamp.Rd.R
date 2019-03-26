library(ssize.fdr)


### Name: ssize.oneSamp
### Title: Sample Size Calculations for One-Sample Microarray Experiments
### Aliases: ssize.oneSamp

### ** Examples

 d<-2		##effect size
 s<-1  		##standard deviation 
 a<-0.05	##false discovery rate to be controlled
 pwr<-0.8	##desired power
 p0<-c(0.5,0.9,0.95)	##proportions of non-differentially expressed genes
 N<-20		##maximum sample size for calculations
 os<-ssize.oneSamp(delta=d,sigma=s,fdr=a,power=pwr,pi0=p0,maxN=N,side="two-sided")
 os$ssize	##first sample sizes to reach desired power
 os$power	##calculated power for each sample size
 os$crit.vals	##calculated critical value for each sample size



