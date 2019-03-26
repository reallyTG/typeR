## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----set-options, echo=FALSE, cache=FALSE--------------------------------
options(width = 75)

## ------------------------------------------------------------------------
library(rpsftm)
head(immdef)

## ------------------------------------------------------------------------
if( requireNamespace("tableone")){
  vars       <- c("def", "imm", "censyrs", "xo", "xoyrs", "prog", "progyrs", "entry")
  factorVars <- c("def", "imm", "xo", "prog") 
  tableone::CreateTableOne(vars=vars, data=immdef, factorVars=factorVars, includeNA=FALSE, test=FALSE)
} else{
  summary(immdef)
}

## ------------------------------------------------------------------------
rx <- with(immdef, 1 - xoyrs/progyrs)

## ------------------------------------------------------------------------
rpsftm_fit_lr <- rpsftm(formula=Surv(progyrs, prog) ~ rand(imm, rx), 
                        data=immdef, 
                        censor_time=censyrs)

## ------------------------------------------------------------------------
library(ggplot2)
plot(rpsftm_fit_lr)

## ------------------------------------------------------------------------
rpsftm_fit_cph <- rpsftm(formula=Surv(progyrs, prog) ~ rand(imm, rx) + entry, 
                         data=immdef, 
                         censor_time=censyrs,
                         test=coxph)
summary(rpsftm_fit_cph)

## ------------------------------------------------------------------------
plot(rpsftm_fit_cph)

## ------------------------------------------------------------------------
rpsftm_fit_wb <- rpsftm(formula=Surv(progyrs, prog) ~ rand(imm, rx) + entry, 
                        data=immdef, 
                        censor_time=censyrs,
                        test=survreg)
summary(rpsftm_fit_wb)

## ------------------------------------------------------------------------
plot(rpsftm_fit_wb)

## ------------------------------------------------------------------------
rpsftm_fit <- rpsftm(formula=Surv(progyrs, prog) ~ rand(imm, rx),
                     data=immdef, 
                     censor_time=censyrs,
                     low_psi=-1, 
                     hi_psi=-0.1)

## ------------------------------------------------------------------------
plot(rpsftm_fit$eval_z, type="s", ylim=c(-2, 6))
abline(h=qnorm(c(0.025, 0.5, 0.975)))
abline(v=rpsftm_fit$psi)
abline(v=rpsftm_fit$CI)

## ----treatmentweight-----------------------------------------------------

weight <- with(immdef, ifelse(imm==1, 1, 0.5))
rpsftm( Surv( progyrs, prog) ~ rand( imm, rx), data = immdef, censor_time = censyrs,
        treat_modifier = weight
        )


