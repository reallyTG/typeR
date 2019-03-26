library(calendar)


### Name: ic_event
### Title: Create ical object from properties_core inputs
### Aliases: ic_event

### ** Examples

ic_event()
s <- lubridate::ymd_h("2019-01-01 00")
ic_event(start_time = s, end_time = 3)
# also accepts this format by default, thanks to lubridate::ymd_h:
ic_event(start_time = "2019-01-01 00")
ic_event(more_properties = TRUE)
ic_event(start_time = "18-10-12", end_time = "18-10-13", format = calendar::formats$`yy-mm-dd`)



