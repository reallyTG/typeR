library(lawn)


### Name: lawn_center_of_mass
### Title: Center of mass
### Aliases: lawn_center_of_mass

### ** Examples

x <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
     "type": "Polygon",
     "coordinates": [[
       [-112.072391,46.586591],
       [-112.072391,46.61761],
       [-112.028102,46.61761],
       [-112.028102,46.586591],
       [-112.072391,46.586591]
     ]]
   }
}'
lawn_center_of_mass(x)

lawn_center_of_mass(lawn_data$polygons_average)



