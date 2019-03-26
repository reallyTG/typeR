## ----selection-----------------------------------------------------------
library(episensr)

stang <- selection(matrix(c(136, 107, 297, 165),
                          dimnames = list(c("UM+", "UM-"), c("Mobile+", "Mobile-")),
                          nrow = 2, byrow = TRUE),
                   bias_parms = c(.94, .85, .64, .25))
stang

## ----confounders---------------------------------------------------------
confounders(matrix(c(105, 85, 527, 93),
                   dimnames = list(c("HIV+", "HIV-"), c("Circ+", "Circ-")),
                   nrow = 2, byrow = TRUE),
            type = "RR",
            bias_parms = c(.63, .8, .05))

## ----e-value-1-----------------------------------------------------------
confounders.evalue(est = 3.9, lower_ci = 1.8, upper_ci = 8.7, type = "RR")

## ----e-value-2-----------------------------------------------------------
confounders.evalue(est = 1.06, lower_ci = 0.93, upper_ci = 1.22,
                   type = "RR", true_est = 1.2)

## ----probsens------------------------------------------------------------
set.seed(123)
smoke.nd <- probsens(matrix(c(215, 1449, 668, 4296),
                            dimnames = list(c("BC+", "BC-"), c("Smoke+", "Smoke-")),
                            nrow = 2, byrow = TRUE),
                     type = "exposure",
                     reps = 50000,
                     seca.parms = list("uniform", c(.7, .95)),
                     spca.parms = list("uniform", c(.9, .99)))
smoke.nd

## ----str-----------------------------------------------------------------
str(smoke.nd)

## ----plot, fig.cap = "Sensibility prior distribution."-------------------
hist(smoke.nd$sim.df[!is.na(smoke.nd$sim.df$corr.RR), ]$seca,
     breaks = seq(0.65, 1, 0.01),
     col = "lightgreen",
     main = NULL,
     xlab = "Sensitivity for Cases")

## ----probsens-conf-------------------------------------------------------
set.seed(123)
probsens.conf(matrix(c(45, 94, 257, 945),
                     dimnames = list(c("Cases+", "Cases-"), c("Res+", "Res-")),
                     nrow = 2, byrow = TRUE),
              reps = 50000,
              prev.exp = list("uniform", c(.4, .7)),
              prev.nexp = list("uniform", c(.4, .7)),
              risk = list("log-normal", c(2.159, .28)))

## ---- boot---------------------------------------------------------------
library(aplore3)  # to get ICU data
data(icu)

## First run the model
misclass_eval <- misclassification(icu$sta, icu$inf,
                                   type = "exposure",
                                   bias_parms = c(.75, .85, .9, .95))
misclass_eval

## Then bootstrap it
set.seed(123)
misclass_boot <- boot.bias(misclass_eval, R = 10000)
misclass_boot

## ---- boot_fig, fig.cap = "Bootstrap replicates and confidence interval.", warning=F----
plot(misclass_boot, "rr")

## ----chien---------------------------------------------------------------
chien <- matrix(c(118, 832, 103, 884),
                dimnames = list(c("BC+", "BC-"), c("AD+", "AD-")),
                nrow = 2, byrow = TRUE)

## ----chien-tab, echo=FALSE-----------------------------------------------
knitr::kable(chien)

## ------------------------------------------------------------------------
chien %>%
    misclassification(., type = "exposure", bias_parms = c(.56, .58, .99, .97))

## ------------------------------------------------------------------------
chien %>% 
    misclassification(., type = "exposure", bias_parms = c(.56, .58, .99, .97)) %>%
    multiple.bias(., bias_function = "selection", bias_parms = c(.73, .61, .82, .76))

## ------------------------------------------------------------------------
chien %>%
    misclassification(., type = "exposure", bias_parms = c(.56, .58, .99, .97)) %>%
    multiple.bias(., bias_function = "selection",
                  bias_parms = c(.73, .61, .82, .76)) %>%
    multiple.bias(., bias_function = "confounders",
                  type = "OR", bias_parms = c(.92, .3, .44))

## ------------------------------------------------------------------------
mod1 <- chien %>%
    probsens(., type = "exposure", reps = 100000,
             seca.parms = list("trapezoidal", c(.45, .5, .6, .65)),
             seexp.parms = list("trapezoidal", c(.4, .48, .58, .63)),
             spca.parms = list("trapezoidal", c(.95, .97, .99, 1)),
             spexp.parms = list("trapezoidal", c(.96, .98, .99, 1)),
             corr.se = .8, corr.sp = .8)
mod1

