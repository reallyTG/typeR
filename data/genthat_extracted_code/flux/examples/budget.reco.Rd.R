library(flux)


### Name: budget.reco
### Title: Predict fluxes from GPP and Reco models and prepare for summing
###   them up to budgets.
### Aliases: budget.reco budget.gpp
### Keywords: manip univar

### ** Examples

### The examples are consecutive and are a suggestion
### how to run the whole process from bulk modelling
### over corrections and checks to full budgets including
### propagated model and interpolation error terms.

## The whole examples section is marked as
## not run because parts take longer than
## accepted by CRAN incoming checks.
## Remove first hash in each line to run them.

## Not run ##
## load data
#data(amd)
#data(amc)
## set global conversion factor
## All fluxes are in micromole * m-2 * s-1,
## thus they are transformed to g CO2-C * m-2 *1/2h
#uf <- 12*60*30/1000000
#
#### Reco ### (for details see reco.bulk)
## extract opaque (dark) chamber measurements 
#amr <- amd[amd$kind=="D",]
## fit reco models
#r.models <- reco.bulk(flux ~ t.air + t.soil2 + t.soil5 + 
#t.soil10 + timestamp, amr, amr$campaign, window=3, 
#remove.outliers=TRUE, method="arr", min.dp=2)
## adjust models
#r.models <- modjust(r.models, alpha=0.1, min.dp=3)
#
### prepare Reco budget (predict half hourly values for two years)
## define set.back with start and end dates only
## (typically you would take this from read in table)
#set.back <- data.frame(timestamp = c("2010-01-01 00:30", "2011-12-31 23:30"), 
#value = c(-999, -9999))
#set.back$timestamp <- strptime(set.back$timestamp, format="%Y-%m-%d %H:%M", tz="GMT")
## run budget function with defaults
#r.bdgt <- budget.reco(r.models, amc, set.back)
## prepare for quality check (global model of predicted ~ measured)
#r.check <- checkm(r.bdgt, amr)
## have a look
#par(pty="s")
#lims <- range(r.check$reco.flux, r.check$flux)
#plot(reco.flux ~ flux, data=r.check, xlim=lims, ylim=lims)
#abline(coef=c(0,1), lty=3)
#mf1 <- lm(reco.flux ~ flux, r.check)
#abline(mf1)
#summary(mf1)
## calculate daily values (better for plotting)
#r.bdgt$day <- format(r.bdgt$timestamp, format="%Y-%m-%d")
#r.daily <- data.frame(day = unique(r.bdgt$day))
#r.daily$day <- as.POSIXct(strptime(r.daily$day, format="%Y-%m-%d", 
#tz="GMT"), tz="GMT")
## in addition to summing up per day, change unit
#r.daily$reco <- tapply(r.bdgt$reco.flux*uf, r.bdgt$day, sum)
## same for the model error terms
#r.daily$se <- tapply(r.bdgt$reco.se*uf, r.bdgt$day, sum)
#
#
#### GPP ### (for details see gpp.bulk)
#g.models <- gpp.bulk(flux ~ PAR + timestamp + kind, amd, amd$campaign, 
#method="Falge", min.dp=5)
#
### prepare GPP budget (predict half hourly values for two years)
## define set.back with start, end, and cut dates
## (typically you would take this from read in table)
#set.back <- data.frame(timestamp = c("2010-01-01 00:30", "2011-12-31 23:30", 
#"2010-07-22 12:00", "2010-09-03 12:00", "2010-10-13 12:00", "2011-06-29 12:00", 
#"2011-08-11 12:00", "2011-10-21 12:00"), value = c(-999, -9999, rep(-0.0001, 6)))
#set.back$timestamp <- strptime(set.back$timestamp, format="%Y-%m-%d %H:%M", tz="GMT")
## have a look at the resulting data.frame
#set.back
## run budget function with correct = NULL and return the models
#g.bdgt <- budget.gpp(g.models, amc, set.back, correct=NULL, return.models=TRUE)
## the cut models are also returned:
#tbl8(g.bdgt$models)
## extract the half hourly values to proceed
#g.bdgt <- g.bdgt$tbl
## make daily values (better for plotting)
#g.bdgt$day <- format(g.bdgt$timestamp, format="%Y-%m-%d")
#g.daily <- data.frame(day = unique(g.bdgt$day))
#g.daily$day <- as.POSIXct(strptime(g.daily$day, format="%Y-%m-%d", tz="GMT"), tz="GMT")
## in addition to summing up per day, change unit
#g.daily$gpp <- tapply(g.bdgt$gpp.flux*uf, g.bdgt$day, sum)
## same for the model error terms
#g.daily$se <- tapply(g.bdgt$gpp.se*uf, g.bdgt$day, sum)
#
#
#### Budgets ###
### doing the actual budgeting
## first bring Reco and GPP budget data together
## because of different handling data sets
## may be of different length, therefore use merge
#r.bdgt$ts <- as.character(r.bdgt$timestamp)
#g.bdgt$ts <- as.character(g.bdgt$timestamp)
#bdgt <- merge(r.bdgt, g.bdgt[, -c(ncol(g.bdgt)-2, ncol(g.bdgt)-1)], 
#by.x="ts", by.y="ts", all.x=TRUE)
## calculate NEE
#bdgt$nee.flux <- bdgt$reco.flux + bdgt$gpp.flux
## error propagation 
#bdgt$nee.se <- sqrt(bdgt$reco.se^2 + bdgt$gpp.se^2)/sqrt(2)
## define unique id that spans across reco and gpp ids
#bdgt$nee.id <- paste(bdgt$reco.id, bdgt$gpp.id, sep=".")
## do budgets of fluxes (sum and use global conversion factor, see above) and error terms
## the model errors are summed up per model id and resulting
## sums are combined following error propagation
#with(bdgt, {c(
#  reco = sum(reco.flux*uf, na.rm=TRUE), 
#	reco.me = sqrt(sum(tapply(reco.se, reco.id, sum)^2))*uf, 
#	gpp = sum(gpp.flux*uf, na.rm=TRUE), 
#	gpp.me = sqrt(sum(tapply(gpp.se, gpp.id, sum)^2))*uf, 
#	nee = sum(nee.flux*uf, na.rm=TRUE), 
#	nee.me = sqrt(sum(tapply(nee.se, nee.id, sum, na.rm=TRUE)^2))*uf
#)})
#
### annual budget incl. interpolation error
#set.back <- data.frame(timestamp = c("2010-01-01 00:30", 
#"2010-12-31 23:30"), value = c(-999, -9999))
#set.back$timestamp <- strptime(set.back$timestamp, format="%Y-%m-%d %H:%M", tz="GMT")
### reco.ie
## redoing budget with annual bounds
#r.bdgt.2010 <- budget.reco(r.models, amc, set.back, return.models=TRUE)
## run budget.ie with lo = 3 and it = 10 (default of 100 is advisable but slow)
#r.ie2010 <- budget.ie(r.bdgt.2010, lo=3, it=10) 
## summary statistic and factor in the uf
#r.ie2010 <- sd(r.ie2010*uf) 
## gpp.ie
## redoing budget with annual bounds
#g.bdgt.2010 <- budget.gpp(g.models, amc, set.back, correct=NULL, return.models=TRUE)
#g.ie2010 <- budget.ie(g.bdgt.2010, lo=3, it=10) 
#g.ie2010 <- sd(g.ie2010*uf) 
#
## do the actual budgeting
#tmp <- bdgt[(bdgt$timestamp >= set.back$timestamp[1]) & 
#(bdgt$timestamp <= set.back$timestamp[2]),]
#with(tmp, {c(
#  reco = sum(reco.flux*uf, na.rm=TRUE), 
#	reco.me = sqrt(sum(tapply(reco.se, reco.id, sum)^2))*uf,
#	reco.ie = r.ie2010,
#	gpp = sum(gpp.flux*uf, na.rm=TRUE), 
#	gpp.me = sqrt(sum(tapply(gpp.se, gpp.id, sum)^2))*uf,
#	gpp.ie = g.ie2010, 
#	nee = sum(nee.flux*uf, na.rm=TRUE), 
#	nee.me = sqrt(sum(tapply(nee.se, nee.id, sum, na.rm=TRUE)^2))*uf,
#	nee.ie = sqrt(r.ie2010^2 + g.ie2010^2)
#)})
#
## End not run ##



