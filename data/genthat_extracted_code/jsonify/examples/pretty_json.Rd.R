library(jsonify)


### Name: pretty_json
### Title: Pretty Json
### Aliases: pretty_json

### ** Examples


df <- data.frame(id = 1:10, val = rnorm(10))
js <- to_json( df )
pretty_json(js)

## can also use directly on an R object
pretty_json( df )




