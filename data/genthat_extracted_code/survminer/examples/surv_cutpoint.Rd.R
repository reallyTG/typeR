library(survminer)


### Name: surv_cutpoint
### Title: Determine the Optimal Cutpoint for Continuous Variables
### Aliases: surv_cutpoint surv_categorize summary.surv_cutpoint
###   print.surv_cutpoint plot.surv_cutpoint print.plot_surv_cutpoint

### ** Examples

# 0. Load some data
data(myeloma)
head(myeloma)

# 1. Determine the optimal cutpoint of variables
res.cut <- surv_cutpoint(myeloma, time = "time", event = "event",
   variables = c("DEPDC1", "WHSC1", "CRIM1"))

summary(res.cut)

# 2. Plot cutpoint for DEPDC1
# palette = "npg" (nature publishing group), see ?ggpubr::ggpar
plot(res.cut, "DEPDC1", palette = "npg")

# 3. Categorize variables
res.cat <- surv_categorize(res.cut)
head(res.cat)

# 4. Fit survival curves and visualize
library("survival")
fit <- survfit(Surv(time, event) ~DEPDC1, data = res.cat)
ggsurvplot(fit, data = res.cat, risk.table = TRUE, conf.int = TRUE)




