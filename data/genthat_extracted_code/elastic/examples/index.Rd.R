library(elastic)


### Name: index
### Title: Index API operations
### Aliases: index index_get index_exists index_delete index_create
###   index_recreate index_close index_open index_stats index_settings
###   index_settings_update index_segments index_recovery index_optimize
###   index_forcemerge index_upgrade index_analyze index_flush
###   index_clear_cache

### ** Examples

## Not run: 
##D # get information on an index
##D index_get(index='shakespeare')
##D ## this one is the same as running index_settings('shakespeare')
##D index_get(index='shakespeare', features='settings')
##D index_get(index='shakespeare', features='mappings')
##D index_get(index='shakespeare', features='alias')
##D 
##D # check for index existence
##D index_exists(index='shakespeare')
##D index_exists(index='plos')
##D 
##D # create an index
##D if (index_exists('twitter')) index_delete('twitter')
##D index_create(index='twitter')
##D if (index_exists('things')) index_delete('things')
##D index_create(index='things')
##D if (index_exists('plos')) index_delete('plos')
##D index_create(index='plos')
##D 
##D # re-create an index
##D index_recreate("deer")
##D index_recreate("deer", verbose = FALSE)
##D 
##D # delete an index
##D if (index_exists('plos')) index_delete(index='plos')
##D 
##D ## with a body
##D body <- '{
##D  "settings" : {
##D   "index" : {
##D     "number_of_shards" : 3,
##D     "number_of_replicas" : 2
##D    }
##D  }
##D }'
##D if (index_exists('alsothat')) index_delete('alsothat')
##D index_create(index='alsothat', body=body)
##D 
##D ## with mappings
##D body <- '{
##D  "mappings": {
##D    "record": {
##D      "properties": {
##D        "location" : {"type" : "geo_point"}
##D       }
##D    }
##D  }
##D }'
##D if (!index_exists('gbifnewgeo')) index_create(index='gbifnewgeo', body=body)
##D gbifgeo <- system.file("examples", "gbif_geosmall.json", package = "elastic")
##D docs_bulk(gbifgeo)
##D 
##D # close an index
##D index_create('plos')
##D index_close('plos')
##D 
##D # open an index
##D index_open('plos')
##D 
##D # Get stats on an index
##D index_stats('plos')
##D index_stats(c('plos','gbif'))
##D index_stats(c('plos','gbif'), metric='refresh')
##D index_stats(metric = "indexing")
##D index_stats('shakespeare', metric='completion')
##D index_stats('shakespeare', metric='completion', completion_fields = "completion")
##D index_stats('shakespeare', metric='fielddata')
##D index_stats('shakespeare', metric='fielddata', fielddata_fields = "evictions")
##D index_stats('plos', level="indices")
##D index_stats('plos', level="cluster")
##D index_stats('plos', level="shards")
##D 
##D # Get segments information that a Lucene index (shard level) is built with
##D index_segments()
##D index_segments('plos')
##D index_segments(c('plos','gbif'))
##D 
##D # Get recovery information that provides insight into on-going index shard recoveries
##D index_recovery()
##D index_recovery('plos')
##D index_recovery(c('plos','gbif'))
##D index_recovery("plos", detailed = TRUE)
##D index_recovery("plos", active_only = TRUE)
##D 
##D # Optimize an index, or many indices
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5 - use optimize
##D   index_optimize('plos')
##D   index_optimize(c('plos','gbif'))
##D   index_optimize('plos')
##D } else {
##D   ### ES > v5 - use forcemerge
##D   index_forcemerge('plos')
##D }
##D 
##D # Upgrade one or more indices to the latest format. The upgrade process converts any
##D # segments written with previous formats.
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   index_upgrade('plos')
##D   index_upgrade(c('plos','gbif'))
##D }
##D 
##D # Performs the analysis process on a text and return the tokens breakdown 
##D # of the text
##D index_analyze(text = 'this is a test', analyzer='standard')
##D index_analyze(text = 'this is a test', analyzer='whitespace')
##D index_analyze(text = 'this is a test', analyzer='stop')
##D index_analyze(text = 'this is a test', tokenizer='keyword', 
##D   filters='lowercase')
##D index_analyze(text = 'this is a test', tokenizer='keyword', filters='lowercase',
##D    char_filters='html_strip')
##D index_analyze(text = 'this is a test', index = 'plos')
##D index_analyze(text = 'this is a test', index = 'shakespeare')
##D index_analyze(text = 'this is a test', index = 'shakespeare', 
##D   config=verbose())
##D 
##D ## NGram tokenizer
##D body <- '{
##D         "settings" : {
##D              "analysis" : {
##D                  "analyzer" : {
##D                      "my_ngram_analyzer" : {
##D                          "tokenizer" : "my_ngram_tokenizer"
##D                      }
##D                  },
##D                  "tokenizer" : {
##D                      "my_ngram_tokenizer" : {
##D                          "type" : "nGram",
##D                          "min_gram" : "2",
##D                          "max_gram" : "3",
##D                          "token_chars": [ "letter", "digit" ]
##D                      }
##D                  }
##D              }
##D       }
##D }'
##D if (index_exists("shakespeare2")) {
##D    index_delete("shakespeare2")
##D }
##D tokenizer_set(index = "shakespeare2", body=body)
##D index_analyze(text = "art thouh", index = "shakespeare2", 
##D   analyzer='my_ngram_analyzer')
##D 
##D # Explicitly flush one or more indices.
##D index_flush(index = "plos")
##D index_flush(index = "shakespeare")
##D index_flush(index = c("plos","shakespeare"))
##D index_flush(index = "plos", wait_if_ongoing = TRUE)
##D library('httr')
##D index_flush(index = "plos", config=verbose())
##D 
##D # Clear either all caches or specific cached associated with one ore more indices.
##D index_clear_cache()
##D index_clear_cache(index = "plos")
##D index_clear_cache(index = "shakespeare")
##D index_clear_cache(index = c("plos","shakespeare"))
##D index_clear_cache(filter = TRUE)
##D library('httr')
##D index_clear_cache(config=verbose())
##D 
##D # Index settings
##D ## get settings
##D index_settings()
##D index_settings("_all")
##D index_settings('gbif')
##D index_settings(c('gbif','plos'))
##D index_settings('*s')
##D ## update settings
##D if (index_exists('foobar')) index_delete('foobar')
##D index_create("foobar")
##D settings <- list(index = list(number_of_replicas = 4))
##D index_settings_update("foobar", body = settings)
##D index_get("foobar")$foobar$settings
## End(Not run)



