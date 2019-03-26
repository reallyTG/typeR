library(Momocs)


### Name: plot.LDA
### Title: Plots Linear Discriminant Analysis
### Aliases: plot.LDA

### ** Examples

bot.f <- efourier(bot, 24)
bot.l <- LDA(PCA(bot.f), "type")
plot(bot.l)

bot.f$fac$fake <- factor(rep(letters[1:4], each=10))
bot.l <- LDA(PCA(bot.f), "fake")
plot(bot.l)



