library(ssize.fdr)


### Name: ssize.oneSampVary
### Title: Sample Size Calculations for One-Sample Microarray Experiments
###   with Differing Mean Expressions and Standard Deviations Among Genes
### Aliases: ssize.oneSampVary

### ** Examples

 dm<-2;  ds<-1	##the effect sizes of the genes follow a Normal(2,1) distribution
 alph<-3;  beta<-1	##the variances of the genes follow an Inverse Gamma(3,1) distribution.
 a2<-0.05	##false discovery rate to be controlled
 pwr2<-0.8	##desired power
 p0<-c(0.90,0.95,0.995)	##proportions of non-differentially expressed genes
 N1<-35		##maximum sample size to be used in calculations

 osv<-ssize.oneSampVary(deltaMean=dm,deltaSE=ds,a=alph,b=beta,fdr=a2,power=pwr2,pi0=p0,
        maxN=N1,side="two-sided")
 osv$ssize	##first sample sizes to reach desired power
 osv$power	##calculated power for each sample size
 osv$crit.vals	##calculated critical value for each sample size



