library(scrubr)


### Name: coords
### Title: Coordinate based cleaning
### Aliases: coord_impossible coord_incomplete coord_pol_centroids
###   coord_unlikely coord_within coords

### ** Examples

df <- sample_data_1

# Remove impossible coordinates
NROW(df)
df[1, "latitude"] <- 170
df <- dframe(df) %>% coord_impossible()
NROW(df)
attr(df, "coord_impossible")

# Remove incomplete cases
NROW(df)
df_inc <- dframe(df) %>% coord_incomplete()
NROW(df_inc)
attr(df_inc, "coord_incomplete")

# Remove unlikely points
NROW(df)
df_unlikely <- dframe(df) %>% coord_unlikely()
NROW(df_unlikely)
attr(df_unlikely, "coord_unlikely")

# Remove points not within correct political borders
if (requireNamespace("rgbif", quietly = TRUE)) {
   library("rgbif")
   wkt <- 'POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1))'
   res <- rgbif::occ_data(geometry = wkt, limit=100)$data
} else {
   res <- sample_data_4
}

## By specific country name
NROW(res)
df_within <- dframe(res) %>% coord_within(country = "Egypt")
NROW(df_within)
attr(df_within, "coord_within")

## By a field in your data - makes sure your points occur in one of those countries
NROW(res)
df_within <- dframe(res) %>% coord_within(field = "country")
NROW(df_within)
attr(df_within, "coord_within")

# Remove those very near political centroids
## not ready yet
# NROW(df)
# df_polcent <- dframe(df) %>% coord_pol_centroids()
# NROW(df_polcent)
# attr(df_polcent, "coord_polcent")

## lat/long column names can vary
df <- sample_data_1
head(df)
names(df)[2:3] <- c('mylon', 'mylat')
head(df)
df[1, "mylat"] <- 170
dframe(df) %>% coord_impossible(lat = "mylat", lon = "mylon")




