## ----include = FALSE-----------------------------------------------------
library('knitr')
knit_theme$set('edit-kwrite')

## ----label = setup, include = FALSE--------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE, message = FALSE, warning = FALSE, widtht = 65,
                      fig.width = 8, fig.height = 6, cache.path = "./cache/mlogit2/")
options(width = 65)

## ----echo = FALSE--------------------------------------------------------
srcpkg <- FALSE

## ----echo = TRUE, eval = ! srcpkg----------------------------------------
library("mlogit")

## ----include = FALSE, eval = srcpkg--------------------------------------
library(Formula);library("tidyverse");library(texreg);library(lmtest); library("statmod");library("MASS")
ra <- lapply(system(command = "ls ~/Dropbox/Forge/mlogit/pkg/R/*R", intern = TRUE), source)

## ----include = FALSE, eval = FALSE---------------------------------------
## load("~/Dropbox/Forge/mlogit/pkg/data/Train.rda")
## levels(Train$choice) <- c("A", "B")
## names(Train)[4:11] <- c("price_A", "time_A", "change_A", "comfort_A",
##                         "price_B", "time_B", "change_B", "comfort_B")
## for (i in 4:11) Train[, i] <- as.numeric(Train[, i])
## 
## save(Train, file = "~/Dropbox/Forge/mlogit/pkg/data/Train.rda")

## ------------------------------------------------------------------------
data("Train", package = "mlogit")
head(Train, 3)

## ------------------------------------------------------------------------
Tr <- mlogit.data(Train, shape = "wide", choice = "choice", 
                  varying = 4:11, sep = "_", 
                  alt.levels = c("A", "B"), id.var = "id", 
                  opposite = c("price", "comfort", "time", "change"))

## ------------------------------------------------------------------------
Tr$price <- Tr$price / 100 * 2.20371
Tr$time <- Tr$time / 60

## ------------------------------------------------------------------------
head(Tr, 3)

## ------------------------------------------------------------------------
head(index(Tr), 3)

## ------------------------------------------------------------------------
data("ModeCanada", package = "mlogit")
head(ModeCanada)

## ------------------------------------------------------------------------
MC <- mlogit.data(ModeCanada, subset = noalt == 4,
                  alt.levels = c("train", "air", "bus", "car"))

## ------------------------------------------------------------------------
MC <- mlogit.data(ModeCanada , subset = noalt == 4,
                  alt.var = "alt")

## ------------------------------------------------------------------------
MC <- mlogit.data(ModeCanada, subset = noalt == 4,
                  chid.var = "case",
                  alt.levels = c("train", "air", "bus", "car"))

## ------------------------------------------------------------------------
MC <- mlogit.data(ModeCanada, subset = noalt == 4,
                 chid.var = "case", alt.var = "alt")

## ------------------------------------------------------------------------
MC <- mlogit.data(ModeCanada, subset = noalt == 4,
                 chid.var = "case", alt.var = "alt", 
                 drop.index = TRUE)
head(MC)

## ------------------------------------------------------------------------
f <- mFormula(choice ~ cost | income + urban | ivt)

## ------------------------------------------------------------------------
f2 <- mFormula(choice ~ cost + ivt | income + urban)
f2 <- mFormula(choice ~ cost + ivt | income + urban | 0)

## ------------------------------------------------------------------------
f3 <- mFormula(choice ~ 0 | income | 0)
f3 <- mFormula(choice ~ 0 | income)

## ------------------------------------------------------------------------
f4 <- mFormula(choice ~ cost + ivt)
f4 <- mFormula(choice ~ cost + ivt | 1)
f4 <- mFormula(choice ~ cost + ivt | 1 | 0)

## ------------------------------------------------------------------------
f5 <- mFormula(choice ~ cost | income + 0 | ivt)
f5 <- mFormula(choice ~ cost | income - 1 | ivt)

## ------------------------------------------------------------------------
f <- mFormula(choice ~ cost | income  | ivt)
head(model.matrix(f, MC), 4)

## ------------------------------------------------------------------------
statpval <- function(x){
    if (inherits(x, "anova")) 
        result <- as.matrix(x)[2, c("Chisq", "Pr(>Chisq)")]
    if (inherits(x, "htest")) result <- c(x$statistic, x$p.value)
    names(result) <- c("stat", "p-value")
    round(result, 3)
}

## ------------------------------------------------------------------------
ml.MC1 <- mlogit(choice ~ cost + freq + ovt | income | ivt, MC)

