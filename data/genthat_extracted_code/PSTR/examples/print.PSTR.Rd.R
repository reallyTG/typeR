library(PSTR)


### Name: print.PSTR
### Title: Print the object of the class PSTR.
### Aliases: print.PSTR
### Keywords: utils

### ** Examples

pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala','debta','cfa','sales'), iT=14)
print(pstr)
print(pstr, mode='summary',digits=2)



