library(elastic)


### Name: Search_template
### Title: Search or validate templates
### Aliases: Search_template Search_template_register Search_template_get
###   Search_template_delete Search_template_render

### ** Examples

## Not run: 
##D if (!index_exists("iris")) {
##D   invisible(docs_bulk(iris, "iris"))
##D }
##D 
##D body1 <- '{
##D   "inline" : {
##D     "query": { "match" : { "{{my_field}}" : "{{my_value}}" } },
##D     "size" : "{{my_size}}"
##D   },
##D   "params" : {
##D     "my_field" : "Species",
##D     "my_value" : "setosa",
##D     "my_size" : 3
##D   }
##D }'
##D Search_template(body = body1)
##D 
##D body2 <- '{
##D  "inline": {
##D    "query": {
##D       "match": {
##D           "Species": "{{query_string}}"
##D       }
##D    }
##D  },
##D  "params": {
##D    "query_string": "versicolor"
##D  }
##D }'
##D Search_template(body = body2)
##D 
##D # pass in a list
##D mylist <- list(
##D   inline = list(query = list(match = list(`{{my_field}}` = "{{my_value}}"))),
##D   params = list(my_field = "Species", my_value = "setosa", my_size = 3L)
##D )
##D Search_template(body = mylist)
##D 
##D ## Validating templates w/ Search_template_render()
##D Search_template_render(body = body1)
##D Search_template_render(body = body2)
##D 
##D ## pre-registered templates
##D ### register a template
##D body3 <- '{
##D   "template": {
##D      "query": {
##D          "match": {
##D              "Species": "{{query_string}}"
##D          }
##D      }
##D    }
##D }'
##D Search_template_register('foobar', body = body3)
##D 
##D ### get template
##D Search_template_get('foobar')
##D 
##D ### use the template
##D body4 <- '{
##D  "id": "foobar",
##D   	"params": {
##D       "query_string": "setosa"
##D   }
##D }'
##D Search_template(body = body4)
##D 
##D ### delete the template
##D Search_template_delete('foobar')
## End(Not run)



