library(lawn)


### Name: lawn_geometrycollection
### Title: Create a geometrycollection
### Aliases: lawn_geometrycollection

### ** Examples

x <- list(
  list(
    type = "Point",
    coordinates = list(
     list(100, 0)
    )
  ),
  list(
    type = "LineString",
    coordinates = list(
     list(100, 0),
     list(102, 1)
    )
  )
)
lawn_geometrycollection(x)
lawn_geometrycollection(x,
  properties = list(city = 'Los Angeles', population = 400))

x <- '[
   {
     "type": "Point",
     "coordinates": [100.0, 0.0]
   },
   {
     "type": "LineString",
     "coordinates": [ [101.0, 0.0], [102.0, 1.0] ]
   }
]'
lawn_geometrycollection(x)



