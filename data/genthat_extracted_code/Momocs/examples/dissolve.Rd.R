library(Momocs)


### Name: dissolve
### Title: Dissolve Coe objects
### Aliases: dissolve

### ** Examples

data(bot)
w <- filter(bot, type=="whisky")
b <- filter(bot, type=="beer")
wf <- efourier(w, 10)
bf <- efourier(b, 10)
wbf <- combine(wf, bf)
dissolve(wbf, 1)
dissolve(wbf, 2)

# or using chop (yet combine here makes no sense)
bw <- bot %>% chop(~type) %>% lapply(efourier, 10) %>% combine
bw %>% dissolve(1)
bw %>% dissolve(2)



