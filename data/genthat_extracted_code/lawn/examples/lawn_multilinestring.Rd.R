library(lawn)


### Name: lawn_multilinestring
### Title: Create a multilinestring
### Aliases: lawn_multilinestring

### ** Examples

mlstr <- '[
  [
   [-21.964416, 64.148203],
   [-21.956176, 64.141316],
   [-21.93901, 64.135924],
   [-21.927337, 64.136673]
  ],
  [
   [-21.929054, 64.127985],
   [-21.912918, 64.134726],
   [-21.916007, 64.141016],
   [-21.930084, 64.14446]
  ]
]'
lawn_multilinestring(mlstr)

lawn_multilinestring(mlstr,
  properties = list(name = 'line1', distance = 145))

# Make a FeatureCollection
lawn_featurecollection(lawn_multilinestring(mlstr))

## Not run: 
##D lawn_featurecollection(lawn_multilinestring(mlstr)) %>% view
## End(Not run)



