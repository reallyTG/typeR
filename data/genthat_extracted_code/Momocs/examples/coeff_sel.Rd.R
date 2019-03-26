library(Momocs)


### Name: coeff_sel
### Title: Helps to select a given number of harmonics from a numerical
###   vector.
### Aliases: coeff_sel

### ** Examples

bot.f <- efourier(bot, 32)
coe <- bot.f$coe # the raw matrix
coe
# if you want, say the first 8 harmonics but not the first one
retain <- coeff_sel(retain=8, drop=1, nb.h=32, cph=4)
head(coe[, retain])



