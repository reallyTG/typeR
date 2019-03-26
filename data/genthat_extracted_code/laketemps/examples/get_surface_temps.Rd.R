library(laketemps)


### Name: get_surface_temps
### Title: get summer surface lake temperature data from GLTC dataset
### Aliases: get_surface_temps

### ** Examples

get_surface_temps('Victoria','Lake.Temp.Summer.Satellite')
get_surface_temps('Mendota','Lake.Temp.Summer.InSitu')

# - expect no satellite data for Lake Mendota:
get_surface_temps('Mendota','Lake.Temp.Summer.Satellite')

# retrieve from a lake site with multiple surface temperature sources:
get_surface_temps('Tahoe.Mid.Lake')
# is the same as:
get_surface_temps('Tahoe.Mid.Lake',c('Lake.Temp.Summer.Satellite', 'Lake.Temp.Summer.InSitu'))



