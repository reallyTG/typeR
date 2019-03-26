library(doremi)


### Name: generate.excitation
### Title: Excitation signal generation
### Aliases: generate.excitation
### Keywords: excitation, simulation

### ** Examples

generate.excitation (amplitude = 3,
                     nexc = 6,
                     duration = 2,
                     deltatf = 1,
                     tmax = 200,
                     minspacing = 2)
#Vector of length 201 (deltatf x tmax + 1 as it includes 0 as initial time value)
generate.excitation (amplitude = c(1,10,20),
                     nexc = 3,
                     duration = c(1,2,4),
                     deltatf = 0.5,
                     tmax = 100,
                     minspacing = 10)



