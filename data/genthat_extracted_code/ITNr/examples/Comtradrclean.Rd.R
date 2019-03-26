library(ITNr)


### Name: Comtradrclean
### Title: Comtradr data clean
### Aliases: Comtradrclean

### ** Examples

## No test: 
##download data using comtradr
require(comtradr)

##Download the trade data for tomatoes - code 0702
##All countries, Year - 2016
ex_2 <- ct_search(reporters = "All",
              partners = c("USA","China",
              "Germany","Canada","Mexico"),
              trade_direction = "imports",
              start_date = "2016-01-01",
              end_date = "2016-12-31",
              commod_codes = "0702")

##this then gives a data frame which
##we can clean using the following function:
tomatoesITN<-Comtradrclean(ex_2,2016,TRUE,0.01)

##We apply a threshold - only retaining ties that are at least 0.01%
##of total tomatoes trade (amngst these countries)

## End(No test)



