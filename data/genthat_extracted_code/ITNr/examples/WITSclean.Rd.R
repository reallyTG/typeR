library(ITNr)


### Name: WITSclean
### Title: WITS data clean
### Aliases: WITSclean

### ** Examples

## No test: 
##Create an igraph object from international
##trade data downloaded from WITS

##Applies a threhold
##only retains ties that are at least
## 0.01% of total trade

ITN<-WITSclean("WITS_CSV_FILE_NAME.csv",2015,TRUE,0.01)

## End(No test)



