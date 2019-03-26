library(spData)


### Name: coffee_data
### Title: World coffee production data
### Aliases: coffee_data
### Keywords: datasets misc

### ** Examples

head(coffee_data)
## Not run: 
##D library(tidyverse)
##D library(sf)
##D # found by searching for "global coffee data"
##D u = "http://www.ico.org/prices/m1-exports.pdf"
##D download.file(u, "data.pdf", mode = "wb")
##D install.packages("pdftables") # requires api key
##D pdftables::convert_pdf(input_file = "data.pdf", output_file = "coffee-data-messy.csv")
##D d = read_csv("coffee-data-messy.csv")
##D file.remove("coffee-data-messy.csv")
##D file.remove("data.pdf")
##D coffee_data = slice(d, -c(1:9)) %>% 
##D         select(name_long = 1, coffee_production_2016 = 2, coffee_production_2017 = 3) %>% 
##D         filter(!is.na(coffee_production_2016)) %>% 
##D         mutate_at(2:3, str_replace, " ", "") %>% 
##D         mutate_at(2:3, as.integer)
##D world_coffee = left_join(world, coffee_data)
##D plot(world_coffee[c("coffee_production_2016", "coffee_production_2017")])
##D b = c(0, 500, 1000, 2000, 3000)
##D library(tmap)
##D tm_shape(world_coffee) +
##D   tm_fill("coffee_production_2017", title = "Thousand 60kg bags", breaks = b,
##D           textNA = "No data", colorNA = NULL)
##D tmap_mode("view") # for an interactive version
## End(Not run)



