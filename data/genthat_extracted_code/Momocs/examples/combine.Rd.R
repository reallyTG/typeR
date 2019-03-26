library(Momocs)


### Name: combine
### Title: Combine several objects
### Aliases: combine

### ** Examples

w <- filter(bot, type=="whisky")
b <- filter(bot, type=="beer")
combine(w, b)
# or, if you have many levels
bot_s <- chop(bot, ~type)
bot_s$whisky
# note that you can apply something (single function or a more
# complex pipe) then combine everyone, since combine also works on lists
# eg:
# bot_s2 <- lapply(bot_s, efourier, 10)
# bot_sf <- combine(bot_s2)

# pipe style
lapply(bot_s, efourier, 10) %>% combine()



