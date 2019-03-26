library(ddpcr)


### Name: params
### Title: Plate parameters
### Aliases: params params<-

### ** Examples

## Not run: 
##D plate <- new_plate(sample_data_dir())
##D 
##D # retrieving plate parameters
##D str(params(plate))
##D str(params(plate, 'GENERAL'))
##D params(plate, 'GENERAL', 'RANDOM_SEED')
##D 
##D # setting plate parameters
##D params(plate, 'GENERAL', 'RANDOM_SEED') <- 10
##D str(params(plate, 'GENERAL'))
## End(Not run)



