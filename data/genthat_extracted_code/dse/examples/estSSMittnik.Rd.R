library(dse)


### Name: estSSMittnik
### Title: Estimate a State Space Model
### Aliases: estSSMittnik
### Keywords: ts

### ** Examples

    data("egJofF.1dec93.data", package="dse")
    # this prints information about singular values and prompts with
    #Enter the number of singular values to use for balanced model:
    ## No test: 
model <- estSSMittnik(egJofF.1dec93.data)
## End(No test)
    # the choice is difficult in this example. 
    model <- estSSMittnik(egJofF.1dec93.data, n=3)



