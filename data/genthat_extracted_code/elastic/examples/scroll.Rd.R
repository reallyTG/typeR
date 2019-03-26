library(elastic)


### Name: scroll
### Title: Scroll search function
### Aliases: scroll scroll_clear

### ** Examples

## Not run: 
##D # Basic usage - can use across all indices
##D res <- Search(time_scroll="1m")
##D scroll(res)$`_scroll_id`
##D 
##D # use on a specific index - and specify a query
##D res <- Search(index = 'shakespeare', q="a*", time_scroll="1m")
##D res$`_scroll_id`
##D 
##D # Setting "sort=_doc" to turn off sorting of results - faster
##D res <- Search(index = 'shakespeare', q="a*", time_scroll="1m",
##D   body = '{"sort": ["_doc"]}')
##D res$`_scroll_id`
##D 
##D # Pass scroll_id to scroll function
##D scroll(res$`_scroll_id`)
##D 
##D # Get all results - one approach is to use a while loop
##D res <- Search(index = 'shakespeare', q="a*", time_scroll="5m",
##D   body = '{"sort": ["_doc"]}')
##D out <- list()
##D hits <- 1
##D while(hits != 0){
##D   res <- scroll(res$`_scroll_id`)
##D   hits <- length(res$hits$hits)
##D   if(hits > 0)
##D     out <- c(out, res$hits$hits)
##D }
##D length(out)
##D out[[1]]
##D 
##D # clear scroll
##D ## individual scroll id
##D res <- Search(index = 'shakespeare', q="a*", time_scroll="5m",
##D   body = '{"sort": ["_doc"]}')
##D scroll_clear(res$`_scroll_id`)
##D 
##D ## many scroll ids
##D res1 <- Search(index = 'shakespeare', q="c*", time_scroll="5m",
##D   body = '{"sort": ["_doc"]}')
##D res2 <- Search(index = 'shakespeare', q="d*", time_scroll="5m",
##D   body = '{"sort": ["_doc"]}')
##D nodes_stats(metric = "indices")$nodes[[1]]$indices$search$open_contexts
##D scroll_clear(c(res1$`_scroll_id`, res2$`_scroll_id`))
##D nodes_stats(metric = "indices")$nodes[[1]]$indices$search$open_contexts
##D 
##D ## all scroll ids
##D res1 <- Search(index = 'shakespeare', q="f*", time_scroll="1m",
##D   body = '{"sort": ["_doc"]}')
##D res2 <- Search(index = 'shakespeare', q="g*", time_scroll="1m",
##D   body = '{"sort": ["_doc"]}')
##D res3 <- Search(index = 'shakespeare', q="k*", time_scroll="1m",
##D   body = '{"sort": ["_doc"]}')
##D scroll_clear(all = TRUE)
##D 
##D ## sliced scrolling
##D body1 <- '{
##D   "slice": {
##D     "id": 0,
##D     "max": 2
##D   },
##D   "query": {
##D     "match" : {
##D       "text_entry" : "a*"
##D     }
##D   }
##D }'
##D 
##D body2 <- '{
##D   "slice": {
##D     "id": 1,
##D     "max": 2
##D   },
##D   "query": {
##D     "match" : {
##D       "text_entry" : "a*"
##D     }
##D   }
##D }'
##D 
##D res1 <- Search(index = 'shakespeare', time_scroll="1m", body = body1)
##D res2 <- Search(index = 'shakespeare', time_scroll="1m", body = body2)
##D scroll(res1$`_scroll_id`)
##D scroll(res2$`_scroll_id`)
##D 
##D out1 <- list()
##D hits <- 1
##D while(hits != 0){
##D   tmp1 <- scroll(res1$`_scroll_id`)
##D   hits <- length(tmp1$hits$hits)
##D   if(hits > 0)
##D     out1 <- c(out1, tmp1$hits$hits)
##D }
##D 
##D out2 <- list()
##D hits <- 1
##D while(hits != 0){
##D   tmp2 <- scroll(res2$`_scroll_id`)
##D   hits <- length(tmp2$hits$hits)
##D   if(hits > 0)
##D     out2 <- c(out2, tmp2$hits$hits)
##D }
##D 
##D c(
##D  lapply(out1, "[[", "_source"),
##D  lapply(out2, "[[", "_source")
##D )
##D 
##D 
##D # using jsonlite::stream_out
##D connect()
##D res <- Search(time_scroll = "1m")
##D file <- tempfile()
##D scroll(
##D   x = res$`_scroll_id`,
##D   stream_opts = list(file = file)
##D )
##D jsonlite::stream_in(file(file))
##D unlink(file)
##D 
##D ## stream_out and while loop
##D connect()
##D (file <- tempfile())
##D res <- Search(index = "shakespeare", time_scroll = "5m",
##D   size = 1000, stream_opts = list(file = file))
##D while(!inherits(res, "warning")) {
##D   res <- tryCatch(scroll(
##D     x = res$`_scroll_id`,
##D     time_scroll = "5m",
##D     stream_opts = list(file = file)
##D   ), warning = function(w) w)
##D }
##D NROW(df <- jsonlite::stream_in(file(file)))
##D head(df)
## End(Not run)



