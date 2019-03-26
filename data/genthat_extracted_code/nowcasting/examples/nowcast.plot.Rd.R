library(nowcasting)


### Name: nowcast.plot
### Title: Plot for the nowcast output function
### Aliases: nowcast.plot

### ** Examples

## Not run: 
##D gdp <- month2qtr(x = USGDP$base[,"RGDPGR"])
##D gdp_position <- which(colnames(USGDP$base) == "RGDPGR")
##D base <- Bpanel(base = USGDP$base[,-gdp_position],
##D                trans = USGDP$legend$Transformation[-gdp_position],
##D                aggregate = TRUE)
##D now2sq <- nowcast(y = gdp, x = base, r = 2, p = 2, q = 2, method = '2sq')
##D 
##D nowcast.plot(now2sq, type = "fcst")
##D nowcast.plot(now2sq, type = "factors")
##D nowcast.plot(now2sq, type = "eigenvalues")
##D nowcast.plot(now2sq, type = "eigenvectors")
##D 
##D base <- Bpanel(base = USGDP$base[,-gdp_position],
##D                trans = USGDP$legend$Transformation[-gdp_position],
##D                aggregate = FALSE)
##D now2sm <- nowcast(y = gdp, x = base, r = 2, p = 2, q = 2, method = '2sm')
##D 
##D nowcast.plot(now2sm, type = "fcst")
##D nowcast.plot(now2sm, type = "factors")
##D nowcast.plot(now2sm, type = "eigenvalues")
##D nowcast.plot(now2sm, type = "eigenvectors")
## End(Not run)



