library(popEpi)


### Name: summary.survtab
### Title: Summarize a survtab Object
### Aliases: summary.survtab

### ** Examples


library(Epi)
library(survival)

## NOTE: recommended to use factor status variable
x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)), 
           exit = list(CAL = get.yrs(ex_date)), 
           data = sire[sire$dg_date < sire$ex_date, ],
           exit.status = factor(status, levels = 0:2, 
           labels = c("alive", "canD", "othD")), 
           merge = TRUE)
## pretend some are male
set.seed(1L)
x$sex <- rbinom(nrow(x), 1, 0.5)
## observed survival
st <- survtab(Surv(time = FUT, event = lex.Xst) ~ sex, data = x, 
                  surv.type = "cif.obs",
                  breaks = list(FUT = seq(0, 5, 1/12)))

## estimates at full years of follow-up
summary(st, t = 1:5)

## interval estimate closest to 75th percentile, i.e.
## first interval where surv.obs < 0.75 at end
## (just switch 0.75 to 0.5 for median survival, etc.)
summary(st, q = list(surv.obs = 0.75))
## multiple quantiles
summary(st, q = list(surv.obs = c(0.75, 0.90), CIF_canD = 0.20))

## if you want all estimates in a new data.frame, you can also simply do

x <- as.data.frame(st)




