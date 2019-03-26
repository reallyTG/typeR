library(servosphereR)


### Name: summaryTortuosity
### Title: Calculate tortuosity
### Aliases: summaryTortuosity

### ** Examples

# Calculate tortuosity as the ratio of net displacement to total distance

summary_df <- data.frame(id = c(1, 2),
                         treatment = c("a", "b"),
                         date = c("2032018", "2042018"),
                         stimulus = c(0, 0),
                         total_distance = runif(2, 11, 20),
                         net_displacement = runif(2, 5, 10))

summary_df <- summaryTortuosity(summary.df = summary_df,
  total.distance = total_distance,
  net.displacement = net_displacement)

# Calculate tortuosity as the ratio of total distance to net displacement
# (the opposite of the previous example)

summary_df <- summaryTortuosity(summary.df = summary_df,
  total.distance = total_distance,
  net.displacement = net_displacement,
  inverse = TRUE)



