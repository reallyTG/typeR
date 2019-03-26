library(lawn)


### Name: lawn_rewind
### Title: Rewind
### Aliases: lawn_rewind

### ** Examples

x <- '{
"type": "Feature",
"properties": {},
"geometry": {
  "type": "Polygon",
  "coordinates": [
    [[121, -29], [138, -29], [138, -18], [121, -18], [121, -29]]
   ]
  }
}'
lawn_rewind(x, TRUE)
lawn_rewind(x, mutate = TRUE)
lawn_rewind(x, lint = TRUE)



