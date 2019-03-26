library(rdbnomics)


### Name: rdb
### Title: Download DBnomics data.
### Aliases: rdb

### ** Examples

## Not run: 
##D ## By ids
##D # Fetch one series from dataset 'Unemployment rate' (ZUTN) of AMECO provider:
##D df1 <- rdb(ids = 'AMECO/ZUTN/EA19.1.0.0.0.ZUTN')
##D 
##D # Fetch two series from dataset 'Unemployment rate' (ZUTN) of AMECO provider:
##D df2 <- rdb(ids = c('AMECO/ZUTN/EA19.1.0.0.0.ZUTN', 'AMECO/ZUTN/DNK.1.0.0.0.ZUTN'))
##D 
##D # Fetch two series from different datasets of different providers:
##D df3 <- rdb(ids = c('AMECO/ZUTN/EA19.1.0.0.0.ZUTN', 'IMF/CPI/A.AT.PCPIT_IX'))
##D 
##D 
##D ## By dimensions
##D # Fetch one value of one dimension from dataset 'Unemployment rate' (ZUTN) of AMECO provider:
##D df1 <- rdb('AMECO', 'ZUTN', dimensions = list(geo = "ea12"))
##D # or
##D df1 <- rdb('AMECO', 'ZUTN', dimensions = '{"geo": ["ea12"]}')
##D 
##D # Fetch two values of one dimension from dataset 'Unemployment rate' (ZUTN) of AMECO provider:
##D df2 <- rdb('AMECO', 'ZUTN', dimensions = list(geo = c("ea12", "dnk")))
##D # or
##D df2 <- rdb('AMECO', 'ZUTN', dimensions = '{"geo": ["ea12", "dnk"]}')
##D 
##D # Fetch several values of several dimensions from dataset 'Doing business' (DB) of World Bank:
##D dim <- list(
##D   country = c("DZ", "PE"),
##D   indicator = c("ENF.CONT.COEN.COST.ZS", "IC.REG.COST.PC.FE.ZS")
##D )
##D df3 <- rdb('WB', 'DB', dimensions = dim)
##D # or
##D dim <- paste0(
##D   '{"country": ["DZ", "PE"],',
##D   '"indicator": ["ENF.CONT.COEN.COST.ZS", "IC.REG.COST.PC.FE.ZS"]}'
##D )
##D df3 <- rdb('WB', 'DB', dimensions = dim)
##D 
##D 
##D ## By mask (only for some providers, check the list here :
##D # https://git.nomics.world/dbnomics/dbnomics-api/blob/master/dbnomics_api/application.cfg.)
##D # Fetch one series from dataset 'Consumer Price Index' (CPI) of IMF:
##D df1 <- rdb('IMF', 'CPI', mask = 'M.DE.PCPIEC_WT')
##D 
##D # Fetch two series from dataset 'Consumer Price Index' (CPI) of IMF:
##D df2 <- rdb('IMF', 'CPI', mask = 'M.DE+FR.PCPIEC_WT')
##D 
##D # Fetch all series along one dimension from dataset 'Consumer Price Index' (CPI) of IMF:
##D df3 <- rdb('IMF', 'CPI', mask = 'M..PCPIEC_WT')
##D 
##D # Fetch series along multiple dimensions from dataset 'Consumer Price Index' (CPI) of IMF:
##D df4 <- rdb('IMF', 'CPI', mask = 'M..PCPIEC_IX+PCPIA_IX')
##D 
##D ## Use readLines before fromJSON to avoid a proxy failure (in some cases)
##D # Fetch one series from dataset 'Unemployment rate' (ZUTN) of AMECO provider:
##D options(rdbnomics.use_readLines = TRUE)
##D df1 <- rdb(ids = 'AMECO/ZUTN/EA19.1.0.0.0.ZUTN')
##D # or
##D df1 <- rdb(ids = 'AMECO/ZUTN/EA19.1.0.0.0.ZUTN', use_readLines = TRUE)
## End(Not run)



