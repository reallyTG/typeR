## ----echo=FALSE, results="hide"------------------------------------------
knitr::opts_chunk$set(error=FALSE)

## ------------------------------------------------------------------------
schema <- '{
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "Product",
    "description": "A product from Acme\'s catalog",
    "type": "object",
    "properties": {
        "id": {
            "description": "The unique identifier for a product",
            "type": "integer"
        },
        "name": {
            "description": "Name of the product",
            "type": "string"
        },
        "price": {
            "type": "number",
            "minimum": 0,
            "exclusiveMinimum": true
        },
        "tags": {
            "type": "array",
            "items": {
                "type": "string"
            },
            "minItems": 1,
            "uniqueItems": true
        }
    },
    "required": ["id", "name", "price"]
}'

## ------------------------------------------------------------------------
v <- jsonvalidate::json_validator(schema)

## ------------------------------------------------------------------------
writeLines(schema, "schema.json")
v <- jsonvalidate::json_validator("schema.json")

## ------------------------------------------------------------------------
v("{}")

## ------------------------------------------------------------------------
v("{}", verbose=TRUE)

## ----error=TRUE----------------------------------------------------------
v("{}", error=TRUE)

## ------------------------------------------------------------------------
v("{}", verbose=TRUE, greedy=TRUE)

## ------------------------------------------------------------------------
v('{
    "id": 1,
    "name": "A green door",
    "price": 12.50,
    "tags": ["home", "green"]
}')

## ------------------------------------------------------------------------
v('{
    "id": 1,
    "name": "A green door",
    "price": -1,
    "tags": ["home", "green"]
}', verbose=TRUE)

## ------------------------------------------------------------------------
v('{
    "id": 1,
    "name": "A green door",
    "price": 12.50,
    "tags": ["home", "home"]
}', verbose=TRUE)

## ------------------------------------------------------------------------
v('{
    "id": "identifier",
    "name": 1,
    "price": -1,
    "tags": ["home", "home", 1]
}', verbose=TRUE)

## ------------------------------------------------------------------------
json <- '{
    "id": 1,
    "name": "A green door",
    "price": 12.50,
    "tags": ["home", "green"]
}'
jsonvalidate::json_validate(json, schema)

## ----echo=FALSE, results="hide"------------------------------------------
file.remove("schema.json")

