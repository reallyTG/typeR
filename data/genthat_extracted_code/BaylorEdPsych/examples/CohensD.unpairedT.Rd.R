library(BaylorEdPsych)


### Name: CohensD.unpairedT
### Title: Cohen's d from an unpaired (indepednet samples) t-test
### Aliases: CohensD.unpairedT
### Keywords: Effect Size Cohen's d

### ** Examples

#Simulate data
set.seed(4565)
Treat<-rnorm(100,.5,1)
set.seed(45651)
Control<-rnorm(100,0,1)
t<-t.test(Treat,Control, var.equal = TRUE)$statistic
nt<-length(Treat)
nc<-length(Control)

CohensD.unpairedT(t, nt, nc)



