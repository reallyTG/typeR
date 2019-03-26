library(d3r)


### Name: d3_nest
### Title: Convert a 'data.frame' to a 'd3.js' Hierarchy
### Aliases: d3_nest

### ** Examples

# convert Titanic to a nested d3 hierarchy

# devtools::install_github("timelyportfolio/d3r")
library(d3r)
library(dplyr)

titanic_df <- data.frame(Titanic)
tit_tb <- titanic_df %>%
  select(Class,Age,Survived,Sex,Freq) %>%
  d3_nest(value_cols="Freq", root="titanic")

tit_tb

# see as tibble
titanic_df %>%
  select(Class,Age,Survived,Sex,Freq) %>%
  d3_nest(value_cols="Freq", root="titanic", json=FALSE)

# see the structure with listviewer
tit_tb %>%
  listviewer::jsonedit()
## Not run: 
##D   library(treemap)
##D   library(d3r)
##D   library(dplyr)
##D   library(tidyr)
##D 
##D   treemap::random.hierarchical.data() %>%
##D     d3_nest(value_cols = "x")
##D 
##D   # use example from ?treemap
##D   data(GNI2014)
##D   treemap(
##D     GNI2014,
##D     index=c("continent", "iso3"),
##D     vSize="population",
##D     vColor="GNI",
##D     type="value",
##D     draw=FALSE
##D   ) %>%
##D     {.$tm} %>%
##D     select(continent,iso3,color,vSize) %>%
##D     d3_nest(value_cols = c("color", "vSize"))
## End(Not run)



