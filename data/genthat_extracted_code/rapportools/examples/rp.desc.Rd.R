library(rapportools)


### Name: rp.desc
### Title: Descriptive Statistics
### Aliases: rp.desc

### ** Examples

rp.desc("cyl", "am", c(mean, sd), mtcars, margins = TRUE)
## c
rp.desc("hp", c("am", "gear"), c("Average" = mean, "Deviation" = sd),
    mtcars, remove.duplicate = FALSE)



