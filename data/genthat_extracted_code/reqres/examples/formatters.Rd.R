library(reqres)


### Name: formatters
### Title: Pre-supplied formatting generators
### Aliases: formatters format_json format_plain format_xml format_html
###   format_table

### ** Examples

fake_rook <- fiery::fake_request(
  'http://example.com/test',
  content = '',
  headers = list(
    Content_Type = 'text/plain',
    Accept = 'application/json, text/csv'
  )
)

req <- Request$new(fake_rook)
res <- req$respond()
res$body <- mtcars
res$format(json = format_json(), csv = format_table(sep=','))
res$body

# Cleaning up connections
rm(fake_rook, req, res)
gc()




