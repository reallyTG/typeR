library(easyreg)


### Name: regtest
### Title: Test of models and parameters
### Aliases: regtest

### ** Examples

x=c(1,1,1,2,2,2,3,3,3,4,4,4)
y=c(5,5.3,6,8,8.9,12,14,18,25,25,29,32)
t=c("t1","t2","t3","t1","t2","t3","t1","t2","t3","t1","t2","t3")
data=data.frame(x,t,y)
# linear
regtest(data, model=1)
# quadratic
regtest(data, model=2)
# exponential
regtest(data, model=6)
# ... etc




