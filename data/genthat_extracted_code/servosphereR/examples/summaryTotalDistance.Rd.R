library(servosphereR)


### Name: summaryTotalDistance
### Title: Calculate total path distance
### Aliases: summaryTotalDistance

### ** Examples

# If a summary data frame has not been started

 servosphere <- list(data.frame(id = rep(1, 200),
                                stimulus = rep(c(0, 1), each = 100),
                                dT = sample(8:12, 200, replace = TRUE),
                                dx = runif(200, 0, 5),
                                dy = runif(200, 0, 5),
                                treatment = rep("a", 200),
                                date = rep("2032018", 200)),
                     data.frame(id = rep(2, 200),
                                stimulus = rep(c(0, 1), each = 100),
                                dT = sample(8:12, 200, replace = TRUE),
                                dx = runif(200, 0, 5),
                                dy = runif(200, 0, 5),
                                treatment = rep("b", 200),
                                date = rep("2032018", 200)))

servosphere <- calcDistance(servosphere)

summary_df <- summaryTotalDistance(servosphere, summary.df = NA)

# If a summary data frame has been started

summary_df <- data.frame(id = c(1, 2),
                         treatment = c("a", "b"),
                         date = c("2032018", "2042018"),
                         stimulus = c(0, 0))

summary_df <- summaryTotalDistance(servosphere, summary.df = summary_df)




