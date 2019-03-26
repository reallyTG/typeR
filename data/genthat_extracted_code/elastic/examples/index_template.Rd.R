library(elastic)


### Name: index_template
### Title: Index templates
### Aliases: index_template index_template_put index_template_get
###   index_template_exists index_template_delete

### ** Examples

## Not run: 
##D body <- '{
##D   "template": "te*",
##D   "settings": {
##D     "number_of_shards": 1
##D   },
##D   "mappings": {
##D     "type1": {
##D       "_source": {
##D         "enabled": false
##D       },
##D       "properties": {
##D         "host_name": {
##D           "type": "keyword"
##D         },
##D         "created_at": {
##D           "type": "date",
##D           "format": "EEE MMM dd HH:mm:ss Z YYYY"
##D         }
##D       }
##D     }
##D   }
##D }'
##D index_template_put("template_1", body = body)
##D 
##D # get templates
##D index_template_get()
##D index_template_get("template_1")
##D index_template_get(c("template_1", "template_2"))
##D index_template_get("template_*")
##D ## filter path
##D index_template_get("template_1", filter_path = "*.template")
##D 
##D # template exists
##D index_template_exists("template_1")
##D index_template_exists("foobar")
##D 
##D # delete a template
##D index_template_delete("template_1")
##D index_template_exists("template_1")
## End(Not run)



