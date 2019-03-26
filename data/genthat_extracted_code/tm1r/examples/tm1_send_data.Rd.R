library(tm1r)


### Name: tm1_send_data
### Title: TM1 Send Data to a Cube
### Aliases: tm1_send_data

### ** Examples

## Not run: 
##D tm1_send_data(
##D   tm1_connection("localhost", "8881", "admin", "apple"),
##D   10,
##D   "SalesCube",
##D   "Actual", "Argentina", "S Series 1.8 L Sedan", "Units", "Jan")
##D 
##D con_obj <- tm1_connection("localhost", "8881", "admin", "apple")
##D tm1_send_data(con_obj,
##D   10,
##D   "SalesCube",
##D   "Actual", "Argentina", "S Series 1.8 L Sedan", "Units", "Jan",
##D   increment=TRUE)
## End(Not run)



