library(dgo)


### Name: shape
### Title: Prepare data for modeling
### Aliases: shape

### ** Examples

# model individual item responses
shaped_responses <- shape(opinion, item_names = "abortion", time_name =
  "year", geo_name = "state", group_names = "race3")

# summarize result)
summary(shaped_responses)

# check sparseness of data to be modeled
get_item_n(shaped_responses, by = "year")




