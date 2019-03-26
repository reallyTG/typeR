library(RMark)


### Name: edwards.eberhardt
### Title: Rabbit capture-recapture data
### Aliases: edwards.eberhardt
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
#
# get data
#
data(edwards.eberhardt)
#
# create function that defines and runs the analyses as defined in 
# MARK example dbf file
#
run.edwards.eberhardt=function()
{
#
#  Define parameter models
#
pdotshared=list(formula=~1,share=TRUE)
ptimeshared=list(formula=~time,share=TRUE)
ptime.c=list(formula=~time+c,share=TRUE)
ptimemixtureshared=list(formula=~time+mixture,share=TRUE)
pmixture=list(formula=~mixture)
#
# Run assortment of models
#
#
#   Capture Closed models
#
#  constant p=c
ee.closed.m0=mark(edwards.eberhardt,model="Closed",
                   model.parameters=list(p=pdotshared))
#  constant p and constant c but different
ee.closed.m0c=mark(edwards.eberhardt,model="Closed")
#  time varying p=c
ee.closed.mt=mark(edwards.eberhardt,model="Closed",
                   model.parameters=list(p=ptimeshared))
#
#  Closed heterogeneity models
#
#  2 mixtures Mh2
ee.closed.Mh2=mark(edwards.eberhardt,model="HetClosed",
                   model.parameters=list(p=pmixture))
#  Closed Mth2 - p different for time; mixture additive
ee.closed.Mth2.additive=mark(edwards.eberhardt,model="FullHet",
                   model.parameters=list(p=ptimemixtureshared),adjust=TRUE)
#
#    Huggins models
#
# p=c constant over time
ee.huggins.m0=mark(edwards.eberhardt,model="Huggins",
                   model.parameters=list(p=pdotshared))
# p constant c constant but different; this is default model for Huggins
ee.huggins.m0.c=mark(edwards.eberhardt,model="Huggins")
# Huggins Mt
ee.huggins.Mt=mark(edwards.eberhardt,model="Huggins",
                   model.parameters=list(p=ptimeshared),adjust=TRUE)
#
#    Huggins heterogeneity models
#
#  Mh2 - p different for mixture
ee.huggins.Mh2=mark(edwards.eberhardt,model="HugHet",
                   model.parameters=list(p=pmixture))
#  Huggins Mth2 - p different for time; mixture additive
ee.huggins.Mth2.additive=mark(edwards.eberhardt,model="HugFullHet",
                   model.parameters=list(p=ptimemixtureshared),adjust=TRUE)
#
# Return model table and list of models
#
return(collect.models() )
}
#
# fit models in mark by calling function created above
#
ee.results=run.edwards.eberhardt()
## End(No test)



