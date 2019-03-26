library(SubgrPlots)


### Name: plot_tree
### Title: Tree plot for subgroup effect size
### Aliases: plot_tree

### ** Examples

library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
dat %>%
  mutate(bm = factor(ifelse(bm == 0 , "No", "Yes")),
         hx = factor(ifelse(hx == 0 , "No", "Yes"))) -> dat

## Tree plot with fixed y-axis
plot_tree(dat,
          covari.sel = c(4, 5, 7),
          trt.sel = 3,
          resp.sel = c(1, 2),
          outcome.type = "survival",
          add.aux.line = TRUE,
          font.size = c(12, 8, 0.55),
          title = NULL,
          lab.y = "Effect size (log hazard ratio)",
          keep.y.axis = TRUE)

## Tree plot with free y-axes
plot_tree(dat,
          covari.sel = c(4, 5, 7),
          trt.sel = 3,
          resp.sel = c(1, 2),
          outcome.type = "survival",
          add.aux.line = TRUE,
          font.size = c(12, 8, 0.55),
          title = NULL,
          lab.y = "Effect size (log hazard ratio)",
          keep.y.axis = FALSE)




