library(Momocs)


### Name: hcontrib
### Title: Harmonic contribution to shape
### Aliases: hcontrib hcontrib.OutCoe

### ** Examples

data(bot)
bot.f <- efourier(bot, 12)
hcontrib(bot.f)
hcontrib(bot.f, harm.r=3:10, amp.r=1:8, col="grey20",
   main="A huge panel")



