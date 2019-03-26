library(apTreeshape)


### Name: likelihood.test
### Title: Test the Yule model vs PDA (uniform) model.
### Aliases: likelihood.test
### Keywords: htest

### ** Examples


## Generate a Yule tree with 150 tips. Is it likely to be fitting the PDA model?
likelihood.test(ryule(150),model="pda") 
## The p.value is close from 0. We reject the PDA hypothesis.

## Test on the Carnivora tree: is it likely to be fitting the Yule model?
data(carnivora.treeshape)
likelihood.test(carnivora.treeshape) 
## The p.value is high, so it's impossible to reject the Yule hypothesis.



