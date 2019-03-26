library(nowcasting)


### Name: nowcast
### Title: Nowcasting of a quarterly time series using a dynamic factor
###   model.
### Aliases: nowcast

### ** Examples

## Not run: 
##D ### Method 2sq (two stages: quarterly factors)
##D gdp <- month2qtr(x = USGDP$base[,"RGDPGR"])
##D gdp_position <- which(colnames(USGDP$base) == "RGDPGR")
##D base <- Bpanel(base = USGDP$base[,-gdp_position],
##D                trans = USGDP$legend$Transformation[-gdp_position],
##D                aggregate = TRUE)
##D now2sq <- nowcast(y = gdp, x = base, r = 2, p = 2, q = 2, method = '2sq')
##D 
##D ### Method 2sm (two stages: monthly factors)
##D base <- Bpanel(base = USGDP$base[,-gdp_position],
##D                trans = USGDP$legend$Transformation[-gdp_position],
##D                aggregate = F)
##D now2sm <- nowcast(y = gdp, x = base, r = 2, p = 2, q = 2, method = '2sm')
##D 
##D ### Method EM
##D # selecting and transforming y  
##D gdp <- month2qtr(x = USGDPshort$base[,"GDPUS"])
##D gdp <- ts(c(gdp,NA,NA,NA,NA), start = start(gdp), frequency = 4)
##D gdp_stationary <- gdp/lag(gdp, k = -1) -1
##D gdp_position <- which(colnames(USGDPshort$base) == "GDPUS")
##D 
##D # selecting and transforming x 
##D base <- USGDPshort$base[,-gdp_position]
##D trans <- USGDPshort$legend[-gdp_position,"transformation"]
##D stationaryBase <- cbind(base[,trans == 1]/lag(base[,trans == 1], k = -1) - 1,
##D                         diff(base[,trans == 2]))
##D colnames(stationaryBase) <- colnames(base)[c(which(trans == 1),which(trans == 2)) ]
##D stationaryBase <- stationaryBase[,colnames(base)]
##D 
##D # DFM estimation via EM
##D blocks <- matrix(c(1,0,1,1,0,1,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,
##D                    0,1,1,0,1,1,0,1,0,1,1,1,0,1,1,0,1,0,1,1,1,0,1,1,0,1,
##D                    1,0,1,0,1,1,0,1,1,0,1,1,0,1,1,1,0,1,0,1,1,0,1,1,1,0), byrow = T, ncol = 3)
##D nowEM <- nowcast(y = gdp_stationary, x = stationaryBase, r = 1, p = 1, q = 1,
##D                  method = 'EM', blocks = blocks)
## End(Not run)



