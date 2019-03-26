
library("tram")
library("survival")
library("trtf")

### Windows diffs...
options(digits = 3)

data("GBSG2", package = "TH.data")

cmod <- coxph(Surv(time, cens) ~ progrec + pnodes + strata(horTh, tgrade),
               data = GBSG2)
Cmod <- Coxph(Surv(time, cens) | 0 + horTh:tgrade ~ progrec + pnodes, 
              data = GBSG2)

round(max(abs(coef(cmod) - coef(Cmod))), 4)
round(max(abs(diag(vcov(cmod)) - diag(vcov(Cmod)))), 4)

Cmod_lf <- Coxph(Surv(time, cens) | 0 + horTh:tgrade ~ progrec + pnodes, 
                data = GBSG2, log_first = TRUE)

round(max(abs(coef(cmod) - coef(Cmod_lf))), 4)
round(max(abs(diag(vcov(cmod)) - diag(vcov(Cmod_lf)))), 4)


cmod_2 <- coxph(Surv(time, cens) ~ ., data = GBSG2)
Cmod_2 <- Coxph(Surv(time, cens) ~ ., data = GBSG2)

round(max(abs(coef(cmod_2) - coef(Cmod_2))), 4)
round(max(abs(diag(vcov(cmod_2)) - diag(vcov(Cmod_2)))), 4)

cmod <- Coxph(Surv(time, cens) ~ horTh, data = GBSG2)
(tmod <- trafotree(cmod, formula = Surv(time, cens) ~ horTh | ., data = GBSG2))
logLik(tmod)
