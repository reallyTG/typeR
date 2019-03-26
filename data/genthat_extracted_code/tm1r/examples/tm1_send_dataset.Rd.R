library(tm1r)


### Name: tm1_send_dataset
### Title: TM1 Send Data Set to a Cube
### Aliases: tm1_send_dataset

### ** Examples

## Not run: 
##D 
##D sdata <- tm1_connection("localhost", "8881", "admin", "apple")
##D 
##D #valueset
##D #    Argentina Brazil
##D #Jan         1      2
##D #Feb         3      4
##D 
##D tm1_send_dataset(
##D   sdata,
##D   valueset = valueset, cube = "SalesCube",
##D   rowdim = "month", coldim = "region",
##D   titledim1 = "actvsbud", titleel1 = "Actual",
##D   titledim2 = "model", titleel2 = "L Series 1.6 L Convertible",
##D   titledim3 = "account1", titleel3 = "Units")
##D 
##D 
## End(Not run)



