library(elastic)


### Name: mapping
### Title: Mapping management
### Aliases: mapping mapping_create mapping_get field_mapping_get
###   type_exists

### ** Examples

## Not run: 
##D # Used to check if a type/types exists in an index/indices
##D type_exists(index = "plos", type = "article")
##D type_exists(index = "plos", type = "articles")
##D type_exists(index = "shakespeare", type = "line")
##D 
##D # The put mapping API allows to register specific mapping definition for a specific type.
##D ## a good mapping body
##D body <- list(citation = list(properties = list(
##D  journal = list(type="text"),
##D  year = list(type="long")
##D )))
##D if (!index_exists("plos")) index_create("plos")
##D mapping_create(index = "plos", type = "citation", body=body)
##D 
##D ### or as json
##D body <- '{
##D   "citation": {
##D     "properties": {
##D       "journal": { "type": "text" },
##D       "year": { "type": "long" }
##D }}}'
##D mapping_create(index = "plos", type = "citation", body=body)
##D mapping_get("plos", "citation")
##D 
##D ## A bad mapping body
##D body <- list(things = list(properties = list(
##D   journal = list("text")
##D )))
##D # mapping_create(index = "plos", type = "things", body=body)
##D 
##D # Get mappings
##D mapping_get('_all')
##D mapping_get(index = "plos")
##D mapping_get(index = c("shakespeare","plos"))
##D mapping_get(index = "shakespeare", type = "act")
##D mapping_get(index = "shakespeare", type = c("act","line"))
##D 
##D # Get field mappings
##D plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D invisible(docs_bulk(plosdat))
##D field_mapping_get(index = "_all", type=c('article', 'line'), field = "text")
##D field_mapping_get(index = "plos", type = "article", field = "title")
##D field_mapping_get(index = "plos", type = "article", field = "*")
##D field_mapping_get(index = "plos", type = "article", field = "title", include_defaults = TRUE)
##D field_mapping_get(type = c("article","record"), field = c("title","class"))
##D field_mapping_get(type = "a*", field = "t*")
##D 
##D # Create geospatial mapping
##D if (index_exists("gbifgeopoint")) index_delete("gbifgeopoint")
##D file <- system.file("examples", "gbif_geopoint.json", package = "elastic")
##D index_create("gbifgeopoint")
##D body <- '{
##D  "properties" : {
##D    "location" : { "type" : "geo_point" }
##D  }
##D }'
##D mapping_create("gbifgeopoint", "record", body = body)
##D invisible(docs_bulk(file))
##D 
##D # update_all_fields, see also ?fielddata
##D if (es_ver() < 603) {
##D  mapping_create("shakespeare", "record", update_all_types=TRUE, body = '{
##D    "properties": {
##D      "speaker": { 
##D        "type":     "text",
##D        "fielddata": true
##D      }
##D    }
##D  }')
##D } else {
##D  index_create('brownchair')
##D  mapping_create('brownchair', 'brown', body = '{
##D    "properties": {
##D      "foo": { 
##D        "type":     "text",
##D        "fielddata": true
##D      }
##D    }
##D  }')
##D }
##D 
## End(Not run)



