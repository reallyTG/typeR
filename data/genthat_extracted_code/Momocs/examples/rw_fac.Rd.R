library(Momocs)


### Name: rw_fac
### Title: Renames levels on Momocs objects
### Aliases: rw_fac

### ** Examples

# single renaming
rw_fac(bot, "type", "whisky", "agua_de_fuego")$type # 1 instead of "type" is fine too
# several renaming
bot2 <- mutate(bot, fake=factor(rep(letters[1:4], 10)))
rw_fac(bot2, "fake", c("a", "e"), "ae")$fake



