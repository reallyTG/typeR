library(model4you)


### Name: survreg_plot
### Title: Survival plot for a given survreg model with one binary
###   covariate.
### Aliases: survreg_plot

### ** Examples

if(require("survival")) {
  survreg_plot(survreg(Surv(futime, fustat) ~ factor(rx), ovarian))
}




