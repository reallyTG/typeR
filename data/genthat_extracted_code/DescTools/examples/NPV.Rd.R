library(DescTools)


### Name: NPV
### Title: Short Selection of Financial Mathematical Functions
### Aliases: NPV IRR OPR NPVFixBond YTM
### Keywords: arith

### ** Examples

# one root
IRR(cf <- c(-900, -250+450-90, 460-100, 500-120, 550-140))
# several IRR solutions
IRR(cf = c(-100, 500, -600))
# no solution
IRR(cf = c(-100, 400, -600))
# negative and huge solution
IRR(cf = c(-100, 1000, -600), interval = c(-1.5, 1000))



