library(jqr)


### Name: jq
### Title: Execute a query with jq
### Aliases: jq jq.jqr jq.character jq.json jq.connection

### ** Examples

'{"a": 7}' %>%  do(.a + 1)
'[8,3,null,6]' %>% sortj

x <- '[{"message": "hello", "name": "jenn"},
  {"message": "world", "name": "beth"}]'
jq(index(x))

jq('{"a": 7, "b": 4}', 'keys')
jq('[8,3,null,6]', 'sort')

# many json inputs
jq(c("[123, 456]", "[77, 88, 99]", "[41]"), ".[]")
# Stream from connection
tmp <- tempfile()
writeLines(c("[123, 456]", "[77, 88, 99]", "[41]"), tmp)
jq(file(tmp), ".[]")

## Not run: 
##D # from a url
##D x <- 'http://jeroen.github.io/data/diamonds.json'
##D jq(url(x), ".[]")
##D 
##D # from a file
##D file <- file.path(tempdir(), "diamonds_nd.json")
##D download.file(x, destfile = file)
##D jq(file(file), ".carat")
##D jq(file(file), "select(.carat > 1.5)")
##D jq(file(file), 'select(.carat > 4 and .cut == "Fair")')
## End(Not run)



