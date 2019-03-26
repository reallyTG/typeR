library(ssize.fdr)


### Name: ssize.twoSamp
### Title: Sample Size Calculations for Two-Sample Microarray Experiments
### Aliases: ssize.twoSamp

### ** Examples

 ##See Figure 1.(a) of Liu & Hwang (2007)
 d<-1		##difference in differentially expressed genes to be detected
 s<-0.5  	##standard deviation 
 a<-0.05	##false discovery rate to be controlled
 pwr<-0.8	##desired power
 p0<-c(0.5,0.9,0.95)	##proportions of non-differentially expressed genes
 N<-20		##maximum sample size for calculations

 ts<-ssize.twoSamp(delta=d,sigma=s,fdr=a,power=pwr,pi0=p0,maxN=N,side="two-sided")
 ts$ssize	##first sample sizes to reach desired power for each proportion of
			 ##non-differentially expressed genes
 ts$power	##calculated power for each sample size
 ts$crit.vals	##calculated critical value for each sample size




