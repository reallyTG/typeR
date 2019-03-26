## ------------------------------------------------------------------------
library(validatejsonr)
validjson     <- system.file("extdata", "item-3.json", package = "validatejsonr")
schemafile    <- system.file("extdata", "schema.json", package = "validatejsonr")

result <- validate_jsonfile_with_schemafile(validjson, schemafile)
print(result$value)

malformedjson <- system.file("extdata", "malformed-json.json", package = "validatejsonr")

print(result$message)


## ------------------------------------------------------------------------
malformedjson <- system.file("extdata", "malformed-json.json", package = "validatejsonr")

result <- validate_jsonfile_with_schemafile(malformedjson, schemafile)
print(result$value)

print(result$message)

## ------------------------------------------------------------------------
cat("Schema that the function was called with:")
print(result$schema)

cat("JSON File that the function was called with:")
print(result$jsonfile)

## ------------------------------------------------------------------------
invalidjson  <- system.file("extdata", "item-2.json", package = "validatejsonr")

result <- validate_jsonfile_with_schemafile(invalidjson, schemafile)

print(result$value)

print(result$message)

## ------------------------------------------------------------------------
result = tryCatch({
    validate_jsonfile_with_schemafile("missing", schemafile)
}, error = function(e) {
    print(e)
})

result = tryCatch({
validate_jsonfile_with_schemafile(validjson, "missing")
}, error = function(e) {
    print(e)
})

## ------------------------------------------------------------------------
json_code <- "{\"category\": \"book\", \"price\": 25,  \"title\": \"abrakadabra\"}"
result <- validate_result <- validate_json_with_schemafile(json_code, schemafile)
print(result$value)
print(result$message)

## ------------------------------------------------------------------------
json_code <- "{\"category\": \"book\", \"price\": 25,  \"title\": \"abrakadabra\"}"
schema_code     <- readChar(schemafile, file.info(schemafile)$size)
print(schema_code)
result <- validate_result <- validate_json_with_schema(json_code, schema_code)
print(result$value)
print(result$message)
print(result$schema)

