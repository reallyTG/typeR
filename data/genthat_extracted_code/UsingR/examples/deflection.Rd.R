library(UsingR)


### Name: deflection
### Title: Deflection under load
### Aliases: deflection
### Keywords: datasets

### ** Examples

data(deflection)
res = lm(Deflection ~ Load, data = deflection)
plot(Deflection ~ Load, data = deflection)
abline(res)			# looks good?
plot(res)



