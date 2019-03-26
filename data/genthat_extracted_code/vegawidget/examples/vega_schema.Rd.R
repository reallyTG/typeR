library(vegawidget)


### Name: vega_schema
### Title: Create string for schema-URL
### Aliases: vega_schema

### ** Examples

  vega_schema()
  vega_schema("vega", major = FALSE)

  # creating a spec by hand
  spec <-
    list(
      `$schema` = vega_schema(),
      width = 300,
      height = 300
      # and so on
    ) %>%
    as_vegaspec()




