library(banR)


### Name: geocode_tbl
### Title: Geocode tbl
### Aliases: geocode_tbl

### ** Examples


table_test <- tibble::tibble(
x = c("39 quai Andre Citroen", "64 Allee de Bercy", "20 avenue de Segur"), 
y = c("75015", "75012", "75007"), 
z = rnorm(3)
)

geocode_tbl(tbl = table_test, adresse = x)
geocode_tbl(tbl = table_test, adresse = x, code_postal = y)




