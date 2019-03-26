library(model4you)


### Name: node_pmterminal
### Title: Panel-Generator for Visualization of pmtrees
### Aliases: node_pmterminal

### ** Examples

if(require("survival")) {
## compute survreg model
mod_surv <- survreg(Surv(futime, fustat) ~ factor(rx), ovarian, dist='weibull')
survreg_plot(mod_surv)

## partition model and plot
tr_surv <- pmtree(mod_surv)
plot(tr_surv, terminal_panel = node_pmterminal(tr_surv, plotfun = survreg_plot,
                                               confint = TRUE))
}




