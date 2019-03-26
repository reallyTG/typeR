library(processanimateR)


### Name: token_scale
### Title: Token scale mapping values to aesthetics
### Aliases: token_scale

### ** Examples

data(example_log)

# (1) Change token color based on a factor attribute
animate_process(example_log,
 legend = "color",
 mapping = token_aes(color = token_scale("res", scale = "ordinal",
  range = RColorBrewer::brewer.pal(8, "Paired"))))

# (2) Change token color based on second data frame
x <- data.frame(case = as.character(rep(c(1,2,3), 2)),
                time = seq(from = as.POSIXct("2018-10-03 03:41:00"),
                           to = as.POSIXct("2018-10-03 06:00:00"),
                           length.out = 6),
                value = rep(c("orange", "green"), 3),
                stringsAsFactors = FALSE)

animate_process(example_log,
                mode = "relative",
                jitter = 10,
                legend = "color",
                mapping = token_aes(color = token_scale(x)))


# (3) Constant token color
animate_process(example_log,
 legend = "color",
 mapping = token_aes(color = token_scale("red")))




