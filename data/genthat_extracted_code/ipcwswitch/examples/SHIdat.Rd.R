library(ipcwswitch)


### Name: SHIdat
### Title: A real example dataset from the randomized clinical trial SHIVA
### Aliases: SHIdat
### Keywords: datasets

### ** Examples

## No test: 
# To obtain the times parameter, we can apply the timesTokeep function on the same
# dataframe in the wide format
# names of the repeated measurements
vect.ps   <- c("myps.v2", "ps.v3", c(paste("ps1.v", seq(1,21), sep="")))
vect.ttc  <- c("myttc.v2", "ttc.v3", c(paste("ttc1.v", seq(1,21), sep="")))
vect.tran <- c("mytran.v1", paste("tran.v", seq(2,21), sep=""))
# corresponding dates
dates <- c("dexac.v2", "dexac.v3", c(paste("dexac1.v", seq(21), sep="")))
dates2 <- dates[!(dates %in% c("dexac.v2","dexac.v3"))]

# times to keep
kept.t <- timesTokeep(SHIdat, id = "id",
                       tstart = "dexac.v2", tstop = "ddn",
                       mes.cov = list(vect.ps, vect.ttc, vect.tran),
                       time.cov = list(dates, dates, dates2))
# Now, we can build the long format
SHIlong <- wideToLongTDC(SHIdat, id = "id",
                         tstart = "dexac.v2", tstop = "ddn",
                         event = "status",
                         bas.cov = c("agerand", "sex.f","tt_Lnum", "rmh_alea.c", "pathway.f",
                         "bras.f","debttCO","ddt.v1", "datt"),
                         mes.cov = list(f1=vect.ps, f2=vect.ttc, f3=vect.tran),
                         time.cov = list(dates, dates, dates2),
                         times = kept.t[[1]])

# Put dates in numeric format with tstart at 0
tabi <- split(SHIlong, SHIlong$id)
L.tabi   <- length(tabi)
tablist <- lapply(1:L.tabi, function(i){
  refstart <- tabi[[i]]$tstart[1]

  tabi[[i]]$tstart  <- tabi[[i]]$tstart - refstart
  tabi[[i]]$tstop <- tabi[[i]]$tstop - refstart
  tabi[[i]]$debttCO <- tabi[[i]]$debttCO - refstart # to be used in next step
  tabi[[i]]$ddt.v1 <- tabi[[i]]$ddt.v1 - refstart # to be used in the final step
  tabi[[i]]$datt <- tabi[[i]]$datt - refstart # to be used in the final step

  return(tabi[[i]])
})
SHIlong <- do.call( rbind, tablist )
colnames(SHIlong)[14:16] <- c("ps", "ttc", "tran")

# Eliminating patient not having initiated the treatment arm
SHIlong2 <- SHIlong[!is.na(SHIlong$ddt.v1),]

# Patients are censored when initiating the other arm treatment, that is, at time swtrtdt
SHIlong2 <- cens.ipw(SHIlong2, id = "id", tstart = "tstart", tstop  = "tstop",
                     event = "event", arm = "bras.f", realtrt = FALSE,
                     censTime ="debttCO")
# We collect all event times (death and treatment censoring)
replic.times <- unique(c(SHIlong2$tstop[SHIlong2$cens==1],
                         SHIlong2$tstop[SHIlong2$event==1]))

# Now, we can replicate the rows
SHIrep  <- replicRows(SHIlong2, tstart = "tstart", tstop = "tstop",
                      event = "event", cens = "cens", times = replic.times)

# Estimation of the stabilized weights
library(survival)
SHIres <- ipcw(SHIrep, tstart = tstart, tstop = tstop, cens = cens,
               arm="bras.f",
               bas.cov = c("agerand", "sex.f","tt_Lnum", "rmh_alea.c", "pathway.f"),
               conf = c("ps", "ttc", "tran"), trunc = 0.05)

# To have conventional therapy (CT) as reference
SHIres$bras.f <- relevel(SHIres$bras.f, ref="CT")

# Using the IPCW weights in Cox likelihood...
fit.stab.w <- coxph(Surv(tstart, tstop, event) ~ bras.f + agerand + sex.f +
                        tt_Lnum + rmh_alea.c + pathway.f
                      + cluster(id),
                      data = SHIres, weights = SHIres$weights.trunc)
fit.stab.w

## End(No test)



