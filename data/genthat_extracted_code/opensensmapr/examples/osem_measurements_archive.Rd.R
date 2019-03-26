library(opensensmapr)


### Name: osem_measurements_archive
### Title: Fetch day-wise measurements for a single box from the
###   openSenseMap archive.
### Aliases: osem_measurements_archive osem_measurements_archive.sensebox

### ** Examples

## No test: 
  # fetch measurements for a single day
  box = osem_box('593bcd656ccf3b0011791f5a')
  m = osem_measurements_archive(box, as.POSIXlt('2018-09-13'))

  # fetch measurements for a date range and selected sensors
  sensors = ~ phenomenon %in% c('Temperatur', 'Beleuchtungsstärke')
  m = osem_measurements_archive(
    box,
    as.POSIXlt('2018-09-01'), as.POSIXlt('2018-09-30'),
    sensorFilter = sensors
  )
## End(No test)



