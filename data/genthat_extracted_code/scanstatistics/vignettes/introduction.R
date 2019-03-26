## ---- eval=TRUE, echo=FALSE----------------------------------------------
knitr::opts_chunk$set(fig.width=7.15, fig.height=5)

## ----newmexico_map, eval=TRUE--------------------------------------------
library(scanstatistics)
library(ggplot2)

# Load map data
data(NM_map)
data(NM_geo)

# Plot map with labels at centroids
ggplot() + 
  geom_polygon(data = NM_map,
               mapping = aes(x = long, y = lat, group = group),
               color = "grey", fill = "white") +
  geom_text(data = NM_geo, 
            mapping = aes(x = center_long, y = center_lat, label = county)) +
  ggtitle("Counties of New Mexico")

## ----load_count_data-----------------------------------------------------
data(NM_popcas)
head(NM_popcas)

## ----get_counts----------------------------------------------------------
library(dplyr)
counts <- NM_popcas %>% 
  filter(year >= 1986 & year < 1990) %>%
  df_to_matrix(time_col = "year", location_col = "county", value_col = "count")

## ----get_zones, eval=TRUE------------------------------------------------
library(sp)
library(magrittr)

# Remove Cibola since cases have been counted towards Valencia. Ideally, this
# should be accounted for when creating the zones.
zones <- NM_geo %>%
  filter(county != "cibola") %>%
  select(seat_long, seat_lat) %>%
  as.matrix %>%
  spDists(x = ., y = ., longlat = TRUE) %>%
  dist_to_knn(k = 15) %>%
  knn_zones

## ----fit_baselines, eval=TRUE--------------------------------------------
mod <- glm(count ~ offset(log(population)) + 1 + I(year - 1985),
           family = poisson(link = "log"),
           data = NM_popcas %>% filter(year < 1986))

ebp_baselines <- NM_popcas %>% 
  filter(year >= 1986 & year < 1990) %>%
  mutate(mu = predict(mod, newdata = ., type = "response")) %>%
  df_to_matrix(value_col = "mu")

## ----run_ebp, eval=TRUE--------------------------------------------------
set.seed(1)
poisson_result <- scan_eb_poisson(counts = counts, 
                                  zones = zones, 
                                  baselines = ebp_baselines,
                                  n_mcsim = 999)
print(poisson_result)

## ----show_MLC, eval=TRUE, comment=NA-------------------------------------
counties <- as.character(NM_geo$county)
counties[c(15, 26)]

## ----county_scores, eval=TRUE--------------------------------------------
# Calculate scores and add column with county names
county_scores <- score_locations(poisson_result, zones)
county_scores %<>% mutate(county = factor(counties[-length(counties)], 
                                          levels = levels(NM_geo$county)))

# Create a table for plotting
score_map_df <- merge(NM_map, county_scores, by = "county", all.x = TRUE) %>%
  arrange(group, order)

# As noted before, Cibola county counts have been attributed to Valencia county
score_map_df[score_map_df$subregion == "cibola", ] %<>%
  mutate(relative_score = score_map_df %>% 
                          filter(subregion == "valencia") %>% 
                          select(relative_score) %>% 
                          .[[1]] %>% .[1])

ggplot() + 
  geom_polygon(data = score_map_df,
               mapping = aes(x = long, y = lat, group = group, 
                             fill = relative_score),
               color = "grey") +
  scale_fill_gradient(low = "#e5f5f9", high = "darkgreen",
                      guide = guide_colorbar(title = "Relative\nScore")) +
  geom_text(data = NM_geo, 
            mapping = aes(x = center_long, y = center_lat, label = county),
            alpha = 0.5) +
  ggtitle("County scores")

## ----top_counties, eval=TRUE---------------------------------------------
top5 <- top_clusters(poisson_result, zones, k = 5, overlapping = FALSE)

# Find the counties corresponding to the spatial zones of the 5 clusters.
top5_counties <- top5$zone %>%
  purrr::map(get_zone, zones = zones) %>%
  purrr::map(function(x) counties[x])

# Add the counties corresponding to the zones as a column
top5 %<>% mutate(counties = top5_counties)

