library(paleofire)


### Name: pfSiteSel
### Title: GCD sites selection methods
### Aliases: pfSiteSel

### ** Examples


## Sites selection examples

## Select all sites
ID=pfSiteSel()

## Savana sites in Ramankutty and Foley (1999)
ID=pfSiteSel(rf99==9)
plot(ID,zoom="world")

## Tropical forest and tundra such as Levavasseur et al. (2012)
ID=pfSiteSel(l12==6 | l12==7)
plot(ID,zoom="world")

## Sites in North America by geographic location
ID=pfSiteSel(lat>25, lat<75, long<(-45), long>-150) 
plot(ID,zoom="world")

## is equivalent to:
ID=pfSiteSel(lat>25 & lat<75 & long<(-45) & long>-150) 
plot(ID,zoom="world")

## By region criterion
ID=pfSiteSel(continent=="North America")
plot(ID,zoom="world")

## Pas-de-Fond site
pfSiteSel(site_name=="Pas-de-Fond")

## All sites in  eastern North America that are not Pas-de-Fond
pfSiteSel(site_name!="Pas-de-Fond", continent=="North America", long>-100)

## Sites with on average one dating point every 250 to 300 yrs
pfSiteSel(date_int>=250 & date_int<=300)

## Sites between 0, 100 m elevation in Asia
ID=pfSiteSel(elevation>0 & elevation<100, continent=="Asia")

## All sites that are not marine nor fluvial
# ID=pfSiteSel(id_land_desc!="MARI" , id_site_type!="FLUV" & id_site_type!="LFLU") # v.4.0.1 to come
# plot(ID)





