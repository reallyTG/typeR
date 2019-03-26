library(nomisr)


### Name: nomis_data_info
### Title: Nomis data structures
### Aliases: nomis_data_info

### ** Examples

## No test: 

# Get info on all datasets
x <- nomis_data_info()

tibble::glimpse(x)

# Get info on a particular dataset
y <- nomis_data_info('NM_1658_1')

tibble::glimpse(y)

## End(No test)



