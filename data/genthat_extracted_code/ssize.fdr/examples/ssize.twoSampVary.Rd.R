library(ssize.fdr)


### Name: ssize.twoSampVary
### Title: Sample Size Calculations for Two-Sample Microarray Experiments
###   with Differing Mean Expressions and Standard Deviations Among Genes
### Aliases: ssize.twoSampVary

### ** Examples

 ##See Figure 3.(a) of Liu & Hwang (2007)
 dm<-2; ds<-1	##the delta.g's follow a Normal(2,1) distribution
 alph<-3; beta<-1	##the variances of genes follow an Inverse Gamma(a,b) distribution
 a2<-0.05	##false discovery rate to be controlled
 pwr2<-0.8	##desired power
 p0<-c(0.90,0.95,0.995)	##proportions of non-differentially expressed genes
 N1<-35		##maximum sample size to be used in calculations

 tsv<-ssize.twoSampVary(deltaMean=dm,deltaSE=ds,a=alph,b=beta,fdr=a2,power=pwr2,pi0=p0,
                        maxN=N1,side="two-sided")
 tsv$ssize	##first sample size(s) to reach desired power
 tsv$power	##calculated power for each sample size
 tsv$crit.vals	##calculated critical value for each sample size




