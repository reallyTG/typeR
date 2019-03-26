library(elastic)


### Name: Search_uri
### Title: Full text search of Elasticsearch with URI search
### Aliases: Search_uri

### ** Examples

## Not run: 
##D # URI string queries
##D Search_uri(index="shakespeare")
##D Search_uri(index="shakespeare", type="act")
##D Search_uri(index="shakespeare", type="scene")
##D Search_uri(index="shakespeare", type="line")
##D 
##D ## Return certain fields
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5
##D   Search_uri(index="shakespeare", fields=c('play_name','speaker'))
##D } else {
##D   ### ES > v5
##D   Search_uri(index="shakespeare", source=c('play_name','speaker'))
##D }
##D 
##D ## Search many indices
##D Search_uri(index = "gbif")$hits$total
##D Search_uri(index = "shakespeare")$hits$total
##D Search_uri(index = c("gbif", "shakespeare"))$hits$total
##D 
##D ## search_type
##D ## NOTE: If you're in ES V5 or greater, see \code{?fielddata}
##D Search_uri(index="shakespeare", search_type = "query_then_fetch")
##D Search_uri(index="shakespeare", search_type = "dfs_query_then_fetch")
##D # Search_uri(index="shakespeare", search_type = "scan") # only when scrolling
##D 
##D ## sorting
##D Search_uri(index="shakespeare", type="act", sort="text_entry")
##D Search_uri(index="shakespeare", type="act", sort="speaker:desc", fields='speaker')
##D Search_uri(index="shakespeare", type="act",
##D  sort=c("speaker:desc","play_name:asc"), fields=c('speaker','play_name'))
##D 
##D ## paging
##D Search_uri(index="shakespeare", size=1, fields='text_entry')$hits$hits
##D Search_uri(index="shakespeare", size=1, from=1, fields='text_entry')$hits$hits
##D 
##D ## queries
##D ### Search in all fields
##D Search_uri(index="shakespeare", type="act", q="york")
##D 
##D ### Searchin specific fields
##D Search_uri(index="shakespeare", type="act", q="speaker:KING HENRY IV")$hits$total
##D 
##D ### Exact phrase search by wrapping in quotes
##D Search_uri(index="shakespeare", type="act", q='speaker:"KING HENRY IV"')$hits$total
##D 
##D ### can specify operators between multiple words parenthetically
##D Search_uri(index="shakespeare", type="act", q="speaker:(HENRY OR ARCHBISHOP)")$hits$total
##D 
##D ### where the field line_number has no value (or is missing)
##D Search_uri(index="shakespeare", q="_missing_:line_number")$hits$total
##D 
##D ### where the field line_number has any non-null value
##D Search_uri(index="shakespeare", q="_exists_:line_number")$hits$total
##D 
##D ### wildcards, either * or ?
##D Search_uri(index="shakespeare", q="*ay")$hits$total
##D Search_uri(index="shakespeare", q="m?y")$hits$total
##D 
##D ### regular expressions, wrapped in forward slashes
##D Search_uri(index="shakespeare", q="text_entry:/[a-z]/")$hits$total
##D 
##D ### fuzziness
##D Search_uri(index="shakespeare", q="text_entry:ma~")$hits$total
##D Search_uri(index="shakespeare", q="text_entry:the~2")$hits$total
##D Search_uri(index="shakespeare", q="text_entry:the~1")$hits$total
##D 
##D ### Proximity searches
##D Search_uri(index="shakespeare", q='text_entry:"as hath"~5')$hits$total
##D Search_uri(index="shakespeare", q='text_entry:"as hath"~10')$hits$total
##D 
##D ### Ranges, here where line_id value is between 10 and 20
##D Search_uri(index="shakespeare", q="line_id:[10 TO 20]")$hits$total
##D 
##D ### Grouping
##D Search_uri(index="shakespeare", q="(hath OR as) AND the")$hits$total
##D 
##D # Limit number of hits returned with the size parameter
##D Search_uri(index="shakespeare", size=1)
##D 
##D # Give explanation of search in result
##D Search_uri(index="shakespeare", size=1, explain=TRUE)
##D 
##D ## terminate query after x documents found
##D ## setting to 1 gives back one document for each shard
##D Search_uri(index="shakespeare", terminate_after=1)
##D ## or set to other number
##D Search_uri(index="shakespeare", terminate_after=2)
##D 
##D ## Get version number for each document
##D Search_uri(index="shakespeare", version=TRUE, size=2)
##D 
##D ## Get raw data
##D Search_uri(index="shakespeare", type="scene", raw=TRUE)
##D 
##D ## Curl options
##D library('httr')
##D 
##D ### verbose
##D out <- Search_uri(index="shakespeare", type="line", config=verbose())
##D 
##D ### print progress
##D res <- Search_uri(config = progress(), size = 5000)
## End(Not run)



