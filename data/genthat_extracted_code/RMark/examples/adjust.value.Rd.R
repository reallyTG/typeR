library(RMark)


### Name: adjust.value
### Title: Adjust over-dispersion scale or a result value such as effective
###   sample size
### Aliases: adjust.value adjust.chat
### Keywords: utility

### ** Examples


#
# The following are examples only to demonstrate selecting different 
# model sets for adjusting chat and showing model selection table. 
# It is not a realistic analysis.
#
## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
do_example=function()
{
mod1=mark(dipper)
mod2=mark(dipper,model.parameters=list(Phi=list(formula=~time)))
mod3=mark(dipper,model="POPAN",initial=1)
cjs.results=collect.models(type="CJS")
cjs.results  # show model selection results for "CJS" models
}
cjs.results=do_example()
cjs.results
# adjust chat for all models to 2
cjs.results=adjust.chat(2,cjs.results) 
cjs.results
## End(No test)



