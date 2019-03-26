library(Momocs)


### Name: MANOVA
### Title: Multivariate analysis of (co)variance on Coe objects
### Aliases: MANOVA MANOVA.OpnCoe MANOVA.OutCoe MANOVA.PCA

### ** Examples

# MANOVA
bot.p <- PCA(efourier(bot, 12))
MANOVA(bot.p, 'type')

op <- PCA(npoly(olea, 5))
MANOVA(op, 'domes')

 m <- manova(op$x[, 1:5] ~  op$fac$domes * op$fac$var)
 summary(m)
 summary.aov(m)

 # MANCOVA example
 # we create a numeric variable, based on centroid size
 bot %<>% mutate(cs=coo_centsize(.))
 # same pipe
 bot %>% efourier %>% PCA %>% MANOVA("cs")




