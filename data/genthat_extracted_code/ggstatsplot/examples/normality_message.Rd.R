library(ggstatsplot)


### Name: normality_message
### Title: Display normality test result as a message.
### Aliases: normality_message

### ** Examples


# message
normality_message(
  x = anscombe$x1,
  lab = "x1",
  k = 3
)

# statistical test object
ggstatsplot::normality_message(
  x = anscombe$x2,
  output = "tidy"
)



