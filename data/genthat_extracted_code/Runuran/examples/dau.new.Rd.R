library(Runuran)


### Name: dau.new
### Title: UNU.RAN generator based on the Alias method (DAU)
### Aliases: dau.new daud.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a 
## binomial distribution with size=115, prob=0.5
gen <- dau.new(pv=dbinom(0:115,115,0.5), from=0)
x <- ur(gen,100)

## Alternative approach
distr <- udbinom(size=100,prob=0.3)
gen <- daud.new(distr)
x <- ur(gen,100)




