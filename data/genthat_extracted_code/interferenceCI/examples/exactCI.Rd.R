library(interferenceCI)


### Name: exactCI
### Title: Exact confidence intervals for treatment effects on a binary
###   outcome in a two-stage randomized experiment with interference
### Aliases: exactCI
### Keywords: interference randomization based inference exact confidence
###   interval

### ** Examples

#Made up example with 10 groups of 10 where half are randomized to a0 and half to a1
#a0 is assign 3 of 10 to treatment and half to a1 is assign 6 of 10 to treatment
d = c(1,1,5,3,0,6,3,1,0,4,3,3,0,5,3,2,1,1,5,3,2,2,4,2,1,5,2,2,2,3,4,1,1,1,5,3,1,5,2,2)
data.ex = array(d,c(2,2,10))
assign.ex = c(1,0,0,0,1,1,0,1,1,0)

#Inference for overall effect
l1 = exactCI('OE',assign.ex,data.ex,rep(3,10),rep(6,10),100,100,0.05)

#Check algorithm using a plot
plot(l1$effect,l1$p)




