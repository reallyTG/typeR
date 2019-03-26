library(ggformula)


### Name: gf_step
### Title: Formula interface to geom_step()
### Aliases: gf_step

### ** Examples

if (require(mosaicData)) {
  gf_step( births ~ date, data = Births78, color = ~ wday)
}

# Roll your own Kaplan-Meier plot

if (require(survival) && require(broom)) {
  # fit a survival model
  surv_fit <- survfit(coxph(Surv(time, status) ~ age + sex, lung))
  surv_fit
  # use broom::tidy() to create a tidy data frame for plotting
  surv_df <- tidy(surv_fit)
  head(surv_df)
  # now create a plot
  surv_df %>%
    gf_step(estimate ~ time) %>%
    gf_ribbon(conf.low + conf.high ~ time, alpha = 0.2)
}



