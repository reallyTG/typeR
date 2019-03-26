library(hedgehog)


### Name: gen-element
### Title: Random Sample Generation
### Aliases: gen-element gen.element gen.int gen.choice gen.subsequence
###   gen.sample gen.sample.int

### ** Examples

gen.element(1:10)   # a number
gen.element(c(TRUE,FALSE)) # a boolean
gen.int(10) # a number up to 10
gen.choice(gen.element(1:10), gen.element(letters))
gen.choice(NaN, Inf, gen.unif(-10, 10), prob = c(1,1,10))
gen.subsequence(1:10)




