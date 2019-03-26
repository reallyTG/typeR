library(spData)


### Name: nz
### Title: Regions in New Zealand
### Aliases: nz new_zealand
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  summary(nz)
  plot(nz)
}
## Not run: 
##D # Find "Regional Council 2018 Clipped (generalised)"
##D # select the GeoPackage option in the "Vectors/tables" dropdown
##D # at https://datafinder.stats.govt.nz/data/ (requires registration)
##D # Save the result as:
##D unzip("statsnzregional-council-2018-clipped-generalised-GPKG.zip")
##D library(sf)
##D library(tidyverse)
##D nz_full = st_read("regional-council-2018-clipped-generalised.gpkg")
##D print(object.size(nz_full), units = "Kb") # 14407.2 Kb
##D nz = rmapshaper::ms_simplify(nz_full, keep = 0.001, sys = TRUE)
##D print(object.size(nz), units = "Kb") # 39.9 Kb
##D names(nz)
##D nz$REGC2018_V1_00_NAME
##D nz = filter(nz, REGC2018_V1_00_NAME != "Area Outside Region") %>%
##D         select(Name = REGC2018_V1_00_NAME, `Land_area` = LAND_AREA_SQ_KM)
##D # regions basic info
##D # devtools::install_github("hadley/rvest")
##D library(rvest)
##D doc = read_html("https://en.wikipedia.org/wiki/Regions_of_New_Zealand") %>%
##D         html_nodes("div table")
##D tab = doc[[3]] %>% html_table()
##D tab = tab %>% select(Name = Region, Population = `Population[20]`, Island)
##D tab = tab %>% mutate(Population = str_replace_all(Population, ",", "")) %>%
##D         mutate(Population = as.numeric(Population)) %>%
##D         mutate(Name = str_remove_all(Name, " \\([1-9]\\)?.+"))
##D nz$Name = as.character(nz$Name)
##D nz$Name = str_remove(nz$Name, " Region")
##D nz$Name %in% tab$Name
##D # regions additional info
##D library(nzcensus)
##D nz_add_data = REGC2013 %>% 
##D         select(Name = REGC2013_N, Median_income = MedianIncome2013, 
##D                PropFemale2013, PropMale2013) %>% 
##D         mutate(Sex_ratio = PropMale2013 / PropFemale2013) %>% 
##D         mutate(Name = gsub(" Region", "", Name)) %>% 
##D         select(Name, Median_income, Sex_ratio)
##D # data join
##D nz = left_join(nz, tab, by = "Name") %>% 
##D         left_join(nz_add_data, by = "Name") %>% 
##D         select(Name, Island, Land_area, Population, Median_income, Sex_ratio)
## End(Not run)



