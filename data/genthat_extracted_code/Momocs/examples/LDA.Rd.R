library(Momocs)


### Name: LDA
### Title: Linear Discriminant Analysis on Coe objects
### Aliases: LDA LDA.default LDA.PCA

### ** Examples

bot.f <- efourier(bot, 24)
bot.p <- PCA(bot.f)
LDA(bot.p, 'type', retain=0.99) # retains 0.99 of the total variance
LDA(bot.p, 'type', retain=5) # retain 5 axis
bot.l <- LDA(bot.p, 'type', retain=0.99)
bot.l
plot(bot.l)
bot.f$fac$plop <- factor(rep(letters[1:4], each=10))
bot.l <- LDA(PCA(bot.f), 'plop')
bot.l
plot(bot.l)



