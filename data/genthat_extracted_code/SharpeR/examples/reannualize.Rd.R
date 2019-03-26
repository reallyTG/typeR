library(SharpeR)


### Name: reannualize
### Title: Change the annualization of a Sharpe ratio.
### Aliases: reannualize reannualize.sr reannualize.sropt

### ** Examples

# compute a 'daily' Sharpe
mysr <- as.sr(rnorm(253*8),ope=1,epoch="day")
# turn into annual 
mysr2 <- reannualize(mysr,new.ope=253,new.epoch="yr")

# for sropt
ope <- 253
zeta.s <- 1.0  
df1 <- 10
df2 <- 6 * ope
rvs <- rsropt(1,df1,df2,zeta.s,ope,drag=0)
roll.own <- sropt(z.s=rvs,df1,df2,drag=0,ope=ope,epoch="yr")
# make 'monthly'
roll.monthly <- reannualize(roll.own,new.ope=21,new.epoch="mo.")
# make 'daily'
roll.daily <- reannualize(roll.own,new.ope=1,new.epoch="day")



