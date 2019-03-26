library(model4you)


### Name: coxph_plot
### Title: Survival plot for a given coxph model with one binary covariate.
### Aliases: coxph_plot

### ** Examples

if(require("survival")) {
  coxph_plot(coxph(Surv(futime, fustat) ~ factor(rx), ovarian))
}




