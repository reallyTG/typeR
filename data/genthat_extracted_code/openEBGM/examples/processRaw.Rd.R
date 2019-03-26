library(openEBGM)


### Name: processRaw
### Title: Process raw data
### Aliases: processRaw
### Keywords: openEBGM

### ** Examples

dat <- data.frame(
  var1 = c("product_A", rep("product_B", 3), "product_C",
           rep("product_A", 2), rep("product_B", 2), "product_C"),
  var2 = c("event_1", rep("event_2", 2), rep("event_3", 2),
           "event_2", rep("event_3", 3), "event_1"),
  strat1 = c(rep("Male", 5), rep("Female", 3), rep("Male", 2)),
  strat2 = c(rep("age_cat1", 5), rep("age_cat1", 3), rep("age_cat2", 2))
)
dat$id <- 1:nrow(dat)
processRaw(dat)
suppressWarnings(
  processRaw(dat, stratify = TRUE)
)
processRaw(dat, zeroes = TRUE)
suppressWarnings(
  processRaw(dat, stratify = TRUE, zeroes = TRUE)
)




