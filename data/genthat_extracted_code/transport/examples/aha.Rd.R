library(transport)


### Name: aha
### Title: Solve Transportation Problem by Aurenhammer-Hoffmann-Aronov
###   Method
### Aliases: aha transport_apply transport_error

### ** Examples

res <- aha(random32a$mass, random32b$mass)
plot(random32a, random32b, res, lwd=0.75)

aha(random64a$mass, random64b$mass, nscales=3, scmult=5, wasser.spt=512, approx=TRUE)



