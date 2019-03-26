library(VGAM)


### Name: sm.os
### Title: Defining O'Sullivan Spline Smooths in VGAM Formulas
### Aliases: sm.os
### Keywords: models regression smooth

### ** Examples

sm.os(runif(20))

## Not run: 
##D data("TravelMode", package = "AER")  # Need to install "AER" first
##D air.df <- subset(TravelMode, mode == "air")  # Form 4 smaller data frames
##D bus.df <- subset(TravelMode, mode == "bus")
##D trn.df <- subset(TravelMode, mode == "train")
##D car.df <- subset(TravelMode, mode == "car")
##D TravelMode2 <- data.frame(income     = air.df$income,
##D                           wait.air   = air.df$wait  - car.df$wait,
##D                           wait.trn   = trn.df$wait  - car.df$wait,
##D                           wait.bus   = bus.df$wait  - car.df$wait,
##D                           gcost.air  = air.df$gcost - car.df$gcost,
##D                           gcost.trn  = trn.df$gcost - car.df$gcost,
##D                           gcost.bus  = bus.df$gcost - car.df$gcost,
##D                           wait       = air.df$wait)  # Value is unimportant
##D TravelMode2$mode <- subset(TravelMode, choice == "yes")$mode  # The response
##D TravelMode2 <- transform(TravelMode2, incom.air = income, incom.trn = 0,
##D                                       incom.bus = 0)
##D set.seed(1)
##D TravelMode2 <- transform(TravelMode2,
##D                          junkx2 = runif(nrow(TravelMode2)))
##D 
##D tfit2 <-
##D   vgam(mode ~ sm.os(gcost.air, gcost.trn, gcost.bus) + ns(junkx2, 4) +
##D               sm.os(incom.air, incom.trn, incom.bus) + wait ,
##D        crit = "coef",
##D        multinomial(parallel = FALSE ~ 1), data = TravelMode2,
##D        xij = list(sm.os(gcost.air, gcost.trn, gcost.bus) ~
##D                   sm.os(gcost.air, gcost.trn, gcost.bus) +
##D                   sm.os(gcost.trn, gcost.bus, gcost.air) +
##D                   sm.os(gcost.bus, gcost.air, gcost.trn),
##D                   sm.os(incom.air, incom.trn, incom.bus) ~
##D                   sm.os(incom.air, incom.trn, incom.bus) +
##D                   sm.os(incom.trn, incom.bus, incom.air) +
##D                   sm.os(incom.bus, incom.air, incom.trn),
##D                   wait   ~  wait.air +  wait.trn +  wait.bus),
##D        form2 = ~  sm.os(gcost.air, gcost.trn, gcost.bus) +
##D                   sm.os(gcost.trn, gcost.bus, gcost.air) +
##D                   sm.os(gcost.bus, gcost.air, gcost.trn) +
##D                   wait +
##D                   sm.os(incom.air, incom.trn, incom.bus) +
##D                   sm.os(incom.trn, incom.bus, incom.air) +
##D                   sm.os(incom.bus, incom.air, incom.trn) +
##D                   junkx2 + ns(junkx2, 4) +
##D                   incom.air + incom.trn + incom.bus +
##D                   gcost.air + gcost.trn + gcost.bus +
##D                   wait.air +  wait.trn +  wait.bus)
##D par(mfrow = c(2, 2))
##D plot(tfit2, se = TRUE, lcol = "orange", scol = "blue", ylim = c(-4, 4))
##D summary(tfit2)
## End(Not run)



