library(lifecontingencies)


### Name: lifecontingencies-package
### Title: Package to perform actuarial mathematics on life contingencies
###   and classical financial mathematics calculations.
### Aliases: lifecontingencies-package lifecontingencies

### ** Examples



##financial mathematics example

#calculates monthly installment of a loan of 100,000, 
#interest rate 0.05

i=0.05
monthlyInt=(1+i)^(1/12)-1
Capital=100000
#Montly installment

R=1/12*Capital/annuity(i=i, n=10,k=12, type = "immediate")
R
balance=numeric(10*12+1)
capitals=numeric(10*12+1)
interests=numeric(10*12+1)
balance[1]=Capital
interests[1]=0
capitals[1]=0

for(i in (2:121))	{
			balance[i]=balance[i-1]*(1+monthlyInt)-R
			interests[i]=balance[i-1]*monthlyInt
			capitals[i]=R-interests[i]
			}
loanSummary=data.frame(rate=c(0, rep(R,10*12)), 
	balance, interests, capitals)

head(loanSummary)

tail(loanSummary)

##actuarial mathematics example

#APV of an annuity

		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#evaluate and life-long annuity for an aged 65
		axn(soa08Act, x=65) 




