library(Momocs)


### Name: perm
### Title: Permutes and breed Coe (and others) objects
### Aliases: perm perm.default perm.Coe

### ** Examples

m <- matrix(1:12, nrow=3)
m
perm(m, margin=2, size=5)
perm(m, margin=1, size=10)

bot.f <- efourier(bot, 12)
bot.m <- perm(bot.f, 80)
bot.m



