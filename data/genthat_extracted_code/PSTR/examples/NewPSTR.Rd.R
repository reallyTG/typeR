library(PSTR)


### Name: NewPSTR
### Title: Create an object of the class PSTR.
### Aliases: NewPSTR
### Keywords: initialization

### ** Examples

pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala','debta'), iT=14)

pstr

print(pstr,"summary")




