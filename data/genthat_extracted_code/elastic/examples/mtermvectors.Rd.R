library(elastic)


### Name: mtermvectors
### Title: Multi Termvectors
### Aliases: mtermvectors

### ** Examples

## Not run: 
##D connect()
##D if (!index_exists('omdb')) {
##D   omdb <- system.file("examples", "omdb.json", package = "elastic")
##D   docs_bulk(omdb)
##D }
##D 
##D # no index or type given
##D body <- '{
##D    "docs": [
##D       {
##D          "_index": "omdb",
##D          "_type": "omdb",
##D          "_id": "AVXdx8Eqg_0Z_tpMDyP_",
##D          "term_statistics": true
##D       },
##D       {
##D          "_index": "omdb",
##D          "_type": "omdb",
##D          "_id": "AVXdx8Eqg_0Z_tpMDyQ1",
##D          "fields": [
##D             "Plot"
##D          ]
##D       }
##D    ]
##D }'
##D mtermvectors(body = body)
##D 
##D # index given, but not type
##D body <- '{
##D    "docs": [
##D       {
##D          "_type": "omdb",
##D          "_id": "AVXdx8Eqg_0Z_tpMDyP_",
##D          "fields": [
##D             "Plot"
##D          ],
##D          "term_statistics": true
##D       },
##D       {
##D          "_type": "omdb",
##D          "_id": "AVXdx8Eqg_0Z_tpMDyQ1",
##D          "fields": [
##D             "Title"
##D          ]
##D       }
##D    ]
##D }'
##D mtermvectors('omdb', body = body)
##D 
##D # index and type given
##D body <- '{
##D    "docs": [
##D       {
##D          "_id": "AVXdx8Eqg_0Z_tpMDyP_",
##D          "fields": [
##D             "Plot"
##D          ],
##D          "term_statistics": true
##D       },
##D       {
##D          "_id": "AVXdx8Eqg_0Z_tpMDyQ1"
##D       }
##D    ]
##D }'
##D mtermvectors('omdb', 'omdb', body = body)
##D 
##D # index and type given, parameters same, so can simplify
##D body <- '{
##D     "ids" : ["AVXdx8Eqg_0Z_tpMDyP_", "AVXdx8Eqg_0Z_tpMDyQ1"],
##D     "parameters": {
##D         "fields": [
##D             "Plot"
##D         ],
##D         "term_statistics": true
##D     }
##D }'
##D mtermvectors('omdb', 'omdb', body = body)
##D 
##D # you can give user provided documents via the 'docs' parameter
##D ## though you have to give index and type that exist in your Elasticsearch 
##D ## instance
##D body <- '{
##D    "docs": [
##D       {
##D          "_index": "omdb",
##D          "_type": "omdb",
##D          "doc" : {
##D             "Director" : "John Doe",
##D             "Plot" : "twitter test test test"
##D          }
##D       },
##D       {
##D          "_index": "omdb",
##D          "_type": "omdb",
##D          "doc" : {
##D            "Director" : "Jane Doe",
##D            "Plot" : "Another twitter test ..."
##D          }
##D       }
##D    ]
##D }'
##D mtermvectors(body = body)
## End(Not run)



