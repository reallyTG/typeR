library(SKAT)


### Name: Power_Continuous
### Title: Power calculation, continuous traits
### Aliases: Power_Continuous Power_Continuous_R

### ** Examples


#
#	Calculate the average power of randomly selected 3kb regions 
#	with the following conditions.
#
#	Causal percent = 20%
#	Negative percent = 20%
#	Max effect size  = 2 at MAF = 10^-4
#
#	When you use this function, please increase N.Sim (more than 100)	
#

out.c<-Power_Continuous(SubRegion.Length=3000, 
Causal.Percent= 20, N.Sim=5, MaxBeta=2,Negative.Percent=20)
out.c

#
#	Calculate the required sample sizes to achieve 80% power

Get_RequiredSampleSize(out.c, Power=0.8)




