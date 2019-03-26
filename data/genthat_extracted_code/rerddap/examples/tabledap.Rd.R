library(rerddap)


### Name: tabledap
### Title: Get ERDDAP tabledap data.
### Aliases: tabledap

### ** Examples

## Not run: 
##D # Just passing the datasetid without fields gives all columns back
##D tabledap('erdCinpKfmBT')
##D 
##D # Pass time constraints
##D tabledap('hawaii_soest_5742_4f35_ff55', 'time>=2011-08-24', 'time<=2011-09-01')
##D 
##D # Pass in fields (i.e., columns to retrieve) & time constraints
##D tabledap('hawaii_soest_5742_4f35_ff55',
##D   fields = c('longitude', 'latitude', 'speed_over_ground'),
##D   'time>=2011-08-24', 'time<=2011-09-01'
##D )
##D 
##D # Get info on a datasetid, then get data given information learned
##D info('erdCalCOFIlrvsiz')$variables
##D tabledap('erdCalCOFIlrvsiz', fields=c('latitude','longitude','larvae_size',
##D    'itis_tsn'), 'time>=2011-10-25', 'time<=2011-10-31')
##D 
##D # An example workflow
##D ## Search for data
##D (out <- ed_search(query='fish', which = 'table'))
##D ## Using a datasetid, search for information on a datasetid
##D id <- "nwioosHudFishDetails"
##D info(id)$variables
##D ## Get data from the dataset
##D tabledap(id, fields = c('scientific_name', 'species_id', 'life_stage'))
##D 
##D # Time constraint
##D ## Limit by time with date only
##D (info <- info('erdCinpKfmBT'))
##D tabledap(info, fields = c(
##D   'latitude','longitude','Haliotis_fulgens_Mean_Density'),
##D   'time>=2001-07-14')
##D 
##D # Use distinct parameter - compare to distinct = FALSE
##D tabledap('hawaii_soest_5742_4f35_ff55',
##D    fields=c('longitude','latitude','speed_over_ground'),
##D    'time>=2011-08-24', 'time<=2011-09-01', distinct = TRUE)
##D 
##D # Use units parameter
##D ## In this example, values are the same, but sometimes they can be different
##D ## given the units value passed
##D tabledap('erdCinpKfmT', fields=c('longitude','latitude','time','temperature'),
##D    'time>=2007-09-19', 'time<=2007-09-21', units='udunits')
##D tabledap('erdCinpKfmT', fields=c('longitude','latitude','time','temperature'),
##D    'time>=2007-09-19', 'time<=2007-09-21', units='ucum')
##D 
##D # Use orderby parameter
##D tabledap('erdCinpKfmT', fields=c('longitude','latitude','time','temperature'),
##D    'time>=2007-09-19', 'time<=2007-09-21', orderby='temperature')
##D # Use orderbymax parameter
##D tabledap('erdCinpKfmT', fields=c('longitude','latitude','time','temperature'),
##D    'time>=2007-09-19', 'time<=2007-09-21', orderbymax='temperature')
##D # Use orderbymin parameter
##D tabledap('erdCinpKfmT', fields=c('longitude','latitude','time','temperature'),
##D    'time>=2007-09-19', 'time<=2007-09-21', orderbymin='temperature')
##D # Use orderbyminmax parameter
##D tabledap('erdCinpKfmT', fields=c('longitude','latitude','time','temperature'),
##D    'time>=2007-09-19', 'time<=2007-09-21', orderbyminmax='temperature')
##D # Use orderbymin parameter with multiple values
##D tabledap('erdCinpKfmT',
##D    fields=c('longitude','latitude','time','depth','temperature'),
##D    'time>=2007-06-10', 'time<=2007-09-21',
##D    orderbymax=c('depth','temperature')
##D )
##D 
##D # Integrate with taxize
##D out <- tabledap('erdCalCOFIlrvcntHBtoHI',
##D    fields = c('latitude','longitude','scientific_name','itis_tsn'),
##D    'time>=2007-06-10', 'time<=2007-09-21'
##D )
##D tsns <- unique(out$itis_tsn[1:100])
##D library("taxize")
##D classif <- classification(tsns, db = "itis")
##D head(rbind(classif)); tail(rbind(classif))
##D 
##D # Write to memory (within R), or to disk
##D (out <- info('erdCinpKfmBT'))
##D ## disk, by default (to prevent bogging down system w/ large datasets)
##D ## the 2nd call is much faster as it's mostly just the time of reading
##D ## in the table from disk
##D system.time( tabledap('erdCinpKfmBT', store = disk()) )
##D system.time( tabledap('erdCinpKfmBT', store = disk()) )
##D ## memory
##D tabledap('erdCinpKfmBT', store = memory())
##D 
##D # use a different ERDDAP server
##D ## NOAA IOOS NERACOOS
##D url <- "http://www.neracoos.org/erddap/"
##D tabledap("E01_optics_hist", url = url)
## End(Not run)



