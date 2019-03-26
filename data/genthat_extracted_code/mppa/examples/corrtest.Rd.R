library(mppa)


### Name: corrtest
### Title: A test for dependence between two point processes on the real
###   line.
### Aliases: corrtest

### ** Examples

A = runif(20)
Braw=runif(20)
##around ten B events are caused by A 
B1=c(Braw, sample(A, 10)+abs(rnorm(10, 0,.01))); B1 = B1[B1>0&B1<1]
##about ten B events are correlated to A
B2=c(Braw, sample(A, 10)+rnorm(10, 0,.01)); B2 = B2[B2>0&B2<1]
##the ten closest B events to A are deleted (anticorrelation)
d=sapply(Braw, function(b) min(abs(b-A))); B3=Braw[-order(d)[1:10]]
##The ten B events that are closest to but after an A event are deleted (inhibition).
##(Adding an A event at zero to be sure there are 10.)
A=c(0,A); d=sapply(Braw, function(b) b-max(A[A<b])); B4=Braw[-order(d)[1:10]]

alternatives=c("causes", "correlation", "anticorrelation", "inhibits")
ps=c()
for (B in list(B1, B2, B3, B4)){
    for (alternative in alternatives){
        p=corrtest(A,B, alternative=alternative)$p
        ps = c(ps, p)
    }
}
M=matrix(ps, nrow=4, ncol=4)
colnames(M) = c("causal_data", "correlated_data", "anticorrelated_data", "inhibited_data")
rownames(M) = c("causes_test", "correlation_test", "anticorrelation_test", "inhibition_test")
##should (hopefully!) see low p-values on the diagonal:
M
## and high p-values for opposite data versus test combinations,
## e.g. testing for A inhibiting B when in fact A causes B:
M["inhibition_test", "causal_data"]

##Now for a non-homogeneous example. A and B have a common daily pattern:
##their intensity is a sinusoidal curve lambda(t) = 1+sin(2*pi*t)
start=0; end=365 #A year
##the cumulative intensity is 
F=function(t){
    t%/%1+t%%1+(1-cos(2*pi*t%%1))/(2*pi)
}
##Dropping 365 A and B points according to F
A=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
##B is independent of A aside from common periodicity
B=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
##Bc also has some caused events
Bc=c(B, sample(A, 10)+abs(rnorm(10, 0,.001))); Bc = Bc[Bc>start&Bc<end]

##If we do not account for the common periodicity of A and B we get
##spuriously strong evidence for A causing B (using Fisher's method for speed):
corrtest(A,B, start=start, end=end, method="fisher")
##On the other hand with the correct F, the p-value is uniformly distributed:
corrtest(A,B, start=start, end=end, F=F, method="fisher")

##For reference, with the truly caused process Bc we get
corrtest(A,Bc, start=start, end=end, method="fisher")
corrtest(A,Bc, start=start, end=end, F=F, method="fisher")



