## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.height=5, fig.width=6.5, message=FALSE-------------------------
library(data.table)
library(phenocamapi)

# obtaining the metadata as data.table
phenos <- get_phenos()

## ---- fig.height=5, fig.width=6.5, message=FALSE-------------------------
# store sites with flux_data available
phenofluxsites <- phenos[flux_data==TRUE&!is.na(flux_sitenames), .(PhenoCam=site, Flux=flux_sitenames)]

# see the first few rows
head(phenofluxsites)

#list deciduous broadleaf sites with flux tower
DB.flux <- phenos[flux_data==TRUE&primary_veg_type=='DB', site]

# see the first few rows
head(DB.flux)

## ---- fig.height=5, fig.width=6.5, message=FALSE-------------------------
# obtaining the list of all the available ROI's on the PhenoCam server
rois <- get_rois()

head(rois$roi_name)

colnames(rois)

# list all the ROI's for dukehw
rois[site=='dukehw',]

## ---- fig.height=5, fig.width=6.5, message=FALSE-------------------------
# to obtain the DB 1000  from dukehw
dukehw_DB_1000 <- get_pheno_ts(site = 'dukehw', vegType = 'DB', roiID = 1000, type = '3day')

colnames(dukehw_DB_1000)

dukehw_DB_1000[,date:=as.Date(date)]
dukehw_DB_1000[,plot(date, gcc_90, col = 'green', type = 'b')]
mtext('Duke Forest, Hardwood', font = 2)

## ---- fig.height=5, fig.width=6.5, message=FALSE-------------------------
phenots <- get_pheno_ts(site = 'oregonMP', vegType = 'EN', roiID = 1000)

colnames(phenots)

fluxfile <- system.file('fluxnetrepo/FLX_US-Me2/FLX_US-Me2_FULLSET_DD.csv', package = 'phenocamapi')

fluxts <- read.csv(fluxfile, skip = 0)
fluxts[fluxts==-9999] <- NA
fluxts <- as.data.table(fluxts)
fluxts[,datetime:=as.POSIXct(as.character(TIMESTAMP), format='%Y%m%d')]
fluxts[,YYYYMMDD:=as.character(as.Date(datetime))]
fluxts[,YEAR:=year(datetime)]
fluxts[,DOY:=yday(datetime)]

head(fluxts[, .(TIMESTAMP, TA_F)])


