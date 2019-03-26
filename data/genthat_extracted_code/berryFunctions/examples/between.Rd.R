library(berryFunctions)


### Name: between
### Title: Are values between a and b?
### Aliases: between
### Keywords: logic

### ** Examples

between(1:10, 4, 8)
between(1:10, 4:8) # range as vector
between(1:10, 8, 4) # warns about interval

data.frame( incl.T=between(1:10, 4, 8),
            incl.F=between(1:10, 4, 8,  incl=FALSE),
           aincl.F=between(1:10, 4, 8, aincl=FALSE),
           bincl.F=between(1:10, 4, 8, bincl=FALSE)  )




