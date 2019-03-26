library(Momocs)


### Name: coo_extract
### Title: Extract coordinates from a shape
### Aliases: coo_extract

### ** Examples

b <- bot[1]
stack(bot)
stack(coo_sample(bot, 24))
coo_plot(b)
coo_plot(coo_sample(b, 24))
coo_extract(bot[1], c(3, 9, 12)) # or :
bot[1] %>% coo_extract(c(3, 9, 12))

coo_extract(bot, c(3, 5, 7))



