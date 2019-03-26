library(SubgrPlots)


### Name: plot_venn
### Title: Venn diagram for subgroup effect size
### Aliases: plot_venn

### ** Examples

library(dplyr)
# Load the data to be used
data(prca)

## 3.a Venn Diagram -----------------------------------------------------------
dat <- prca
dat %>%
  rename(Performance = pf,
         `Bone\nmetastasis` = bm,
         `History of\ncardiovascular\nevents` = hx) -> dat
plot_venn(dat,
          covari.sel = c(5, 7, 4),
          cat.sel = c(2,2,2),
          trt.sel = 3,
          resp.sel = c(1,2),
          outcome.type = "survival",
          fill = FALSE,
          cat.dist = c(0.04,0.04,0.07),
          font.size = c(0.5, 0.5, 0.7, 0.5, 0.6, 0.6))

## 3.b Filled Venn Diagram -----------------------------------------------------------
dat <- prca
dat$age1 = factor(dat$age1)
dat %>%
  rename(Stage = stage,
         Performance = pf,
         `Bone\nmetastasis` = bm,
         `History of\ncardiovascular\nevents` = hx) -> dat
plot_venn(dat,
          covari.sel = c(4,6,7,5),#vars,
          cat.sel = c(2,2,2,2),
          trt.sel = 3,
          resp.sel = c(1,2),
          outcome.type = "survival",
          fill = TRUE,
          range.strip = c(-3, 3),
          n.brk = 31, n.brk.axis = 7,
          font.size = c(0.5, 0.5, 0.7, 0.5, 0.6, 0.6),
          strip = paste("Treatment effect size (log hazard ratio)"),
          palette = "hcl")

## No test: 
## 3.c Area-proportional Venn Diagram -------------------------------------------------------------
dat <- prca
plot_venn(dat,
          covari.sel = c(5,7,4),
          cat.sel = c(2,2,2),
          trt.sel = 3,
          resp.sel = c(1,2),
          outcome.type = "survival",
          fill = TRUE,
          range.strip = c(-3, 3),
          n.brk = 31, n.brk.axis = 7,
          font.size = c(0.5, 0.5, 0.7, 0.5, 0.6, 0.6),
          strip = paste("Treatment effect size (log hazard ratio)"),
          palette = "hcl", prop_area = TRUE)
## End(No test)






