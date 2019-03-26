library(intubate)


### Name: stats
### Title: Interfaces for stats package for data science pipelines.
### Aliases: ntbt_aggregate ntbt_alias ntbt_ansari.test ntbt_aov
###   ntbt_bartlett.test ntbt_cor.test ntbt_fligner.test ntbt_friedman.test
###   ntbt_ftable ntbt_getInitial ntbt_glm ntbt_kruskal.test ntbt_lm
###   ntbt_loess ntbt_lqs ntbt_model.frame ntbt_model.matrix ntbt_mood.test
###   ntbt_nls ntbt_oneway.test ntbt_ppr ntbt_prcomp ntbt_princomp
###   ntbt_quade.test ntbt_replications ntbt_t.test ntbt_var.test
###   ntbt_wilcox.test ntbt_xtabs
### Keywords: intubate magrittr stats aggregate alias ansari.test aov
###   bartlett.test cor.test fligner.test friedman.test ftable getInitial
###   glm kruskal.test lm loess lqs model.frame model.matrix mood.test nls
###   oneway.test ppr prcomp princomp quade.test replications t.test
###   var.test wilcox.test xtabs

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D 
##D ## aggregate
##D ## Original function to interface
##D ag <- aggregate(len ~ ., data = ToothGrowth, mean)
##D xtabs(len ~ ., data = ag)
##D 
##D ## The interface reverses the order of data and formula
##D ag <- ntbt_aggregate(ToothGrowth, len ~ ., mean)
##D ntbt_xtabs(ag, len ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D ToothGrowth %>%
##D   ntbt_aggregate(len ~ ., mean) %>%
##D   ntbt_xtabs(len ~ .)
##D   
##D esoph %>%
##D   ntbt_aggregate(cbind(ncases, ncontrols) ~ alcgp + tobgp, sum)
##D 
##D ## alias
##D ## Original function to interface
##D alias(yield ~ block + N*P*K, npk)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_alias(npk, yield ~ block + N*P*K)
##D 
##D ## so it can be used easily in a pipeline.
##D npk %>%
##D   ntbt_alias(yield ~ block + N*P*K)
##D 
##D ## ansari.test
##D ## Original function to interface
##D ansari.test(extra ~ group, data = sleep)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_ansari.test(data = sleep, extra ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D library(magrittr)
##D sleep %>%
##D   ntbt_ansari.test(extra ~ group)
##D 
##D ## aov
##D ## Original function to interface
##D aov(yield ~ block + N * P + K, npk)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_aov(npk, yield ~ block + N * P + K)
##D 
##D ## so it can be used easily in a pipeline.
##D npk %>%
##D   ntbt_aov(yield ~ block + N * P + K)
##D 
##D ## bartlett.test
##D ## Original function to interface
##D bartlett.test(count ~ spray, data = InsectSprays)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_bartlett.test(data = InsectSprays, count ~ spray)
##D 
##D ## so it can be used easily in a pipeline.
##D InsectSprays %>%
##D   ntbt_bartlett.test(count ~ spray)
##D 
##D ## cor.test
##D ## Original function to interface
##D cor.test(~ CONT + INTG, data = USJudgeRatings)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_cor.test(data = USJudgeRatings, ~ CONT + INTG)
##D 
##D ## so it can be used easily in a pipeline.
##D USJudgeRatings %>%
##D   ntbt_cor.test(~ CONT + INTG)
##D 
##D ## fligner.test
##D ## Original function to interface
##D fligner.test(count ~ spray, data = InsectSprays)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_fligner.test(data = InsectSprays, count ~ spray)
##D 
##D ## so it can be used easily in a pipeline.
##D InsectSprays %>%
##D   ntbt_fligner.test(count ~ spray)
##D 
##D ## friedman.test
##D wb <- aggregate(warpbreaks$breaks,
##D                 by = list(w = warpbreaks$wool,
##D                           t = warpbreaks$tension),
##D                 FUN = mean)
##D 
##D ## Original function to interface
##D friedman.test(x ~ w | t, data = wb)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_friedman.test(data = wb, x ~ w | t)
##D 
##D ## so it can be used easily in a pipeline.
##D wb %>%
##D   ntbt_friedman.test(x ~ w | t)
##D 
##D ## ftable
##D ## Original function to interface
##D x <- ftable(Survived ~ ., data = Titanic)
##D ftable(Sex ~ Class + Age, data = x)
##D 
##D ## The interface reverses the order of data and formula
##D x <- ntbt_ftable(data = Titanic, Survived ~ .)
##D ftable(data = x, Sex ~ Class + Age)
##D 
##D ## so it can be used easily in a pipeline.
##D Titanic %>%
##D   ntbt_ftable(Survived ~ .)
##D 
##D Titanic %>%
##D   ntbt_ftable(Survived ~ .) %>%
##D   ntbt_ftable(Sex ~ Class + Age)
##D 
##D ## getInitial
##D PurTrt <- Puromycin[ Puromycin$state == "treated", ]
##D 
##D ## Original function to interface
##D getInitial(rate ~ SSmicmen( conc, Vm, K ), PurTrt)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_getInitial(PurTrt, rate ~ SSmicmen( conc, Vm, K ))
##D 
##D ## so it can be used easily in a pipeline.
##D PurTrt %>%
##D   ntbt_getInitial(rate ~ SSmicmen( conc, Vm, K ))
##D 
##D ## glm
##D utils::data(anorexia, package = "MASS")
##D 
##D ## Original function to interface
##D anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
##D                 data = anorexia)
##D summary(anorex.1)
##D 
##D ## The interface reverses the order of data and formula
##D anorex.1 <- ntbt_glm(data = anorexia,
##D                      formula = Postwt ~ Prewt + Treat + offset(Prewt))
##D summary(anorex.1)
##D 
##D ## so it can be used easily in a pipeline.
##D anorexia %>%
##D   ntbt_glm(Postwt ~ Prewt + Treat + offset(Prewt)) %>%
##D   summary()
##D 
##D # A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
##D data.frame(u = c(5,10,15,20,30,40,60,80,100),
##D            lot1 = c(118,58,42,35,27,25,21,19,18)
##D            ) %>%
##D   ntbt_glm(lot1 ~ log(u), family = Gamma) %>%
##D   summary()
##D 
##D ## kruskal.test
##D ## Original function to interface
##D kruskal.test(Ozone ~ Month, airquality)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_kruskal.test(airquality, Ozone ~ Month)
##D 
##D ## so it can be used easily in a pipeline.
##D airquality %>%
##D   ntbt_kruskal.test(Ozone ~ Month)
##D 
##D ## lm
##D ## Original function to interface
##D lm(sr ~ ., LifeCycleSavings)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lm(LifeCycleSavings, sr ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D library(magrittr)
##D LifeCycleSavings %>%
##D   ntbt_lm(sr ~ .)
##D 
##D LifeCycleSavings %>%
##D   ntbt_lm(sr ~ .) %>%
##D   summary()
##D 
##D ## loess
##D ## Original function to interface
##D loess(dist ~ speed, cars)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_loess(cars, dist ~ speed)
##D 
##D ## so it can be used easily in a pipeline.
##D cars %>%
##D   ntbt_loess(dist ~ speed)
##D   
##D cars %>%
##D   ntbt_loess(dist ~ speed,
##D              control = loess.control(surface = "direct"))
##D 
##D ## lqs
##D library(MASS)
##D 
##D ## Original function to interface
##D set.seed(123) # make reproducible
##D lqs(stack.loss ~ ., data = stackloss)
##D 
##D ## The interface reverses the order of data and formula
##D set.seed(123) # make reproducible
##D ntbt_lqs(data = stackloss, stack.loss ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(123) # make reproducible
##D stackloss %>%
##D   ntbt_lqs(stack.loss ~ .)
##D 
##D ## model.frame
##D ## Original function to interface
##D model.frame(dist ~ speed, data = cars)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_model.frame(data = cars, dist ~ speed)
##D 
##D ## so it can be used easily in a pipeline.
##D cars %>%
##D   ntbt_model.frame(dist ~ speed)
##D 
##D ## model.matrix
##D dd <- data.frame(a = gl(3, 4),
##D                  b = gl(4, 1, 12)) # balanced 2-way
##D 
##D ## Original function to interface
##D model.matrix(~ a + b, dd)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_model.matrix(dd, ~ a + b)
##D 
##D ## so it can be used easily in a pipeline.
##D dd %>%
##D   ntbt_model.matrix(~ a + b)
##D 
##D ## mood.test
##D ## Original function to interface
##D mood.test(extra ~ group, data = sleep)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_mood.test(data = sleep, extra ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D sleep %>%
##D   ntbt_mood.test(extra ~ group)
##D 
##D ## nls
##D ## Original function to interface
##D nls(density ~ SSlogis(log(conc), Asym, xmid, scal), DNase)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_nls(data = DNase, density ~ SSlogis(log(conc), Asym, xmid, scal))
##D 
##D ## so it can be used easily in a pipeline.
##D DNase %>%
##D   ntbt_nls(density ~ SSlogis(log(conc), Asym, xmid, scal))
##D 
##D ## oneway.test
##D ## Original function to interface
##D oneway.test(extra ~ group, data = sleep)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_oneway.test(data = sleep, extra ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D sleep %>%
##D   ntbt_oneway.test(extra ~ group)
##D 
##D ## ppr
##D ## Original function to interface
##D ppr(log(perm) ~ area + peri + shape, data = rock,
##D     nterms = 2, max.terms = 5)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_ppr(data = rock, log(perm) ~ area + peri + shape,
##D          nterms = 2, max.terms = 5)
##D 
##D ## so it can be used easily in a pipeline.
##D rock %>%
##D   ntbt_ppr(log(perm) ~ area + peri + shape,
##D            nterms = 2, max.terms = 5)
##D 
##D ## prcomp
##D ## Original function to interface
##D prcomp(~ Murder + Assault + Rape, data = USArrests, scale = TRUE)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_prcomp(data = USArrests, ~ Murder + Assault + Rape, scale = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D USArrests %>%
##D   ntbt_prcomp(~ Murder + Assault + Rape, scale = TRUE)
##D 
##D ## princomp
##D ## Original function to interface
##D princomp(~ ., data = USArrests, cor = TRUE)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_princomp(data = USArrests, ~ ., cor = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D USArrests %>%
##D   ntbt_princomp(~ ., cor = TRUE)
##D 
##D ## quade.test
##D wb <- aggregate(warpbreaks$breaks,
##D                 by = list(w = warpbreaks$wool,
##D                           t = warpbreaks$tension),
##D                 FUN = mean)
##D 
##D ## Original function to interface
##D quade.test(x ~ w | t, data = wb)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_quade.test(data = wb, x ~ w | t)
##D 
##D ## so it can be used easily in a pipeline.
##D wb %>%
##D   ntbt_quade.test(x ~ w | t)
##D 
##D ## replications
##D ## From Venables and Ripley (2002) p.165.
##D N <- c(0,1,0,1,1,1,0,0,0,1,1,0,1,1,0,0,1,0,1,0,1,1,0,0)
##D P <- c(1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,0,0,1,0,1,1,0)
##D K <- c(1,0,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0,0,1,1,1,0,1,0)
##D yield <- c(49.5,62.8,46.8,57.0,59.8,58.5,55.5,56.0,62.8,55.8,69.5,
##D            55.0, 62.0,48.8,45.5,44.2,52.0,51.5,49.8,48.8,57.2,59.0,53.2,56.0)
##D 
##D npk <- data.frame(block = gl(6,4), N = factor(N), P = factor(P),
##D                   K = factor(K), yield = yield)
##D 
##D ## Original function to interface
##D replications(~ . - yield, npk)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_replications(npk, ~ . - yield)
##D 
##D ## so it can be used easily in a pipeline.
##D npk %>%
##D   ntbt_replications(~ . - yield)
##D 
##D ## t.test
##D ## Original function to interface
##D t.test(extra ~ group, data = sleep)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_t.test(data = sleep, extra ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D sleep %>%
##D   ntbt_t.test(extra ~ group)
##D 
##D ## var.test
##D ## Original function to interface
##D var.test(extra ~ group, data = sleep)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_var.test(data = sleep, extra ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D sleep %>%
##D   ntbt_var.test(extra ~ group)
##D 
##D ## wilcox.test
##D ## Original function to interface
##D wilcox.test(extra ~ group, data = sleep)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_wilcox.test(data = sleep, extra ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D sleep %>%
##D   ntbt_wilcox.test(extra ~ group)
##D 
##D ## xtabs
##D ## Original function to interface
##D ag <- aggregate(len ~ ., data = ToothGrowth, mean)
##D xtabs(len ~ ., data = ag)
##D 
##D ## The interface reverses the order of data and formula
##D ag <- ntbt_aggregate(ToothGrowth, len ~ ., mean)
##D ntbt_xtabs(ag, len ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D ToothGrowth %>%
##D   ntbt_aggregate(len ~ ., mean) %>%
##D   ntbt_xtabs(len ~ .)
## End(Not run)



