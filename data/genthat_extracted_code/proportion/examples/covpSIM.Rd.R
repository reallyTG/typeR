library(proportion)


### Name: covpSIM
### Title: Coverage Probability using simulation Coverage probability for
###   CI obtained from any method over the space [0, 1]
### Aliases: covpSIM

### ** Examples

LL=c(0,0.01,0.0734,0.18237,0.3344,0.5492)		#Lower and Upper Limits
UL=c(0.4507,0.6655,0.8176,0.9265,0.9899,1)
n= 5; alp=0.05; s=5000; a=1; b=1; t1=0.93; t2=0.97
covpSIM(n,LL,UL,alp,s,a,b,t1,t2)



