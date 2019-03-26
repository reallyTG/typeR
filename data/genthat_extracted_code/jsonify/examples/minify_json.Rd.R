library(jsonify)


### Name: minify_json
### Title: Minify Json
### Aliases: minify_json

### ** Examples


df <- data.frame(id = 1:10, val = rnorm(10))
js <- to_json( df )
jsp <- pretty_json(js)
minify_json( jsp )