## ------------------------------------------------------------------------
ml.MC1b <- mlogit(choice ~ cost + freq + ovt | income | ivt, ModeCanada,
                 subset = noalt == 4, alt.var = "alt", chid.var = "case")

## ------------------------------------------------------------------------
MC$time <- with(MC, ivt + ovt)
ml.MC1 <- mlogit(choice ~ cost + freq | income | time, MC, 
                 alt.subset = c("car", "train", "air"),
                 reflevel = "car")

## ------------------------------------------------------------------------
summary(ml.MC1)

## ------------------------------------------------------------------------
head(fitted(ml.MC1, type = "outcome"))
head(fitted(ml.MC1, type = "probabilities"), 4)

## ------------------------------------------------------------------------
sum(log(fitted(ml.MC1, type = "outcome")))
logLik(ml.MC1)
apply(fitted(ml.MC1, type = "probabilities"), 2, mean)

## ------------------------------------------------------------------------
predict(ml.MC1)

## ------------------------------------------------------------------------
NMC <- MC
NMC[index(NMC)$alt == "train", "time"] <- 
    0.8 * NMC[index(NMC)$alt == "train", "time"]
Oprob <- fitted(ml.MC1, type = "probabilities")
Nprob <- predict(ml.MC1, newdata = NMC)
rbind(old = apply(Oprob, 2, mean),
      new = apply(Nprob, 2, mean))

## ------------------------------------------------------------------------
head(Nprob[, "air"] / Nprob[, "car"])
head(Oprob[, "air"] / Oprob[, "car"])

## ------------------------------------------------------------------------
ivbefore <- logsum(ml.MC1)

## ------------------------------------------------------------------------
ivafter <- logsum(ml.MC1, data = NMC)

## ------------------------------------------------------------------------
surplus <- - (ivafter - ivbefore) / coef(ml.MC1)["cost"]
summary(surplus)

## ------------------------------------------------------------------------
effects(ml.MC1, covariate = "income", type = "ar")

## ------------------------------------------------------------------------
effects(ml.MC1, covariate = "cost", type = "rr")

## ------------------------------------------------------------------------
coef(ml.MC1)[grep("time", names(coef(ml.MC1)))] / 
    coef(ml.MC1)["cost"] * 60 

## ------------------------------------------------------------------------
data("NOx", package = "mlogit")
NOx$kdereg <- with(NOx, kcost * (env == "deregulated"))

NOxml <- mlogit.data(NOx, chid.var = "chid", 
                     alt.var = "alt", id.var = "id")
ml.pub <- mlogit(choice ~ post + cm + lnb + vcost + 
                     kcost + kcost:age | - 1, 
                 subset = available & env == "public", data = NOxml)
ml.reg <- update(ml.pub, subset = available & env == "regulated")
ml.dereg <- update(ml.pub, subset = available & env == "deregulated")
ml.pool <- mlogit(choice ~ post + cm + lnb + vcost + kcost + 
                      kcost:age + kdereg | - 1 | 0 | env, 
                  subset = available == 1, data = NOxml, method = "bhhh")
library("texreg")
screenreg(list(Public = ml.pub, Deregulated = ml.dereg, 
               Regulated = ml.reg, pooled = ml.pool))

## ------------------------------------------------------------------------
stat <- 2 * (logLik(ml.dereg) + logLik(ml.reg) + 
             logLik(ml.pub) - logLik(ml.pool))
stat
pchisq(stat, df = 9, lower.tail = FALSE)

## ------------------------------------------------------------------------
ml.MC <- mlogit(choice ~ freq + cost + ivt + ovt | urban + income, MC, 
                reflevel = 'car', alt.subset = c("car", "train", "air"))
hl.MC <- mlogit(choice ~ freq + cost + ivt + ovt | urban + income, MC, 
                reflevel = 'car', alt.subset = c("car", "train", "air"),
                heterosc = TRUE)
coef(summary(hl.MC))[11:12, ]

## ------------------------------------------------------------------------
lr.heter <- lrtest(hl.MC, ml.MC)
wd.heter <- waldtest(hl.MC, heterosc = FALSE)

## ----results = 'hide'----------------------------------------------------
lrtest(hl.MC)
waldtest(hl.MC)

## ------------------------------------------------------------------------
library("car")
lh.heter <- linearHypothesis(hl.MC, c('sp.air = 1', 'sp.train = 1'))

