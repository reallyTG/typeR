library(billboarder)


### Name: bb_barchart
### Title: Helper for creating a bar chart
### Aliases: bb_barchart

### ** Examples


stars <- data.frame(
  package = c("billboarder", "ggiraph", "officer",
              "shinyWidgets", "visNetwork", "rAmCharts", 
              "D3partitionR"),
  stars = c(67, 252, 160, 144, 224, 32, 25)
)

# By default, first column is mapped on the x-axis
# second one on the y axis
billboarder() %>%
  bb_barchart(data = stars)


# Specify explicitly the columns to use
billboarder() %>%
  bb_barchart(data = stars, mapping = bbaes(package, stars), rotated = TRUE)


# Add some options
billboarder() %>%
  bb_barchart(data = stars[order(stars$stars), ], x = "package", y = "stars", rotated = TRUE) %>% 
  bb_data(names = list(stars = "Number of stars")) %>% 
  bb_y_grid(show = TRUE)



# Hack stacked barcharts (to color bar)
stars_wide <- data.frame(
  author = c("dreamRs", "davidgohel", "davidgohel", "dreamRs",
             "datastorm-open", "datastorm-open", "AntoineGuillot2"),
  package = c("billboarder", "ggiraph", "officer",
              "shinyWidgets", "visNetwork", "rAmCharts", 
              "D3partitionR"),
  stars = c(67, 252, 160, 144, 224, 32, 25)
)

billboarder() %>%
  bb_barchart(data = stars_wide, 
              mapping = bbaes(package, stars, group = author),
              stacked = TRUE)

billboarder() %>%
  bb_barchart(data = stars_wide,
              mapping = bbaes(author, stars, group = package),
              stacked = TRUE)



# Grouping variable
tab <- table(sample(letters[1:5], 100, TRUE), sample(LETTERS[1:5], 100, TRUE))
dat <- as.data.frame(tab)

billboarder() %>%
  bb_barchart(data = dat, bbaes(x = Var1, y = Freq, group = Var2), rotated = TRUE)


# You can also pass data in a 'wide' format
dat2 <- data.frame(
  x = letters[1:5],
  A = sample.int(n = 100, size = 5),
  B = sample.int(n = 100, size = 5),
  C = sample.int(n = 100, size = 5),
  D = sample.int(n = 100, size = 5),
  E = sample.int(n = 100, size = 5)
)

# But cannot use mapping
billboarder() %>%
  bb_barchart(data = dat2, stacked = TRUE) %>% 
  bb_data(order = NULL, labels = TRUE)



