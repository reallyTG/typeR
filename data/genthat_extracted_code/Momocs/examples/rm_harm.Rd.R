library(Momocs)


### Name: rm_harm
### Title: Removes harmonics from Coe objects
### Aliases: rm_harm

### ** Examples

data(bot)
bf <- efourier(bot)
colnames(rm_harm(bf, 1)$coe)



