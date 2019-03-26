library(billboarder)


### Name: bb_histogram
### Title: Helper for creating an histogram
### Aliases: bb_histogram

### ** Examples


data("diamonds", package = "ggplot2")

# one variable
billboarder() %>% 
  bb_histogram(data = diamonds, x = "price")

# with mapping
billboarder() %>% 
  bb_histogram(diamonds, bbaes(price))

# equivalent to
billboarder() %>% 
  bb_histogram(data = diamonds$price)

# prettier with 'binwidth'
# (but you need to know your data)
billboarder() %>% 
  bb_histogram(data = diamonds, x = "price", binwidth = 500) %>% 
  bb_colors_manual()

# with a grouping variable
billboarder() %>%
  bb_histogram(data = diamonds, x = "price",
               group = "cut", binwidth = 500)

# and with mapping
billboarder() %>%
  bb_histogram(diamonds, bbaes(price, group = cut),
               binwidth = 500)

# stacked histogram
billboarder() %>%
  bb_histogram(diamonds, bbaes(price, group = cut),
               stacked = TRUE, binwidth = 500)


# another example
dat <- data.frame(
  sample = c(rnorm(n = 500, mean = 1), rnorm(n = 500, mean = 2)),
  group = rep(c("A", "B"), each = 500)
)

billboarder() %>% 
  bb_histogram(data = dat, x = "sample", binwidth = 0.25)

samples_mean <- tapply(dat$sample, dat$group, mean)
billboarder() %>% 
  bb_histogram(data = dat, x = "sample", group = "group",
               binwidth = 0.25) %>% 
  bb_x_grid(
    lines = list(
      list(value = unname(samples_mean['A']),
           text = "mean of sample A"),
      list(value = unname(samples_mean['B']), 
           text = "mean of sample B")
    )
  )




