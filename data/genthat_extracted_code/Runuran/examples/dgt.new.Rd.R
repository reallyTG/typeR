library(Runuran)


### Name: dgt.new
### Title: UNU.RAN generator based on table guided discrete inversion (DGT)
### Aliases: dgt.new dgtd.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a 
## binomial distribution with size=115, prob=0.5
gen <- dgt.new(pv=dbinom(0:115,115,0.5),from=0)
x <- ur(gen,100)

## Alternative approach
distr <- udbinom(size=100,prob=0.3)
gen <- dgtd.new(distr)
x <- ur(gen,100)




