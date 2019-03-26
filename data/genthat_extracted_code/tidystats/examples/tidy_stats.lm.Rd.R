library(tidystats)


### Name: tidy_stats.lm
### Title: Create a tidy stats data frame from an lm object
### Aliases: tidy_stats.lm

### ** Examples

# Conduct a regression
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)

model_lm <- lm(weight ~ group)
tidy_stats(model_lm)




