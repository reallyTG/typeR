library(Momocs)


### Name: fac_dispatcher
### Title: Brew and serve fac from Momocs object
### Aliases: fac_dispatcher

### ** Examples


bot <- mutate(bot, s=rnorm(40), fake=factor(rep(letters[1:4], 10)))

# factor, on the fly
fac_dispatcher(bot, factor(rep(letters[1:4], 10)))

# column id
fac_dispatcher(bot, 1)

# column name
fac_dispatcher(bot, "type")
# same, numeric case
fac_dispatcher(bot, "s")

# formula interface
fac_dispatcher(bot, ~type)

# formula interface + interaction on the fly
fac_dispatcher(bot, ~type+fake)



