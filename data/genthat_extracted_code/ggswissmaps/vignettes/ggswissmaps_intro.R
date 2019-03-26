## ------------------------------------------------------------------------
library(ggswissmaps)

data("shp_df")
class(shp_df)
length(shp_df)
names(shp_df)

## ----eval=FALSE----------------------------------------------------------
#  # Data description
#  ?shp_df

## ------------------------------------------------------------------------
names(maps2)

# By name
maps2[["g1k15"]]

# By index
maps2[[5]]

## ------------------------------------------------------------------------
ggplot(shp_df[["g1k15"]], aes(x = long, y = lat, group = group)) +
  geom_path() +
  coord_equal() +
  theme_white_f()

## ----message=FALSE-------------------------------------------------------
# Data frame with the coordinates of all swiss districts
d <- shp_df[["g1b15"]]

# Look at the structure of the data frame
str(d)

# The cantons are identified by the KTNR column

# Extract from this data the districts of two cantons
library(dplyr)
d <- d %>% dplyr::filter(KTNR %in% c(18, 21))

# And draw the map
maps2_(d)

