library(PNADcIBGE)


### Name: get_pnadc
### Title: Download, label and create design object for PNADc microdata
### Aliases: get_pnadc

### ** Examples

## Not run: 
##D pnadc.svy <- get_pnadc(2,2016)
##D pnadc.svy2 <- get_pnadc(1,2017,vars=c("VD4001","VD4002"))
##D survey::svymean(~VD4002, pnadc.svy2, na.rm=TRUE)
## End(Not run)




