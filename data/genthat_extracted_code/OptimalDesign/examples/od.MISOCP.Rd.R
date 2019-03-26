library(OptimalDesign)


### Name: od.MISOCP
### Title: Efficient exact design using mixed integer second-order cone
###   programming
### Aliases: od.MISOCP

### ** Examples

if(require("gurobi")){
# Consider a dose-response study where both efficacy and toxicity are 
# observed as 0/1 outcomes for each patient, where the probability of 
# the outcome 1 under the dose x is modeled by the logistic function: 
# exp(ae+be*x)/(1+exp(ae+be*x)) for the efficacy, and 
# exp(at+bt*x)/(1+exp(at+bt*x)) for the toxicity. We can choose the 
# doses x in the range 1 mg to 150 mgs. 
# The aim is to estimate the parameters ae,be using the D-optimal
# design, or using the A-optimal design. 

# Because this is a non-linear model, the optimal designs will depend 
# on the unknown values of the parameters. We will use the approach of 
# local optimality with the following nominal values of the parameters: 
tle <- c(-10, 0.2)
tlt <- c(-20, 0.2)

# It is simple to show that the localized information matrix for 
# (ae,be) is the information matrix of the standard model with 
# the following regressors:
F.logistic <- matrix(0, nrow=150, ncol=2)
for (i in 1:150) 
  F.logistic[i, ] <- 
        c(sqrt(exp(tle[1]+tle[2]*i))/(1+exp(tle[1]+tle[2]*i)), 
        i*sqrt(exp(tle[1]+tle[2]*i))/(1+exp(tle[1]+tle[2]*i)))
                       
# The constraints on the experiment are twofold: We can have at most 
# N=100 subjects and we also require that the expected number of 
# "failed" trials is at most 10. A trial is considered to be a failure 
# if it leads to either a toxic response, or if it is not efficacious. 
# These constraints can be expressed as A*w<=b:
efficacy.prob <- function(x) 
    exp(tle[1]+tle[2]*x)/(1+exp(tle[1]+tle[2]*x))
toxicity.prob <- function(x) 
    exp(tlt[1]+tlt[2]*x)/(1+exp(tlt[1]+tlt[2]*x))
failure.prob <- function(x) 
    1 - (1 - toxicity.prob(x)) * efficacy.prob(x)
b <- c(100, 10); A <- rbind(rep(1,150), failure.prob(1:150))

# Now we can compute the designs:
res.D <- od.MISOCP(F.logistic, b, A, crit="D")
res.A <- od.MISOCP(F.logistic, b, A, crit="A")

# Let us verify the quality of the designs by computing their efficiency 
# relative to the approximate optimal designs:
res.D$Phi.best / od.SOCP(F.logistic, b, A, crit="D")$Phi.best
res.A$Phi.best / od.SOCP(F.logistic, b, A, crit="A")$Phi.best

# We can plot the failure probability curve (red), the toxicity 
# probability curve (black), the efficacy probability curve (green), 
# the D-optimal design (orange) and the A-optimal design (blue):
plot(failure.prob(1:150), type="l", 
     ylab="probability / proportion of subjects", 
     lwd=3, col="red")
lines(toxicity.prob(1:150), col="black")
lines(efficacy.prob(1:150), col="green")
lines(res.D$w.best/100, type="h", col="orange")
lines(res.D$w.best/100, type="h", col="orange", lwd=2)
lines(res.A$w.best/100, type="h", col="blue", lwd=2)

# Note that both designs perform the observations generally at two 
# different levels, one of which is a dose which leads to a 50-percent 
# failure of efficacy. Based on these designs, none of the patients 
# are put on dangerously high levels of doses.
}



