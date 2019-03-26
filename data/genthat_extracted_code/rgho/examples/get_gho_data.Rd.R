library(rgho)


### Name: get_gho_data
### Title: Returns GHO Data
### Aliases: get_gho_data

### ** Examples


result <- get_gho_data(
  dimension = "GHO",
  code = "MDG_0000000001"
)
print(result, width = Inf)


result <- get_gho_data(
  dimension = "GHO",
  code = "MDG_0000000001",
  filter = list(
    REGION = "EUR",
    YEAR = "2015"
  )
)
print(result, width = Inf)




