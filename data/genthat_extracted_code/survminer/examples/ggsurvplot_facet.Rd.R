library(survminer)


### Name: ggsurvplot_facet
### Title: Facet Survival Curves into Multiple Panels
### Aliases: ggsurvplot_facet

### ** Examples

library(survival)

# Facet by one grouping variables: rx
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit <- survfit( Surv(time, status) ~ sex, data = colon )
ggsurvplot_facet(fit, colon, facet.by = "rx",
                palette = "jco", pval = TRUE)

# Facet by two grouping variables: rx and adhere
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ggsurvplot_facet(fit, colon, facet.by = c("rx", "adhere"),
                palette = "jco", pval = TRUE)


# Another fit
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit2 <- survfit( Surv(time, status) ~ sex + rx, data = colon )
ggsurvplot_facet(fit2, colon, facet.by = "adhere",
                palette = "jco", pval = TRUE)




