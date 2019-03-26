library(elastic)


### Name: Search
### Title: Full text search of Elasticsearch
### Aliases: Search

### ** Examples

## Not run: 
##D if (!index_exists("shakespeare")) {
##D   shakespeare <- system.file("examples", "shakespeare_data.json", package = "elastic")
##D   invisible(docs_bulk(shakespeare))
##D }
##D 
##D # URI string queries
##D Search(index="shakespeare")
##D Search(index="shakespeare", type="act")
##D Search(index="shakespeare", type="scene")
##D Search(index="shakespeare", type="line")
##D 
##D ## Return certain fields
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5
##D   Search(index="shakespeare", fields=c('play_name','speaker'))
##D } else {
##D   ### ES > v5
##D   Search(index="shakespeare", body = '{
##D    "_source": ["play_name", "speaker"]
##D   }')
##D }
##D 
##D ## Search multiple indices
##D Search(index = "gbif")$hits$total
##D Search(index = "shakespeare")$hits$total
##D Search(index = c("gbif", "shakespeare"))$hits$total
##D 
##D ## search_type
##D Search(index="shakespeare", search_type = "query_then_fetch")
##D Search(index="shakespeare", search_type = "dfs_query_then_fetch")
##D ### search type "scan" is gone - use time_scroll instead
##D Search(index="shakespeare", time_scroll = "2m")
##D ### search type "count" is gone - use size=0 instead
##D Search(index="shakespeare", size = 0)$hits$total
##D 
##D ## search exists check
##D ### use size set to 0 and terminate_after set to 1
##D ### if there are > 0 hits, then there are matching documents
##D Search(index="shakespeare", type="act", size = 0, terminate_after = 1)
##D 
##D ## sorting
##D ### if ES >5, we need to make sure fielddata is turned on for a field 
##D ### before using it for sort 
##D if (gsub("\\.", "", ping()$version$number) >= 500) {
##D   mapping_create("shakespeare", "act", update_all_types = TRUE, body = '{
##D     "properties": {
##D       "speaker": { 
##D       "type":     "text",
##D       "fielddata": true
##D     }
##D   }
##D  }')
##D  Search(index="shakespeare", type="act", sort="speaker")
##D }
##D 
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   Search(index="shakespeare", type="act", sort="speaker:desc", 
##D     fields='speaker')
##D   Search(index="shakespeare", type="act",
##D     sort=c("speaker:desc","play_name:asc"), fields=c('speaker','play_name'))
##D }
##D 
##D 
##D ## paging
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   Search(index="shakespeare", size=1)$hits$hits
##D   Search(index="shakespeare", size=1, from=1)$hits$hits
##D }
##D 
##D ## queries
##D ### Search in all fields
##D Search(index="shakespeare", type="act", q="york")
##D 
##D ### Searchin specific fields
##D Search(index="shakespeare", type="act", q="speaker:KING HENRY IV")$hits$total
##D 
##D ### Exact phrase search by wrapping in quotes
##D Search(index="shakespeare", type="act", q='speaker:"KING HENRY IV"')$hits$total
##D 
##D ### can specify operators between multiple words parenthetically
##D Search(index="shakespeare", type="act", q="speaker:(HENRY OR ARCHBISHOP)")$hits$total
##D 
##D ### where the field line_number has no value (or is missing)
##D Search(index="shakespeare", q="_missing_:line_number")$hits$total
##D 
##D ### where the field line_number has any non-null value
##D Search(index="shakespeare", q="_exists_:line_number")$hits$total
##D 
##D ### wildcards, either * or ?
##D Search(index="shakespeare", q="*ay")$hits$total
##D Search(index="shakespeare", q="m?y")$hits$total
##D 
##D ### regular expressions, wrapped in forward slashes
##D Search(index="shakespeare", q="text_entry:/[a-z]/")$hits$total
##D 
##D ### fuzziness
##D Search(index="shakespeare", q="text_entry:ma~")$hits$total
##D Search(index="shakespeare", q="text_entry:the~2")$hits$total
##D Search(index="shakespeare", q="text_entry:the~1")$hits$total
##D 
##D ### Proximity searches
##D Search(index="shakespeare", q='text_entry:"as hath"~5')$hits$total
##D Search(index="shakespeare", q='text_entry:"as hath"~10')$hits$total
##D 
##D ### Ranges, here where line_id value is between 10 and 20
##D Search(index="shakespeare", q="line_id:[10 TO 20]")$hits$total
##D 
##D ### Grouping
##D Search(index="shakespeare", q="(hath OR as) AND the")$hits$total
##D 
##D # Limit number of hits returned with the size parameter
##D Search(index="shakespeare", size=1)
##D 
##D # Give explanation of search in result
##D Search(index="shakespeare", size=1, explain=TRUE)
##D 
##D ## terminate query after x documents found
##D ## setting to 1 gives back one document for each shard
##D Search(index="shakespeare", terminate_after=1)
##D ## or set to other number
##D Search(index="shakespeare", terminate_after=2)
##D 
##D ## Get version number for each document
##D Search(index="shakespeare", version=TRUE, size=2)
##D 
##D ## Get raw data
##D Search(index="shakespeare", type="scene", raw=TRUE)
##D 
##D ## Curl options
##D library('httr')
##D 
##D ### verbose 
##D out <- Search(index="shakespeare", type="line", config = verbose())
##D 
##D ### print progress
##D res <- Search(config = progress(), size = 5000)
##D 
##D 
##D 
##D # Query DSL searches - queries sent in the body of the request
##D ## Pass in as an R list
##D 
##D ### if ES >5, we need to make sure fielddata is turned on for a field 
##D ### before using it for aggregations 
##D if (gsub("\\.", "", ping()$version$number) >= 500) {
##D   mapping_create("shakespeare", "act", update_all_types = TRUE, body = '{
##D     "properties": {
##D       "text_entry": { 
##D         "type":     "text",
##D         "fielddata": true
##D      }
##D    }
##D  }')
##D  aggs <- list(aggs = list(stats = list(terms = list(field = "text_entry"))))
##D  Search(index="shakespeare", body=aggs)
##D }
##D 
##D ### if ES >5, you don't need to worry about fielddata
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D    aggs <- list(aggs = list(stats = list(terms = list(field = "text_entry"))))
##D    Search(index="shakespeare", body=aggs)
##D }
##D 
##D ## or pass in as json query with newlines, easy to read
##D aggs <- '{
##D     "aggs": {
##D         "stats" : {
##D             "terms" : {
##D                 "field" : "text_entry"
##D             }
##D         }
##D     }
##D }'
##D Search(index="shakespeare", body=aggs)
##D 
##D ## or pass in collapsed json string
##D aggs <- '{"aggs":{"stats":{"terms":{"field":"text_entry"}}}}'
##D Search(index="shakespeare", body=aggs)
##D 
##D 
##D ## Aggregations
##D ### Histograms
##D aggs <- '{
##D     "aggs": {
##D         "latbuckets" : {
##D            "histogram" : {
##D                "field" : "decimalLatitude",
##D                "interval" : 5
##D            }
##D         }
##D     }
##D }'
##D Search(index="gbif", body=aggs, size=0)
##D 
##D ### Histograms w/ more options
##D aggs <- '{
##D     "aggs": {
##D         "latbuckets" : {
##D            "histogram" : {
##D                "field" : "decimalLatitude",
##D                "interval" : 5,
##D                "min_doc_count" : 0,
##D                "extended_bounds" : {
##D                    "min" : -90,
##D                    "max" : 90
##D                }
##D            }
##D         }
##D     }
##D }'
##D Search(index="gbif", body=aggs, size=0)
##D 
##D ### Ordering the buckets by their doc_count - ascending:
##D aggs <- '{
##D     "aggs": {
##D         "latbuckets" : {
##D            "histogram" : {
##D                "field" : "decimalLatitude",
##D                "interval" : 5,
##D                "min_doc_count" : 0,
##D                "extended_bounds" : {
##D                    "min" : -90,
##D                    "max" : 90
##D                },
##D                "order" : {
##D                    "_count" : "desc"
##D                }
##D            }
##D         }
##D     }
##D }'
##D out <- Search(index="gbif", body=aggs, size=0)
##D lapply(out$aggregations$latbuckets$buckets, data.frame)
##D 
##D ### By default, the buckets are returned as an ordered array. It is also possible to
##D ### request the response as a hash instead keyed by the buckets keys:
##D aggs <- '{
##D     "aggs": {
##D         "latbuckets" : {
##D            "histogram" : {
##D                "field" : "decimalLatitude",
##D                "interval" : 10,
##D                "keyed" : true
##D            }
##D         }
##D     }
##D }'
##D Search(index="gbif", body=aggs, size=0)
##D 
##D # match query
##D match <- '{"query": {"match" : {"text_entry" : "Two Gentlemen"}}}'
##D Search(index="shakespeare", body=match)
##D 
##D # multi-match (multiple fields that is) query
##D mmatch <- '{"query": {"multi_match" : {"query" : "henry", "fields": ["text_entry","play_name"]}}}'
##D Search(index="shakespeare", body=mmatch)
##D 
##D # bool query
##D mmatch <- '{
##D  "query": {
##D    "bool" : {
##D      "must_not" : {
##D        "range" : {
##D          "speech_number" : {
##D            "from" : 1, "to": 5
##D }}}}}}'
##D Search(index="shakespeare", body=mmatch)
##D 
##D # Boosting query
##D boost <- '{
##D  "query" : {
##D   "boosting" : {
##D       "positive" : {
##D           "term" : {
##D               "play_name" : "henry"
##D           }
##D       },
##D       "negative" : {
##D           "term" : {
##D               "text_entry" : "thou"
##D           }
##D       },
##D       "negative_boost" : 0.8
##D     }
##D  }
##D }'
##D Search(index="shakespeare", body=boost)
##D 
##D # Fuzzy query
##D ## fuzzy query on numerics
##D fuzzy <- list(query = list(fuzzy = list(text_entry = "arms")))
##D Search(index="shakespeare", body=fuzzy)$hits$total
##D fuzzy <- list(query = list(fuzzy = list(text_entry = list(value = "arms", fuzziness = 4))))
##D Search(index="shakespeare", body=fuzzy)$hits$total
##D 
##D # geoshape query
##D ## not working yets
##D geo <- list(query = list(geo_shape = list(location = list(shape = list(type = "envelope",
##D    coordinates = "[[2,10],[10,20]]")))))
##D geo <- '{
##D  "query": {
##D    "geo_shape": {
##D      "location": {
##D        "point": {
##D          "type": "envelope",
##D          "coordinates": [[2,0],[2.93,100]]
##D        }
##D      }
##D    }
##D  }
##D }'
##D # Search(index="gbifnewgeo", body=geo)
##D 
##D # range query
##D ## with numeric
##D body <- list(query=list(range=list(decimalLongitude=list(gte=1, lte=3))))
##D Search('gbif', body=body)$hits$total
##D 
##D body <- list(query=list(range=list(decimalLongitude=list(gte=2.9, lte=10))))
##D Search('gbif', body=body)$hits$total
##D 
##D ## with dates
##D body <- list(query=list(range=list(eventDate=list(gte="2012-01-01", lte="now"))))
##D Search('gbif', body=body)$hits$total
##D 
##D body <- list(query=list(range=list(eventDate=list(gte="2014-01-01", lte="now"))))
##D Search('gbif', body=body)$hits$total
##D 
##D # more like this query (more_like_this can be shortened to mlt)
##D body <- '{
##D  "query": {
##D    "more_like_this": {
##D      "fields": ["title"],
##D      "like_text": "and then",
##D      "min_term_freq": 1,
##D      "max_query_terms": 12
##D    }
##D  }
##D }'
##D Search('plos', body=body)$hits$total
##D 
##D body <- '{
##D  "query": {
##D    "more_like_this": {
##D      "fields": ["abstract","title"],
##D      "like_text": "cell",
##D      "min_term_freq": 1,
##D      "max_query_terms": 12
##D    }
##D  }
##D }'
##D Search('plos', body=body)$hits$total
##D 
##D # Highlighting
##D body <- '{
##D  "query": {
##D    "query_string": {
##D      "query" : "cell"
##D    }
##D  },
##D  "highlight": {
##D    "fields": {
##D      "title": {"number_of_fragments": 2}
##D    }
##D  }
##D }'
##D out <- Search('plos', 'article', body=body)
##D out$hits$total
##D sapply(out$hits$hits, function(x) x$`_source`$title[[1]])
##D 
##D ### Common terms query
##D body <- '{
##D  "query" : {
##D    "common": {
##D       "body": {
##D            "query": "this is",
##D            "cutoff_frequency": 0.01
##D        }
##D      }
##D   }
##D }'
##D Search('shakespeare', 'line', body=body)
##D 
##D ## Scrolling search - instead of paging
##D res <- Search(index = 'shakespeare', q="a*", time_scroll="1m")
##D scroll(res$`_scroll_id`)
##D 
##D res <- Search(index = 'shakespeare', q="a*", time_scroll="5m")
##D out <- list()
##D hits <- 1
##D while(hits != 0){
##D   res <- scroll(res$`_scroll_id`)
##D   hits <- length(res$hits$hits)
##D   if(hits > 0)
##D     out <- c(out, res$hits$hits)
##D }
##D 
##D ### Sliced scrolling
##D #### For scroll queries that return a lot of documents it is possible to 
##D #### split the scroll in multiple slices which can be consumed independently
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
##D 
##D # Using filters
##D ## A bool filter
##D body <- '{
##D  "query":{
##D    "bool": {
##D      "must_not" : {
##D        "range" : {
##D          "year" : { "from" : 2011, "to" : 2012 }
##D        }
##D      }
##D    }
##D  }
##D }'
##D Search('gbif', body = body)$hits$total
##D 
##D ## Geo filters - fun!
##D ### Note that filers have many geospatial filter options, but queries 
##D ### have fewer, andrequire a geo_shape mapping
##D 
##D body <- '{
##D  "mappings": {
##D    "record": {
##D      "properties": {
##D          "location" : {"type" : "geo_point"}
##D       }
##D    }
##D  }
##D }'
##D index_recreate(index='gbifgeopoint', body=body)
##D path <- system.file("examples", "gbif_geopoint.json", package = "elastic")
##D invisible(docs_bulk(path))
##D 
##D ### Points within a bounding box
##D body <- '{
##D  "query":{
##D    "bool" : {
##D      "must" : {
##D        "match_all" : {}
##D      },
##D      "filter":{
##D         "geo_bounding_box" : {
##D           "location" : {
##D             "top_left" : {
##D               "lat" : 60,
##D               "lon" : 1
##D             },
##D             "bottom_right" : {
##D               "lat" : 40,
##D               "lon" : 14
##D             }
##D           }
##D        }
##D      }
##D    }
##D  }
##D }'
##D out <- Search('gbifgeopoint', body = body, size = 300)
##D out$hits$total
##D do.call(rbind, lapply(out$hits$hits, function(x) x$`_source`$location))
##D 
##D ### Points within distance of a point
##D body <- '{
##D "query": {
##D   "bool" : {
##D     "must" : {
##D       "match_all" : {}
##D     },
##D    "filter" : {
##D      "geo_distance" : {
##D        "distance" : "200km",
##D        "location" : {
##D          "lon" : 4,
##D          "lat" : 50
##D        }
##D      }
##D   }
##D }}}'
##D out <- Search('gbifgeopoint', body = body)
##D out$hits$total
##D do.call(rbind, lapply(out$hits$hits, function(x) x$`_source`$location))
##D 
##D ### Points within distance range of a point
##D body <- '{
##D  "aggs":{
##D    "points_within_dist" : {
##D      "geo_distance" : {
##D         "field": "location",
##D         "origin" : "4, 50",
##D         "ranges": [ 
##D           {"from" : 200},
##D           {"to" : 400}
##D          ]
##D      }
##D    }
##D  }
##D }'
##D out <- Search('gbifgeopoint', body = body)
##D out$hits$total
##D do.call(rbind, lapply(out$hits$hits, function(x) x$`_source`$location))
##D 
##D ### Points within a polygon
##D body <- '{
##D  "query":{
##D    "bool" : {
##D      "must" : {
##D        "match_all" : {}
##D      },
##D      "filter":{
##D         "geo_polygon" : {
##D           "location" : {
##D              "points" : [
##D                [80.0, -20.0], [-80.0, -20.0], [-80.0, 60.0], [40.0, 60.0], [80.0, -20.0]
##D              ]
##D            }
##D          }
##D        }
##D      }
##D    }
##D }'
##D out <- Search('gbifgeopoint', body = body)
##D out$hits$total
##D do.call(rbind, lapply(out$hits$hits, function(x) x$`_source`$location))
##D 
##D ### Geoshape filters using queries instead of filters
##D #### Get data with geojson type location data loaded first
##D body <- '{
##D  "mappings": {
##D    "record": {
##D      "properties": {
##D          "location" : {"type" : "geo_shape"}
##D       }
##D    }
##D  }
##D }'
##D index_recreate(index='geoshape', body=body)
##D path <- system.file("examples", "gbif_geoshape.json", package = "elastic")
##D invisible(docs_bulk(path))
##D 
##D #### Get data with a square envelope, w/ point defining upper left and the other
##D #### defining the lower right
##D body <- '{
##D  "query":{
##D    "geo_shape" : {
##D      "location" : {
##D          "shape" : {
##D            "type": "envelope",
##D             "coordinates": [[-30, 50],[30, 0]]
##D          }
##D        }
##D      }
##D    }
##D }'
##D out <- Search('geoshape', body = body)
##D out$hits$total
##D 
##D #### Get data with a circle, w/ point defining center, and radius
##D body <- '{
##D  "query":{
##D    "geo_shape" : {
##D      "location" : {
##D          "shape" : {
##D            "type": "circle",
##D            "coordinates": [-10, 45],
##D            "radius": "2000km"
##D          }
##D        }
##D      }
##D    }
##D }'
##D out <- Search('geoshape', body = body)
##D out$hits$total
##D 
##D #### Use a polygon, w/ point defining center, and radius
##D body <- '{
##D  "query":{
##D    "geo_shape" : {
##D      "location" : {
##D          "shape" : {
##D            "type": "polygon",
##D            "coordinates":  [
##D               [ [80.0, -20.0], [-80.0, -20.0], [-80.0, 60.0], [40.0, 60.0], [80.0, -20.0] ]
##D            ]
##D          }
##D        }
##D      }
##D    }
##D }'
##D out <- Search('geoshape', body = body)
##D out$hits$total
##D 
##D 
##D # Geofilter with WKT
##D # format follows "BBOX (minlon, maxlon, maxlat, minlat)"
##D x <- '{
##D     "query": {
##D         "bool" : {
##D             "must" : {
##D                 "match_all" : {}
##D             },
##D             "filter" : {
##D                 "geo_bounding_box" : {
##D                     "pin.location" : {
##D                         "wkt" : "BBOX (1, 14, 60, 40)"
##D                     }
##D                 }
##D             }
##D         }
##D     }
##D }'
##D out <- Search('gbifgeopoint', body = body)
##D out$hits$total
##D 
##D 
##D 
##D # Missing filter
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5
##D   body <- '{
##D    "query":{
##D      "constant_score" : {
##D        "filter" : {
##D          "missing" : { "field" : "play_name" }
##D        }
##D      }
##D     }
##D   }'
##D   Search("shakespeare", body = body)
##D } else {
##D   ### ES => v5
##D   body <- '{
##D    "query":{
##D      "bool" : {
##D        "must_not" : {
##D          "exists" : { 
##D            "field" : "play_name" 
##D          }
##D        }
##D     }
##D    }
##D   }'
##D   Search("shakespeare", body = body)
##D }
##D 
##D # prefix filter
##D body <- '{
##D  "query": {
##D    "bool": {
##D      "must": {
##D        "prefix" : {
##D          "speaker" : "we"
##D        }
##D      }
##D    }
##D  }
##D }'
##D x <- Search("shakespeare", body = body)
##D x$hits$total
##D vapply(x$hits$hits, "[[", "", c("_source", "speaker"))
##D 
##D 
##D # ids filter
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5
##D   body <- '{
##D    "query":{
##D      "bool": {
##D        "must": {
##D          "ids" : {
##D            "values": ["1","2","10","2000"]
##D         }
##D       }
##D     }
##D    }
##D   }'
##D   x <- Search("shakespeare", body = body)
##D   x$hits$total
##D   identical(
##D    c("1","2","10","2000"),
##D    vapply(x$hits$hits, "[[", "", "_id")
##D   )
##D } else {
##D   body <- '{
##D    "query":{
##D      "ids" : {
##D        "values": ["1","2","10","2000"]
##D      }
##D    }
##D   }'
##D   x <- Search("shakespeare", body = body)
##D   x$hits$total
##D   identical(
##D    c("2000","10","2","1"),
##D    vapply(x$hits$hits, "[[", "", "_id")
##D   )
##D }
##D 
##D # combined prefix and ids filters
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5
##D   body <- '{
##D    "query":{
##D      "bool" : {
##D        "should" : {
##D          "or": [{
##D            "ids" : {
##D              "values": ["1","2","3","10","2000"]
##D            }
##D          }, {
##D          "prefix" : {
##D            "speaker" : "we"
##D          }
##D         }
##D       ]
##D      }
##D     }
##D    }
##D   }'
##D   x <- Search("shakespeare", body = body)
##D   x$hits$total
##D } else {
##D   ### ES => v5
##D   body <- '{
##D    "query":{
##D      "bool" : {
##D        "should" : [
##D          {
##D            "ids" : {
##D              "values": ["1","2","3","10","2000"]
##D            }
##D          }, 
##D          {
##D            "prefix" : {
##D              "speaker" : "we"
##D            }
##D          }
##D       ]
##D      }
##D     }
##D   }'
##D   x <- Search("shakespeare", body = body)
##D   x$hits$total
##D }
##D 
##D # Suggestions
##D sugg <- '{
##D  "query" : {
##D     "match" : {
##D       "text_entry" : "late"
##D      }
##D  },  
##D  "suggest" : {
##D    "sugg" : {
##D      "text" : "late",
##D      "term" : {
##D          "field" : "text_entry"
##D       }
##D     }
##D   }
##D }'
##D Search(index = "shakespeare", "line", body = sugg, 
##D   asdf = TRUE, size = 0)$suggest$sugg$options
##D 
##D 
##D 
##D # stream data out using jsonlite::stream_out
##D file <- tempfile()
##D res <- Search("shakespeare", size = 1000, stream_opts = list(file = file))
##D head(df <- jsonlite::stream_in(file(file)))
##D NROW(df)
##D unlink(file)
##D 
## End(Not run)



