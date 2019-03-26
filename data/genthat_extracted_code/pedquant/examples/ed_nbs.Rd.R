library(pedquant)


### Name: ed_nbs
### Title: query NBS economic data
### Aliases: ed_nbs

### ** Examples

## No test: 
# query NBS data without setting any parameters
dt = ed_nbs()

# specify paratmeters
dt1 = ed_nbs(geo_type='national', freq='quarterly', symbol='A010101')
# or using 'n'/'q' represents 'national'/'quarterly'
dt2 = ed_nbs(geo_type='n', freq='q', symbol='A010101')


# query data in one province
dt3 = ed_nbs(geo_type='province', freq='quarterly', 
  symbol='A010101', subregion='110000')
  
# query data in all province
dt4 = ed_nbs(geo_type='province', freq='quarterly', 
  symbol='A010101', subregion='all')
## End(No test)




