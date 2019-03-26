library(usmap)


### Name: map_with_data
### Title: Join county or state level data to US map data
### Aliases: map_with_data

### ** Examples

state_data <- data.frame(fips = c("01", "02", "04"), values = c(1, 5, 8))
df <- map_with_data(state_data, na = 0)

state_data <- data.frame(state = c("AK", "CA", "Utah"), values = c(6, 9, 3))
df <- map_with_data(state_data, na = 0)




