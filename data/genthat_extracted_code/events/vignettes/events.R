### R code from vignette source 'events.Rnw'

###################################################
### code chunk number 1: load.library
###################################################
library(events)


###################################################
### code chunk number 2: read.data
###################################################
data("balkans.weis")
summary(balkans.weis)


###################################################
### code chunk number 3: show.data
###################################################
head(balkans.weis)


###################################################
### code chunk number 4: one.a.day
###################################################
dd1 <- one_a_day(balkans.weis)


###################################################
### code chunk number 5: actors
###################################################
head(actors(dd1))


###################################################
### code chunk number 6: filter.actors
###################################################
dd2 <- filter_actors(dd1, fun=spotter("SER", "SERMIL", "BOS", "BOSMIL"))


###################################################
### code chunk number 7: aggregate.actors
###################################################
actor.agg <- list(ser=c("SER", "SERMIL"), bos=c("BOS", "BOSMIL"))
dd3 <- map_actors(dd2, fun=actor.agg)


###################################################
### code chunk number 8: filter.time
###################################################
dd4 <- filter_time(dd3, start="1991-01-01", end="1995-12-30")


###################################################
### code chunk number 9: summary
###################################################
summary(dd4)


###################################################
### code chunk number 10: intro.scaling
###################################################
data("weis.goldstein.scale")
summary(weis.goldstein.scale)


###################################################
### code chunk number 11: add.scale
###################################################
dd5 <- add_eventscale(dd4, weis.goldstein.scale)
head(dd5)


###################################################
### code chunk number 12: aggregate.scores
###################################################
dyads <- make_dyads(dd5, scale="goldstein", unit="week", monday=TRUE, 
		fun=sum, missing.data=0)


###################################################
### code chunk number 13: dyads
###################################################
tail(dyads$ser.bos)


###################################################
### code chunk number 14: serbos
###################################################
with(dyads$ser.bos, plot(goldstein ~ date, type="l", lwd=2))


###################################################
### code chunk number 15: gaps
###################################################
scale_coverage(weis.goldstein.scale, dd5)


###################################################
### code chunk number 16: event.aggregation
###################################################
evts <- codes(dd4)
event.agg <- list(
    coop.verb=grep("02.|03.|04.|05.|08.|09.|10.", evts, value=TRUE),
    coop.mat=grep("01.|06.|07.", evts, value=TRUE),
    conf.verb=grep("11.|12.|13.|14.|15.|16.|17.", evts, value=TRUE),
    conf.mat=grep("18.|19.|20.|21.|22.", evts, value=TRUE)
)
dc1 <- map_codes(dd4, fun=event.agg)


###################################################
### code chunk number 17: make.dyads
###################################################
dyad.counts <- make_dyads(dc1, scale=NULL, unit="week", monday=TRUE, 
		fun=sum, missing.data=0)
tail(dyad.counts$ser.bos)


