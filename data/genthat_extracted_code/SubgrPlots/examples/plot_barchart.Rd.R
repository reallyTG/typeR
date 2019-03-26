library(SubgrPlots)


### Name: plot_barchart
### Title: Barchart for subgroup effect size
### Aliases: plot_barchart

### ** Examples

# # Load the data to be used
data(prca)
dat <- prca
levels(dat$age_group) = c("Young","Middle-aged","Old")
levels(dat$weight_group) = c("Low","Mid","High")
names(dat)[c(14,15)] = c("Age", "Weight")

## 4. Bar chart -----------------------------------------------------------
plot_barchart(dat,
              covari.sel = c(14,15),
              trt.sel = 3,
              resp.sel = c(1, 2),
              outcome.type = "survival",
              font.size = c(14, 12, 14, 0.75),
              lab.y = "Treatment effect size (RMST difference)")




