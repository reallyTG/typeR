library(cimir)


### Name: to_datetime
### Title: To Datetime
### Aliases: to_datetime

### ** Examples

if(is_key_set()) {
  d = get_data(targets = 170, start.date = Sys.Date() - 4, 
    end.date = Sys.Date() - 1, items = "hly-air-tmp")
  to_datetime(d)
} 



