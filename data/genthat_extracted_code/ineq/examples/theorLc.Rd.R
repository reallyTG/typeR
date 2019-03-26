library(ineq)


### Name: theorLc
### Title: Theoretical Lorenz Curves
### Aliases: theorLc Lc.dagum Lc.singh Lc.pareto Lc.lognorm Lc.exp
### Keywords: misc

### ** Examples

## Load and attach income (and metadata) set from Ilocos, Philippines
data(Ilocos)
attach(Ilocos)
## extract income for the province "Pangasinan"
income.p <- income[province=="Pangasinan"]

## plot empirical Lorenz curve and add theoretical Lorenz curve of
## a lognormal distribution with an estimate of the standard
## deviation parameter
Lc.p <- Lc(income.p)
plot(Lc.p)
lines(Lc.lognorm, parameter=sd(log(income.p)), col=4)



# vector of percentages
p <- (1:10)*0.1
# compute values of theoretic Lorenz curve of a Dagum-distribution
Lc.dagum(p, parameter=c(3.4,2.6))
# or
mydagum <- theorLc(type="Dagum", parameter=c(3.4,2.6))
mydagum(p)



