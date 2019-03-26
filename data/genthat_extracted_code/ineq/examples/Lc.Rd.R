library(ineq)


### Name: Lc
### Title: Lorenz Curve
### Aliases: Lc
### Keywords: misc

### ** Examples

## Load and attach income (and metadata) set from Ilocos, Philippines
data(Ilocos)
attach(Ilocos)
## extract and rescale income for the provinces "Pangasinan" und "La Union"
income.p <- income[province=="Pangasinan"]/10000
income.u <- income[province=="La Union"]/10000

## compute the Lorenz curves
Lc.p <- Lc(income.p)
Lc.u <- Lc(income.u)
## it can be seen the the inequality in La Union is higher than in
## Pangasinan because the respective Lorenz curve takes smaller values.
plot(Lc.p)
lines(Lc.u, col=2)
## the picture becomes even clearer with generalized Lorenz curves
plot(Lc.p, general=TRUE)
lines(Lc.u, general=TRUE, col=2)
## inequality measures emphasize these results, e.g. Atkinson's measure
ineq(income.p, type="Atkinson")
ineq(income.u, type="Atkinson")
## or Theil's entropy measure
ineq(income.p, type="Theil", parameter=0)
ineq(income.u, type="Theil", parameter=0)



# income distribution of the USA in 1968 (in 10 classes)
# x vector of class means, n vector of class frequencies
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
n <- c(482, 825, 722, 690, 661, 760, 745, 2140, 1911, 1024)

# compute minimal Lorenz curve (= no inequality in each group)
Lc.min <- Lc(x, n=n)
# compute maximal Lorenz curve (limits of Mehran)
Lc.max <- Lc.mehran(x,n)
# plot both Lorenz curves in one plot
plot(Lc.min)
lines(Lc.max, col=4)

# add the theoretic Lorenz curve of a Lognormal-distribution with variance 0.78
lines(Lc.lognorm, parameter=0.78)
# add the theoretic Lorenz curve of a Dagum-distribution
lines(Lc.dagum, parameter=c(3.4,2.6))



