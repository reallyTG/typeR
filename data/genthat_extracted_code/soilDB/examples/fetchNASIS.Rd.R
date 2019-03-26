library(soilDB)


### Name: fetchNASIS
### Title: Fetch commonly used site/pedon/horizon or component data from a
###   local NASIS database.
### Aliases: fetchNASIS getHzErrorsNASIS fetchNASIS_pedons
###   get_phorizon_from_NASIS_db fetchNASIS_components
###   get_component_copm_data_from_NASIS_db
###   get_component_horizon_data_from_NASIS_db
###   get_component_correlation_data_from_NASIS_db
###   get_component_copm_data_from_NASIS_db
###   get_component_cogeomorph_data_from_NASIS_db
###   get_component_esd_data_from_NASIS_db
###   get_component_otherveg_data_from_NASIS_db get_copedon_from_NASIS_db
###   get_mapunit_from_NASIS get_projectmapunit_from_NASIS
###   get_projectstaff_from_NASIS get_component_diaghz_from_NASIS_db
###   get_mutext_from_NASIS_db fetchVegdata get_vegplot_from_NASIS_db
###   get_vegplot_location_from_NASIS_db get_vegplot_species_from_NASIS_db
###   get_vegplot_textnote_from_NASIS_db get_vegplot_transect_from_NASIS_db
###   get_vegplot_transpecies_from_NASIS_db
###   get_vegplot_tree_si_details_from_NASIS_db
###   get_vegplot_tree_si_summary_from_NASIS_db
###   get_vegplot_trhi_from_NASIS_db
### Keywords: manip

### ** Examples

## Not run: 
##D # query depends on some pedon data, queried against the national database
##D # note that you must setup this connection ahead of time
##D f <- fetchNASIS(from = 'pedons')
##D 
##D # plot only those profiles with densic contact
##D plot(f[which(f$densic.contact), ], name='hzname')
##D 
##D # get basic component data from local NASIS, after performing a 
##D # DMU-* query against the national database
##D fc <- fetchNASIS(from = 'components')
## End(Not run)



