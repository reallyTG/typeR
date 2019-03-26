library(reqres)


### Name: Response
### Title: HTTP Response handling
### Aliases: Response as.list.Response is.Response
### Keywords: datasets

### ** Examples

fake_rook <- fiery::fake_request(
  'http://example.com/test?id=34632&question=who+is+hadley',
  content = 'This is elaborate ruse',
  headers = list(
    Accept = 'application/json; text/*',
    Content_Type = 'text/plain'
  )
)

req <- Request$new(fake_rook)
res <- Response$new(req)
res

# Set the body to the associated status text
res$status_with_text(200L)
res$body

# Infer Content-Type from file extension
res$type <- 'json'
res$type

# Prepare a file for download
res$attach(system.file('DESCRIPTION', package = 'reqres'))
res$type
res$body
res$get_header('Content-Disposition')

# Cleaning up connections
rm(fake_rook, req, res)
gc()




