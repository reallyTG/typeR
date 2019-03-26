library(bigrquery)


### Name: bq_field
### Title: BiqQuery field (and fields) class
### Aliases: bq_field bq_fields as_bq_field as_bq_fields

### ** Examples

bq_field("name", "string")

as_bq_fields(list(
  list(name = "name", type = "string"),
  bq_field("age", "integer")
))

# as_bq_fields() can also take a data frame
as_bq_fields(mtcars)



