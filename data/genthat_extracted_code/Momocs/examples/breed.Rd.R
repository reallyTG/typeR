library(Momocs)


### Name: breed
### Title: Jitters Coe (and others) objects
### Aliases: breed breed.default breed.Coe

### ** Examples

m <- matrix(1:12, nrow=3)
breed(m, margin=2, size=4)
breed(m, margin=1, size=10)

bot.f <- efourier(bot, 12)
bot.m <- breed(bot.f, size=80)
bot.m %>% PCA %>% plot

# breed fac wise
# bot.f %>%  breed(~type, size=50) %>% PCA %>% plot(~type)



