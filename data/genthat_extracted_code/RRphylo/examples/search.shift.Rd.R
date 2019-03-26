library(RRphylo)


### Name: search.shift
### Title: Locating shifts in phenotypic evolutionary rates
### Aliases: search.shift

### ** Examples

data("DataOrnithodirans")
DataOrnithodirans$treedino->treedino
DataOrnithodirans$massdino->massdino
DataOrnithodirans$statedino->statedino

## No test: 
    RRphylo(tree=treedino,y=massdino)->dinoRates

# Case 1. Without accounting for the effect of a covariate

 # Case 1.1 "clade" condition
  # with auto.recognize
    search.shift(dinoRates,auto.recognize="yes",test.single= "no",
    status.type= "clade",foldername=tempdir())
  # testing two hypothetical clades
    search.shift(dinoRates,auto.recognize= "no",test.single= "yes",
    status.type= "clade", node=c(697,746),foldername=tempdir())

 # Case 1.2 "sparse" condition
  # testing the sparse condition.
    search.shift(dinoRates,auto.recognize= "no",test.single= "no",
    status.type= "sparse", state=statedino,foldername=tempdir())


# Case 2. Accounting for the effect of a covariate

 # Case 2.1 "clade" condition
    search.shift(dinoRates,auto.recognize= "yes",test.single= "no",
    status.type= "clade", cov=massdino,foldername=tempdir())

 # Case 2.2 "sparse" condition
    search.shift(dinoRates,status.type="sparse",state=statedino,cov=massdino,foldername=tempdir())
    
## End(No test)



