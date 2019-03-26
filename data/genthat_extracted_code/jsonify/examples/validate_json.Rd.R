library(jsonify)


### Name: validate_json
### Title: validate JSON
### Aliases: validate_json

### ** Examples


validate_json('[]')
df <- data.frame(id = 1:5, val = letters[1:5])
validate_json( to_json(df) )

validate_json('{"x":1,"y":2,"z":"a"}')

validate_json( c('{"x":1,"y":2,"z":"a"}', to_json(df) ) )
validate_json( c('{"x":1,"y":2,"z":a}', to_json(df) ) )




