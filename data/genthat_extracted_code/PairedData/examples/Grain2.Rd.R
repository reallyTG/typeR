library(PairedData)


### Name: Grain2
### Title: Wheat grain data from Preece (1982, Table 12)
### Aliases: Grain2
### Keywords: datasets

### ** Examples

data(Grain2)

# A very small data set
print(Grain2)

# The paired t test is the test of the differences
with(Grain2,t.test(Variety_1,Variety_2,paired=TRUE))
with(Grain2,t.test(Variety_1-Variety_2))

# The data are actually rounded to the nearest integer
# So they can be somewhere between +0.5 or -0.5
# and thus the differences between +1 or -1
# The possible t values can be simulated by:
simulating.t<-numeric(1000)
for(i in 1:1000){
simulating.t[i]<-with(Grain2,t.test(Variety_1-Variety_2+runif(6,-1,1)))$stat
}
hist(simulating.t)
abline(v=with(Grain2,t.test(Variety_1-Variety_2))$stat,lty=2)



