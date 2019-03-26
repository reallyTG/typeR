library(PSTR)


### Name: EstPSTR
### Title: Estimate the PSTR model.
### Aliases: EstPSTR
### Keywords: estimation

### ** Examples

## No test: 
pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala'), iT=14) # create a new PSTR object

# estimate a linear panel regression model
pstr = EstPSTR(use=pstr)
print(pstr, "estimates", digits=6)

# "L-BFGS-B" is used by default
pstr = EstPSTR(use=pstr, im=1, iq=1, useDelta=TRUE, par=c(1.6,.5), vLower=4, vUpper=4)
# You can also choose the method yourself.
pstr = EstPSTR(use=pstr, im=1, iq=1, useDelta=TRUE, par=c(1.6,.5), method='CG')

print(pstr, "estimates", digits=6)

# The estimation of a linear panel regression model with fix effects is also implemented.
pstr0 = EstPSTR(use=pstr)

print(pstr0,"estimates")
## End(No test)




