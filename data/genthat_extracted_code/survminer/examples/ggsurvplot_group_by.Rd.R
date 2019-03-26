library(survminer)


### Name: ggsurvplot_group_by
### Title: Survival Curves of Grouped Data sets
### Aliases: ggsurvplot_group_by

### ** Examples

# Fit survival curves
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
library(survival)
fit <- survfit( Surv(time, status) ~ sex, data = colon )

# Visualize: grouped by treatment rx
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ggsurv.list <- ggsurvplot_group_by(fit, colon, group.by = "rx", risk.table = TRUE,
                                 pval = TRUE, conf.int = TRUE, palette = "jco")
names(ggsurv.list)


# Visualize: grouped by treatment rx and adhere
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ggsurv.list <- ggsurvplot_group_by(fit, colon, group.by = c("rx", "adhere"),
                                 risk.table = TRUE,
                                 pval = TRUE, conf.int = TRUE, palette = "jco")

names(ggsurv.list)



