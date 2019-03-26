library(SubgrPlots)


### Name: plot_level
### Title: Level plot for subgroup effect size
### Aliases: plot_level

### ** Examples

# Load the data to be used
data(prca)
dat  <- prca
levels(dat$age_group)    <- c("Young", "Middle-aged", "Old")
levels(dat$weight_group) <- c("Low", "Mid", "High")
names(dat)[c(14,15)]     <- c("age", "weight")

## 1.a Level plot -----------------------------------------------------------
plot_level(dat,
           covari.sel = c(14,15),
           trt.sel = 3,
           resp.sel = c(1, 2),
           outcome.type = "survival",
           ss.rect = FALSE,
           range.strip=c(-3, 3),
           n.brk = 31,
           n.brk.axis =  7,
           font.size = c(14, 12, .8, 14, 0.7),
           title = "Total sample size = 475",
           strip = "Treatment effect size (log hazard ratio)",
           effect = "HR",
           show.overall = TRUE, palette = "hcl")

## 1.b Modified Level plot --------------------------------------------------
plot_level(dat,
           covari.sel = c(14,15),
           trt.sel = 3,
           resp.sel = c(1, 2),
           outcome.type = "survival",
           ss.rect = TRUE,
           range.strip=c(-3, 3),
           n.brk = 31,
           n.brk.axis =  7,
           font.size = c(14, 12, .8, 14, 0.7),
           title = paste0("Total sample size = ", nrow(dat)),
           strip = "Treatment effect size (log hazard ratio)",
           show.overall = TRUE, palette = "hcl")



