library(RadOnc)


### Name: LQE
### Title: Linear Quadratic Extrapolated (LQE) Dose Conversion
### Aliases: LQE LQE-methods LQE,ANY,missing-method
###   LQE,DVH.list,numeric-method LQE,DVH,numeric-method
###   LQE,numeric,numeric-method
### Keywords: methods manip

### ** Examples

# 5x 300cGy == 9x 200cGy (1800cGy isoeffective dose)
LQE(1500, aB=3, fractions=c(300, 200), dose.units="cGy")
LQE(15, aB=3, N=c(5, 9), dose.units="Gy")
LQE(18, aB=3, fractions=c(2, 3), dose.units="Gy")

# Multiple simultaneous numerical queries
LQE(c(4500, 5400), aB=3, fractions=c(300, 200), dose.units="cGy")

# DVH processing
LQE(janedoe[["LIVER"]],aB=3,fractions=200,dose.units="cGy")

# DVH list processing (default dose.units is "cGy")
plot(janedoe)
plot(LQE(janedoe,aB=3,fractions=200),col="red",new=FALSE)



