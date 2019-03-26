library(SKAT)


### Name: Power_Logistic
### Title: Power calculation, Dichotomous traits
### Aliases: Power_Logistic Power_Logistic_R

### ** Examples


#
#	Calculate the average power of randomly selected 3kb regions 
#	with the following conditions.
#
#	Causal percent = 20%
#	Negative percent = 20%
#	Max OR = 7 at MAF = 10^-4
#
#	When you use this function, please increase N.Sim (more than 100)	
#
out.b<-Power_Logistic(SubRegion.Length=3000, 
Causal.Percent= 20, N.Sim=5 ,MaxOR=7,Negative.Percent=20)

out.b

#
#	Calculate the required sample sizes to achieve 80% power

Get_RequiredSampleSize(out.b, Power=0.8)




