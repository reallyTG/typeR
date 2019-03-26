library(httr)


### Name: write_stream
### Title: Process output in a streaming manner.
### Aliases: write_stream

### ** Examples

GET(
  "https://github.com/jeroen/data/raw/gh-pages/diamonds.json",
  write_stream(function(x) {
    print(length(x))
    length(x)
  })
)