## ----plot2, message=FALSE------------------------------------------------
library(ggplot2)
ggplot(mod1$sim.df, aes(x = corr.OR)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = "white") +
    geom_density(alpha = .2, fill = "#FF6666") +
    labs(title = "1. Misclassification bias", x = "OR without random error incorporated") +
    coord_cartesian(xlim = c(0, 3))

## ------------------------------------------------------------------------
mod2 <- chien %>%
    probsens.sel(., reps = 100000,
                 case.exp = list("logit-normal", c(-1.1, 0, 0, 1)),
                 case.nexp = list("trapezoidal", c(.75, .85, .95, 1)),
                 ncase.exp = list("logit-normal", c(-1.2, 0, 0, 1)),
                 ncase.nexp = list("trapezoidal", c(0.7, 0.8, 0.9, 1)))
mod2

## ----plot3, message=FALSE------------------------------------------------
ggplot(mod2$sim.df, aes(x = corr.or)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = "white") +
    geom_density(alpha = .2, fill = "#FF6666") +
    labs(title = "2. Selection bias", x = "OR without random error incorporated") +
    coord_cartesian(xlim = c(0, 3))

## ------------------------------------------------------------------------
mod3 <- chien %>%
    probsens.conf(., reps = 100000,
                  prev.exp = list("logit-normal", c(-0.75, 0.8, 0, 1)),
                  prev.nexp = list("logit-normal", c(-0.4, 0.8, 0, 1)),
                  risk = list("trapezoidal", c(.2, .58, 1.01, 1.24)))
mod3

## ----plot4, message=FALSE, warning=FALSE---------------------------------
ggplot(mod3$sim.df, aes(x = OR.SMR.or)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = "white") +
    geom_density(alpha = .2, fill = "#FF6666") +
    labs(title = "3. Confounding bias", x = "OR without random error incorporated") +
    coord_cartesian(xlim = c(0, 3))

## ------------------------------------------------------------------------
chien %>%
    probsens(., type = "exposure", reps = 100000,
             seca.parms = list("trapezoidal", c(.45, .5, .6, .65)),
             seexp.parms = list("trapezoidal", c(.4, .48, .58, .63)),
             spca.parms = list("trapezoidal", c(.95, .97, .99, 1)),
             spexp.parms = list("trapezoidal", c(.96, .98, .99, 1)),
             corr.se = .8, corr.sp = .8) %>%
    multiple.bias(., bias_function = "probsens.sel",
                  case.exp = list("logit-normal", c(-1.1, 0, 0, 1)),
                  case.nexp = list("trapezoidal", c(.75, .85, .95, 1)),
                  ncase.exp = list("logit-normal", c(-1.2, 0, 0, 1)),
                  ncase.nexp = list("trapezoidal", c(0.7, 0.8, 0.9, 1)))

## ------------------------------------------------------------------------
mod6 <- chien %>%
    probsens(., type = "exposure", reps = 100000,
             seca.parms = list("trapezoidal", c(.45, .5, .6, .65)),
             seexp.parms = list("trapezoidal", c(.4, .48, .58, .63)),
             spca.parms = list("trapezoidal", c(.95, .97, .99, 1)),
             spexp.parms = list("trapezoidal", c(.96, .98, .99, 1)),
             corr.se = .8, corr.sp = .8) %>%
    multiple.bias(., bias_function = "probsens.sel",
                  case.exp = list("logit-normal", c(-1.1, 0, 0, 1)),
                  case.nexp = list("trapezoidal", c(.75, .85, .95, 1)),
                  ncase.exp = list("logit-normal", c(-1.2, 0, 0, 1)),
                  ncase.nexp = list("trapezoidal", c(0.7, 0.8, 0.9, 1))) %>% 
    multiple.bias(., bias_function = "probsens.conf",
                  prev.exp = list("logit-normal", c(-0.75, 0.8, 0, 1)),
                  prev.nexp = list("logit-normal", c(-0.4, 0.8, 0, 1)),
                  risk = list("trapezoidal", c(.2, .58, 1.01, 1.24)))
mod6

## ----plot5, message=FALSE, warning=FALSE---------------------------------
ggplot(mod6$sim.df, aes(x = OR.SMR.or)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = "white") +
    geom_density(alpha = .2, fill = "#FF6666") +
    labs(title = "6. Misclassification, then\nselection, then confounding",
         x = "OR without random error incorporated") +
    coord_cartesian(xlim = c(0, 3))
ggplot(mod6$sim.df, aes(x = tot.ORadj.smr)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = "white") +
    geom_density(alpha = .2, fill = "#FF6666") +
    labs(title = "6. Misclassification, then\nselection, then confounding",
         x = "OR with random error incorporated") +
    coord_cartesian(xlim = c(0, 3))

