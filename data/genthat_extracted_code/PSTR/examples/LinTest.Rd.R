library(PSTR)


### Name: LinTest
### Title: Conduct the linearity tests.
### Aliases: LinTest WCB_LinTest
### Keywords: specification

### ** Examples

pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala'), iT=14) # create a new PSTR object

pstr = LinTest(pstr)

print(pstr, "tests")

## No test: 
# Don't forget to attach the package for the parallel computation.
library(snowfall)

# you should not run this on personal computer!
# pstr = WCB_LinTest(use=pstr, iB=5000, parallel=TRUE, cpus=50)

# a light version for checking on your personal computer.
pstr = WCB_LinTest(use=pstr, iB=4, parallel=TRUE, cpus=2)

print(pstr, "tests")
## End(No test)




