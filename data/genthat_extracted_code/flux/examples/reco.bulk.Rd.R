library(flux)


### Name: reco.bulk
### Title: Bulk fitting of Reco and GPP models
### Aliases: reco.bulk gpp.bulk
### Keywords: univar

### ** Examples

## Whole example is consecutive and largely marked as
## not run because parts take longer than
## accepted by CRAN incoming checks.
## Remove first hash in each line to run them.
data(amd)
data(amc)

### Reco ###
## do reco models with 3 campaign wide window and 
## outlier removal (outliers according to models)
# first extract opaque (dark) chamber measurements 
amr <- amd[amd$kind=="D",]

## Nor run ##
## do bulk fitting of reco models (all specified temperatures 
## are tested and the best model (per campaign) is finally stored)
#r.models <- reco.bulk(flux ~ t.air + t.soil2 + t.soil5 + 
#t.soil10 + timestamp, amr, amr$campaign, window=3, 
#remove.outliers=TRUE, method="arr", min.dp=2)
#
## adjust models (BEWARE: stupid models with t1 >= 20 are skipped 
## within the function, this can be changed)
#r.models <- modjust(r.models, alpha=0.1, min.dp=3)
#
## make data.frame (table) for overview of model parameters
## the temperature with which the best model could be fit is reported
## this information also resides in the model objects in r.models
#tbl8(r.models)
#
#### GPP ###
### fit GPP models using method = Falge and min.dp = 5
### and take opaque (dark, i.e. reco) measurements from data
## the function issues a warning because some campaigns have
## not enough data points
#g.models <- gpp.bulk(flux ~ PAR + timestamp + kind, amd, amd$campaign, 
#method="Falge", min.dp=5)
#tbl8(g.models)
#
### alternative approaches to acknowledge reco when fitting GPP models
## we need only fluxes based on transparent chamber measurements (NEE)
#amg <- amd[amd$kind=="T",]
## fit gpp models and predict reco from models
#g.models.a1 <- gpp.bulk(flux ~ PAR + timestamp + t.air + t.soil2 + 
#t.soil5 + t.soil10, amg, amg$campaign, method="Falge", min.dp=5, 
#Reco.m=r.models)
#tbl8(g.models.a1)
## have a look the model fits (first 10)
#par(mfrow=c(5,6))
## select only non linear fits
#sel <- sapply(g.models.a1, function(x) class(x$mod$mg)=="nls")
#lapply(g.models.a1[sel][1:10], function(x) plot(x$mod, single.pane=FALSE))
#
## fit gpp models with providing reco data
## to do so, rerun budget.reco with other start and end points
#set.back <- data.frame(timestamp = c("2009-09-01 00:30", "2011-12-31 23:30"), 
#value = c(-999, -9999))
#set.back$timestamp <- strptime(set.back$timestamp, format="%Y-%m-%d %H:%M")
#r.bdgt.a2 <- budget.reco(r.models, amc, set.back)
## now fit the models
#g.models.a2 <- gpp.bulk(flux ~ PAR + timestamp, amg, amg$campaign, 
#method="Falge", units = "30mins", min.dp=5, Reco.m=r.bdgt.a2$reco.flux, 
#ts.Reco = r.bdgt.a2$timestamp)
#tbl8(g.models.a2)
#
## End not run ##




