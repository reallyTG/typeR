library(SubgrPlots)


### Name: plot_forest
### Title: Forest plot for subgroup effect size
### Aliases: plot_forest

### ** Examples

# Load the data to be used
library(dplyr)
data(prca)
dat <- prca
dat %>%
  mutate(bm = factor(ifelse(bm == 0 , "No", "Yes")),
         hx = factor(ifelse(hx == 0 , "No", "Yes"))) -> dat

## 5. Forest Plot -----------------------------------------------------------
main.title = list("", "Forest plot of subgroups",
                  "Kaplan-Meier curves\n by treatment group")
label.x = list("", "Log hazard ratio",
               "Time (days)")

plot_forest(dat,
            covari.sel = c(4,5,6,7),#vars
            trt.sel = 3,
            resp.sel = c(1, 2),
            outcome.type = "survival",
            size.shape = c(0.3, 6.5/4),
            font.size = c(0.6, 0.5, 0.4, 0.6),
            title = main.title,
            lab.x = label.x, time = 50, KM = TRUE,
            show.km.axis = 2, n.brk = 12, max.time = 77,
            widths = c(1,1,0.6))




