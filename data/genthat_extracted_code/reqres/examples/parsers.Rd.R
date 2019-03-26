library(reqres)


### Name: parsers
### Title: Pre-supplied parsing generators
### Aliases: parsers parse_json parse_plain parse_xml parse_html
###   parse_multiform parse_queryform parse_table

### ** Examples

fake_rook <- fiery::fake_request(
  'http://example.com/test',
  content = '[1, 2, 3, 4]',
  headers = list(
    Content_Type = 'application/json'
  )
)

req <- Request$new(fake_rook)
req$parse(json = parse_json())
req$body

# Cleaning up connections
rm(fake_rook, req)
gc()




