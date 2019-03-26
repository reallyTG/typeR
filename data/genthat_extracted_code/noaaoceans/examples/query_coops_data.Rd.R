library(noaaoceans)


### Name: query_coops_data
### Title: Retrieve Tides Data From NOAA CO-OPS API
### Aliases: query_coops_data

### ** Examples

## No test: 
# Do Not Run
a <- query_coops_data('9414290',
                      '20170101',
                      '20170201',
                      'predictions',
                       interval = 'hilo',
                       datum = 'MLLW')
## End(No test)



