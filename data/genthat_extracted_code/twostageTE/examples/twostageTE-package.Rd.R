library(twostageTE)


### Name: twostageTE
### Title: Threshold value estimation using two-stage plans
### Aliases: twostageTE-package twostageTE
### Keywords: package

### ** Examples

## Simulating the (wiggly) isotonic Sine function ##
sampleData=function(n, lower, upper) {
x=runif(n, lower, upper)
y=(1/40)*sin(6*pi*x) + 1/4 + x/2 + (1/4)*x^2
+ rnorm(n=length(x), sd=0.1)
return(list(X=x, Y=y))
}
Budget=100
d0=0.5
threshold = (1/40)*sin(6*pi*d0) + 1/4 + d0/2 + (1/4)*d0^2

n1=floor(Budget*0.25)
n2=Budget - n1
samp = sampleData(n1, lower=0, upper=1)
X = samp$X
Y = samp$Y
## Two Stage IR+IR ##
stageOne_IR=stageOneAnalysis(X, Y, threshold, type="IR-wald", 0.99)
samp2 = sampleData(n2, lower=stageOne_IR$L1, upper=stageOne_IR$U1)
X2 = samp2$X
Y2 = samp2$Y
twoStageIR = stageTwoAnalysis(stageOne_IR, X2, Y2, type="IR-wald", 0.95)
## Two Stage LR+LR ##
stageOne_LR=stageOneAnalysis(X, Y, threshold, type="IR-likelihood", 0.99)
samp2 = sampleData(n2, lower=stageOne_LR$L1, upper=stageOne_LR$U1)
X2 = samp2$X
Y2 = samp2$Y
twoStageLR = stageTwoAnalysis(stageOne_LR, X2, Y2, 
    type="IR-likelihood", 0.95)
## Two Stage IR+Local Linear ##
X2 = c(rep(stageOne_IR$L1,37),rep(stageOne_IR$U1,38))
Y2=X2^2+rnorm(n=length(X2), sd=0.1)
twoStageLinear=stageTwoAnalysis(stageOne_IR, explanatory = X2, response = Y2,
    type = "locLinear", level = 0.95)