## ------------------------------------------------------------------------
sc.heter <- scoretest(ml.MC, heterosc = TRUE)

## ------------------------------------------------------------------------
sapply(list(wald = wd.heter, lh = lh.heter, 
            score = sc.heter, lr = lr.heter), statpval)

## ------------------------------------------------------------------------
data("JapaneseFDI", package = "mlogit")
jfdi <- mlogit.data(JapaneseFDI, chid.var = "firm", alt.var = "region",
                    group.var = "country")

## ------------------------------------------------------------------------
ml.fdi <- mlogit(choice ~ log(wage) + unemp + elig + log(area) + 
                     scrate + ctaxrate | 0, data = jfdi)

## ------------------------------------------------------------------------
lm.fdi <- mlogit(choice ~ log(wage) + unemp + elig + log(area) | 0, 
                 data = jfdi, subset = country == choice.c & 
                                  ! country %in% c("PT", "IE"))

## ----eval = FALSE, include = FALSE---------------------------------------
## library("tidyverse")
## iv <- mutate(JapaneseFDI,
##              ebX = exp(as.numeric(
##                  model.matrix(formula(um.fdi), JapaneseFDI) %*%
##                  coef(um.fdi)))) %>%
##     group_by(country, firm) %>% summarise(iv = log(sum(ebX)))
## 
## JapaneseFDI <- left_join(JapaneseFDI, iv)
## JapaneseFDI.c <- dplyr::select(JapaneseFDI, firm, country,
##                         choice.c, scrate, ctaxrate, iv) %>%
##     unique() %>%
##     mutate(choice.c = choice.c == country)

## ------------------------------------------------------------------------
lmformula <- formula(lm.fdi)
head(logsum(ml.fdi, data = jfdi, formula = lmformula, type = "group"), 2)
head(logsum(ml.fdi, data = jfdi, formula = lmformula, type = "global"))
head(logsum(ml.fdi, data = jfdi, formula = lmformula, output = "obs"))
head(logsum(ml.fdi, data = jfdi, formula = lmformula, 
        type = "global", output = "obs"))

## ------------------------------------------------------------------------
JapaneseFDI$iv <- logsum(lm.fdi, data = jfdi, formula = lmformula, 
                         output = "obs")

## ------------------------------------------------------------------------
JapaneseFDI.c <- subset(JapaneseFDI, 
                        select = c("firm", "country", "choice.c", 
                                   "scrate", "ctaxrate", "iv"))
JapaneseFDI.c <- unique(JapaneseFDI.c)
JapaneseFDI.c$choice.c <- with(JapaneseFDI.c, choice.c == country)

## ------------------------------------------------------------------------
jfdi.c <- mlogit.data(JapaneseFDI.c, choice = "choice.c", 
                      alt.var = "country", chid.var = "firm", 
                      shape = "long")
um.fdi <- mlogit(choice.c ~ scrate + ctaxrate + iv | 0, data = jfdi.c)

## ------------------------------------------------------------------------
um2.fdi <- mlogit(choice.c ~ scrate + ctaxrate | 0 | iv, data = jfdi.c, 
                 constPar = c("iv:PT" = 1, "iv:IE" = 1))

## ------------------------------------------------------------------------
nl.fdi <- mlogit(choice ~ log(wage) + unemp + elig + log(area) +
                     scrate + ctaxrate | 0, data = jfdi,
                 nests = TRUE, un.nest.el = TRUE)
nl2.fdi <- update(nl.fdi, un.nest.el = FALSE, 
                  constPar = c('iv:PT' = 1, 'iv:IE' = 1))

## ----echo = FALSE, results = 'asis'--------------------------------------
library("texreg")
texreg(list('mult. logit' = ml.fdi, 'lower model' = lm.fdi, 
            'upper model' = um.fdi, 'upper model' = um2.fdi, 
            'nested logit' = nl.fdi, 'nested logit' = nl2.fdi),
       fontsize = "footnotesize",
       caption = "Nested logit models for the choice by Japanese firms of a european region",
       label = "tab:nlogit")

## ------------------------------------------------------------------------
lr.nest <- lrtest(nl2.fdi)
wd.nest <- waldtest(nl2.fdi)
sc.nest <- scoretest(ml.fdi, nests = TRUE, 
                     constPar = c('iv:PT' = 1, 'iv:IE' = 1))

