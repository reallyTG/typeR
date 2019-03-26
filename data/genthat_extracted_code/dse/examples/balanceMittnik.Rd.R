library(dse)


### Name: balanceMittnik
### Title: Balance a state space model
### Aliases: balanceMittnik SVDbalanceMittnik
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model <- toSS(TSmodel(estVARXls(eg1.DSE.data.diff)))
    # this prints information about singular values and prompts with
    #Enter the number of singular values to use for balanced model:
    ## No test: 
newmodel <-balanceMittnik(model)
## End(No test)
    # 18 might be a good choice in this example. 
    newmodel <-balanceMittnik(model, n=18)




