library(osmose)


### Name: getOsmoseParameter
### Title: Get a parameter from a name chain (error if not found).
### Aliases: getOsmoseParameter

### ** Examples

{
   filename = system.file("extdata", "inputs/osm_all-parameters.csv", package="osmose")
   par = readOsmoseConfiguration(filename)
   getOsmoseParameter(par, "population", "seeding", "year", "max", keep.att=FALSE)
}