## ------------------------------------------------------------------------
lh.nest <- linearHypothesis(nl2.fdi, 
                            c("iv:BE = 1", "iv:DE = 1", "iv:ES = 1", 
                              "iv:FR = 1", "iv:IT = 1", "iv:NL = 1", 
                              "iv:UK = 1"))

## ------------------------------------------------------------------------
sapply(list(wald = wd.nest, lh = lh.nest, 
            score = sc.nest, lr = lr.nest), statpval)

## ------------------------------------------------------------------------
lr.unest <- lrtest(nl2.fdi, nl.fdi)
wd.unest <- waldtest(nl2.fdi, un.nest.el = TRUE)
sc.unest <- scoretest(ml.fdi, nests = TRUE, un.nest.el = FALSE, 
                      constPar = c('iv:IE' = 1, 'iv:PT' = 1))
lh.unest <- linearHypothesis(nl2.fdi, 
                             c("iv:BE = iv:DE", "iv:BE = iv:ES", 
                               "iv:BE = iv:FR", "iv:BE = iv:IT", 
                               "iv:BE = iv:NL", "iv:BE = iv:UK"))

## ------------------------------------------------------------------------
sapply(list(wald = wd.unest, lh = lh.unest, 
            score = sc.unest, lr = lr.unest), statpval)

## ----eval = FALSE, include = FALSE---------------------------------------
##  rm(list = ls()) ; mlvers <- "0.1-8" ; ra <- lapply(system(command = paste("ls ~/Bureau/mlogit_", mlvers, "/R/*R", sep = ""), intern = TRUE), source) ; load(paste("~/Bureau/mlogit_", mlvers, "/data/Train.rda", sep = ""));Tr <- mlogit.data(Train, shape = "wide", varying = 4:11, choice = "choice", sep = "", opposite = c("price", "time", "change", "comfort"), alt.levels=c("choice1", "choice2"), id="id") ; "Tr$price <- Tr$price / 100 * 2.20371 ; Tr$time <- Tr$time / 60" ; Train.mxlc <- mlogit(choice ~ price + time + change + comfort, Tr, panel = TRUE, rpar = c(time = "cn", change = "n", comfort = "ln"), correlation = TRUE, R = 100, halton = NA, print.level = 3)

## ------------------------------------------------------------------------
Train.ml <- mlogit(choice ~ price + time + change + comfort | - 1, Tr)
coef(summary(Train.ml))

## ------------------------------------------------------------------------
coef(Train.ml)[- 1] / coef(Train.ml)[1]

## ----include = FALSE, eval = FALSE---------------------------------------
## # Celui la fonctionne, mais pb quand on limite la correlation a deux effets
## Train.mxlc <- mlogit(choice ~ price + time + change + comfort | - 1, Tr,
##                      panel = TRUE, rpar = c(time = "ln", change = "cn",
##                                             comfort = "n"), R = 100,
##                      correlation = TRUE, halton = NA, method = "bhhh", print.level = 3)
## 
## Train.mxlu <- update(Train.mxlc, correlation = FALSE)

## ------------------------------------------------------------------------
Train.mxlu <- mlogit(choice ~ price + time + change + comfort | - 1, Tr,
                     panel = TRUE, rpar = c(time = "n", change = "n", 
                                            comfort = "n"), R = 100,
                     correlation = FALSE, halton = NA, method = "bhhh")
names(coef(Train.mxlu))

## ------------------------------------------------------------------------
Train.mxlc <- update(Train.mxlu, correlation = TRUE)
names(coef(Train.mxlc))

## ------------------------------------------------------------------------
time.value <- rpar(Train.mxlc, "time", norm = "price")
summary(time.value)

## ------------------------------------------------------------------------
cor.mlogit(Train.mxlc)
cov.mlogit(Train.mxlc)
stdev(Train.mxlc)

## ------------------------------------------------------------------------
Train.mxlc2 <- update(Train.mxlc, correlation = c("time", "comfort"))
cor.mlogit(Train.mxlc2)

## ------------------------------------------------------------------------
lr.mxc <- lrtest(Train.mxlc, Train.ml)
wd.mxc <- waldtest(Train.mxlc)
lh.mxc <- linearHypothesis(Train.mxlc, 
                           c("time.time = 0", "time.change =  0",
                             "time.comfort = 0", "change.change = 0",
                             "change.comfort = 0", "comfort.comfort = 0"))
sc.mxc <- scoretest(Train.ml, 
                    rpar = c(time = "n", change = "n", comfort = "n"), 
                    R = 100, correlation = TRUE, halton = NA, 
                    panel = TRUE)
