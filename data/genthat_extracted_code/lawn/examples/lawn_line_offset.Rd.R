library(lawn)


### Name: lawn_line_offset
### Title: Offset a linestring
### Aliases: lawn_line_offset

### ** Examples

line <- '{
  "type": "Feature",
  "properties": {
    "stroke": "#F00"
  },
  "geometry": {
    "type": "LineString",
    "coordinates": [[-83, 30], [-84, 36], [-78, 41]]
  }
}'

lawn_line_offset(line, 2, 'miles')
lawn_line_offset(line, 200, 'miles')
lawn_line_offset(line, 0.5, 'radians')
lawn_line_offset(line, 4, 'yards')


line <- '{
    "type": "LineString",
    "coordinates": [[-83, 30], [-84, 36], [-78, 41]]
}'
lawn_line_offset(line, 4, 'yards')



