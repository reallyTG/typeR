library(dae)


### Name: strength
### Title: Generate paper strength values
### Aliases: strength
### Keywords: datagen design

### ** Examples

## Here temperature is a factor with 4*3 = 12 values whose
## first 3 values specify the temperatures to be applied in
## the 3 runs on the first day, values 4 to 6 specify the
## temperatures for the 3 runs on day 2, and so on.
temperature <- factor(rep(c(80,85,90), 4))
exp.strength <- strength(nodays = 4, noruns = 3,
                         temperature = temperature, ident = 0123456)

## In this second example, a completely randomized design is generated 
## for the same 3 temperatures replicated 4 times. The layout is stored 
## in the data.frame called Design.
Design <- designRandomize(allocated = temperature, 
                          recipient = list(runs = 12), 
                          seed = 5847123)
## eradicate the unrandomized version of temperature
remove("temperature")

## The 12 temperatures in Design are to be regarded as being assigned to 
## days and runs in the same manner as for the first example.
exp.strength <- strength(nodays = 4, noruns = 3,
                         temperature = Design$temperature, ident = 0123456)



