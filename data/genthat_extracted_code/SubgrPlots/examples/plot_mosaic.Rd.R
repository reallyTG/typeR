library(SubgrPlots)


### Name: plot_mosaic
### Title: Mosaic plot
### Aliases: plot_mosaic

### ** Examples

library(dplyr)
data(prca)
dat <- prca
dat %>%
  mutate(bm = factor(ifelse(bm == 0 , "No", "Yes")),
         hx = factor(ifelse(hx == 0 , "No", "Yes")),
         Treatment = factor(ifelse(rx == 0 , "Control", "Treatment")),
         Survival = factor(ifelse(survtime > 24 , "Yes", "No"),
         levels = c("Yes", "No")))-> dat
levels(dat$age_group) = c("Young","Middle-aged","Old")
levels(dat$weight_group)  = c("Low","Mid","High")
# Change variable names
dat %>%
  rename(`Bone Metastasis` = bm,
         `Performance rating` = pf,
         `History of cardiovascular events` = hx,
         `2-year survival` = Survival,
         Weight = weight_group,
         Age = age_group) -> dat
## 2.a Mosaic plot with 2 variables -----------------------------------------
plot_mosaic(dat = dat,
            covari.sel = c(14, 15),
            trt.sel = 3,
            resp.sel = c(1, 2),
            outcome.type =  "survival",
            range.v = NULL,
            adj.ann.subgrp = 4,
            range.strip=c(-3, 3),
            n.brk = 31,
            n.brk.axis = 7, sep. = 0.034,
            font.size = c(10, 10, 10, 10, 0.7),
            title = NULL, lab.xy = NULL,
            strip = "Treatment effect size (log-hazard ratio)",
            col.line = "white", lwd. = 2,
            effect = "HR", print.ss = FALSE, palette = "hcl")

## 2.b Mosaic plot with 3 variables -----------------------------------------
plot_mosaic(dat = dat,
            covari.sel = c(15, 7, 4),
            trt.sel = 3,
            resp.sel = c(1, 2),
            outcome.type =  "survival",
            range.v = NULL, adj.ann.subgrp = 4,
            range.strip=c(-3, 3),
            n.brk = 31, n.brk.axis = 7,
            font.size = c(10, 10, 10, 10, 0.7),
            title = NULL, lab.xy = NULL,
            strip = "Treatment effect size (log-hazard ratio)",
            effect = "HR", palette = "hcl")



