library(UBL)


### Name: phi
### Title: Relevance function.
### Aliases: phi
### Keywords: relevance function

### ** Examples


# example of a relevance function where the extremes are the important values.
data(morley)
# the target variable
y <- morley$Speed

phiF.args <- phi.control(y,method="extremes",extr.type="both")
y.phi <- phi(y, control.parms=phiF.args)
plot(y, y.phi)




