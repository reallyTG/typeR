library(htmlTable)


### Name: SCB
### Title: Average age in Sweden
### Aliases: SCB
### Keywords: data

### ** Examples

## Not run: 
##D # The data was generated through downloading via the API
##D library(pxweb)
##D 
##D # Get the last 15 years of data (the data always lags 1 year)
##D current_year <- as.integer(format(Sys.Date(), "%Y")) -1
##D SCB <- get_pxweb_data(
##D   url = "http://api.scb.se/OV0104/v1/doris/en/ssd/BE/BE0101/BE0101B/BefolkningMedelAlder",
##D   dims = list(Region = c('00', '01', '03', '25'),
##D               Kon = c('1', '2'),
##D               ContentsCode = c('BE0101G9'),
##D               Tid = (current_year-14):current_year),
##D   clean = TRUE)
##D 
##D # Some cleaning was needed before use
##D SCB$region <- factor(substring(as.character(SCB$region), 4))
##D Swe_ltrs <- c("å" = "&aring;",
##D               "Å" = "&Aring;",
##D               "ä" = "&auml;",
##D               "Ä" = "&Auml;",
##D               "ö" = "&ouml;",
##D               "Ö" = "&Ouml;")
##D for (i in 1:length(Swe_ltrs)){
##D   levels(SCB$region) <- gsub(names(Swe_ltrs)[i],
##D               Swe_ltrs[i],
##D               levels(SCB$region))
##D }
##D 
##D save(SCB, file = "data/SCB.rda")
## End(Not run)