sapply(list(wald = wd.mxc, lh = lh.mxc,
            score = sc.mxc, lr = lr.mxc), statpval)

## ----eval = FALSE, include = FALSE---------------------------------------
## lr.mxu <- lrtest(Train.mxlu, Train.ml)
## wd.mxu <- waldtest(Train.mxlu)
## lh.mxu <- linearHypothesis(Train.mxlu, c("sd.time = 0", "sd.change = 0",
##                                          "sd.comfort = 0"))
## sc.mxu <- scoretest(Train.ml,
##                     rpar = c(time = "n", change = "n", comfort = "n"),
##                     R = 100, correlation = FALSE, halton = NA,
##                     panel = TRUE)
## sapply(list(wald = wd.mxu, lh = lh.mxu,
##             score = sc.mxu, lr = lr.mxu), statpval)

## ------------------------------------------------------------------------
lr.corr <- lrtest(Train.mxlc, Train.mxlu)
lh.corr <- linearHypothesis(Train.mxlc, c("time.change = 0", 
                                          "time.comfort = 0",
                                          "change.comfort = 0"))
wd.corr <- waldtest(Train.mxlc, correlation = FALSE)
sc.corr <- scoretest(Train.mxlu, correlation = TRUE)
sapply(list(wald = wd.corr, lh = lh.corr, 
            score = sc.corr, lr = lr.corr),  statpval)

## ------------------------------------------------------------------------
data("RiskyTransport", package = "mlogit")
RT <- mlogit.data(RiskyTransport, shape = "long", choice = "choice", 
                  chid.var = "chid", alt.var = "mode", id.var = "id")
ml.rt <- mlogit(choice ~ cost + risk  + seats + noise + crowdness + 
                    convloc + clientele | 0, data = RT, weights = weight)

## ------------------------------------------------------------------------
mx.rt <- mlogit(choice ~ cost + risk  + seats + noise + crowdness + 
                    convloc + clientele | 0, data = RT, weights = weight,
                rpar = c(cost = 'zbt', risk = 'zbt'),
                R = 100, halton = NA, panel = TRUE)

## ------------------------------------------------------------------------
screenreg(list('mult.logit' = ml.rt, 'mixed logit' = mx.rt), digits = 4)

## ------------------------------------------------------------------------
indpar <- fitted(mx.rt, type = "parameters")

## ----eval = FALSE, include = FALSE---------------------------------------
## indpar <-  mutate(indpar, VSL = risk / cost * 100)
## quantile(indpar$VSL, c(0.025, 0.975))
## mean(indpar$VSL)
## library("ggplot2")
## indpar <- mutate(indpar, id = as.integer(as.character(id)))
## select(RT, id, african) %>% unique %>% right_join(indpar) %>%
##     ggplot() + geom_density(aes(x = VSL, linetype = african)) +
##     scale_x_continuous(limits = c(200, 1200))

## ----indpar--------------------------------------------------------------
indpar$VSL <- with(indpar, risk / cost * 100)
quantile(indpar$VSL, c(0.025, 0.975))
mean(indpar$VSL)
library("ggplot2")
indpar <- merge(unique(subset(RT, select = c("id", "african"))), indpar)
ggplot(indpar) + geom_density(aes(x = VSL, linetype = african)) + 
    scale_x_continuous(limits = c(200, 1200))

## ----eval = FALSE, include = FALSE---------------------------------------
## data("CapitalCost", package = "mlogit")
## CapitalCost$kdereg <- with(CapitalCost, kcost * (env == "deregulated"))
## capcost <- mlogit.data(CapitalCost, shape = "long", alt.var = "alt",
##                        chid.var = "chid", choice = "choice", id.var = "id")
## ml.cc <- mlogit(choice ~ post + cm + lnb + vcost + kcost +
##                     kage + kdereg | 0 | 0 | env,
##                 data = capcost, subset = available == 1)
## xlu.cc <- update(ml.cc, rpar = c(vcost = "n", kcost = "n"),
##                  R = 100, halton = NA)
## xlu.ccp <- update(xlu.cc, panel = TRUE, print.level = 3)
## xlc.cc <- update(xlu.cc, correlation = TRUE)

## ----include = FALSE, eval = FALSE---------------------------------------
## screenreg(list('mult. logit' = ml.cc, 'mixed logit' = xlu.cc,
##                'corr. mixed logit' = xlc.cc))

