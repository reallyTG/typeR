library(cimir)


### Name: cimis_to_datetime
### Title: To Datetime
### Aliases: cimis_to_datetime

### ** Examples

if(is_key_set()) {
  d = cimis_data(targets = 170, start.date = Sys.Date() - 4, 
    end.date = Sys.Date() - 1, items = "hly-air-tmp")
  cimis_to_datetime(d)
} 



