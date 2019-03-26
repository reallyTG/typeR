library(algstat)


### Name: hierarchical
### Title: Fitting Hierarchical Log-linear Models with Algebraic Methods
### Aliases: hierarchical

### ** Examples

## Not run: 
##D 
##D 
##D ## handedness introductory example
##D ############################################################
##D 
##D data(handy)
##D 
##D (out <- hierarchical(~ Gender + Handedness, data = handy))
##D 
##D # hierarchical performs the same tasks as loglin and loglm,
##D # but hierarchical gives the exact test p values and more statistics
##D statsFit <- stats::loglin(handy, list(c(1),c(2)), fit = TRUE, param = TRUE)
##D massFit <- MASS::loglm(~ Gender + Handedness, data = handy)
##D # loglm is just a wrapper of loglin
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D # comparisons between hierarchical and loglin
##D ############################################################
##D 
##D # the expected table given the sufficient statistics can be computed
##D # via two methods, iterative proportional fitting, and the mcmc itself:
##D out$exp # ipf
##D hierarchical(~ Gender + Handedness, data = handy, method = "mcmc")$exp
##D statsFit$fit # the equivalent in loglin; this is used by default in hierarchical
##D 
##D 
##D 
##D 
##D # the parameter values of the loglinear model can be accessed
##D out$param
##D statsFit$param
##D 
##D 
##D 
##D 
##D # the p-value for the overall model is available as well
##D # hierarchical gives the exact conditional p-value
##D # (conditional on the sufficient statistics)
##D # the five numbers correspond the probability of tables that are
##D # "more weird" than the observed table, where "more weird" is determined
##D # by having a larger X2 value (or G2, FT, CR, or NM)
##D out$p.value
##D fisher.test(handy)$p.value # out$p.value["X2"] is accurate to monte carlo error
##D 
##D 
##D # loglin gives the p-values using the unconditional asymptotic distributions
##D c(
##D   "X2" = pchisq(statsFit$pearson, df = statsFit$df, lower.tail = FALSE),
##D   "G2" = pchisq(statsFit$lrt, df = statsFit$df, lower.tail = FALSE)
##D )
##D 
##D out$mid.p.value # the mid (exact conditional) p-value is also available
##D 
##D 
##D 
##D 
##D # the test statistics based on the observed table and the expected
##D # table under the model are available
##D out$statistic
##D c(statsFit$pearson, statsFit$lrt) # loglin only gives X2 and G2
##D 
##D 
##D 
##D 
##D # the markov basis used for the proposal distribution of the metropolis-hastings
##D # algorithm are returned. the proposal distribution is uniform on +/-
##D # the moves added to the current table
##D out$moves
##D # they are easier understood as tables
##D vec2tab(out$moves, dim(handy))
##D # notice that the marginals stay fixed:
##D handy + vec2tab(out$moves, dim(handy))
##D 
##D 
##D 
##D 
##D # these were computed as the markov basis of the integer matrix
##D out$A
##D markov(out$A)
##D out$moves
##D 
##D 
##D 
##D 
##D # the moves are also sometimes written in tableau form (LAS p.13)
##D tableau(out$moves, dim(handy))
##D # that's +1 the the table in elements [1,1] and [2,2]
##D # and -1 in the table in elements [1,2] and [2,1]
##D 
##D 
##D 
##D 
##D # the acceptance probability of the MCMC is retained
##D out$acceptProb
##D 
##D 
##D 
##D 
##D # various model assessment measures are also available
##D out$quality
##D 
##D 
##D 
##D 
##D # the number of independent parameters per term are in df
##D out$df
##D 
##D 
##D 
##D 
##D # as an added help, you may find the visuals in vcd useful:
##D # library(vcd)
##D # mosaic(~ Gender + Handedness, data = handy, shade = TRUE, legend = TRUE)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## politics example - with computing the exact p value by hand
##D ############################################################
##D 
##D data(politics)
##D 
##D (out <- hierarchical(~ Personality + Party, data = politics))
##D statsFit <- stats::loglin(politics, as.list(1:2), fit = TRUE, param = TRUE)
##D 
##D out$p.value
##D # exact without monte-carlo error
##D sum(dhyper(c(0:3,6:9), 10, 10, 9))
##D fisher.test(politics)$p.value
##D round(dhyper(0:9, 10, 10, 9), 4)
##D 
##D 
##D # comparisons :
##D out$exp
##D statsFit$fit
##D 
##D out$param
##D statsFit$param
##D 
##D out$p.value # exact
##D c(
##D   "X2" = pchisq(statsFit$pearson, df = statsFit$df, lower.tail = FALSE),
##D   "G2" = pchisq(statsFit$lrt, df = statsFit$df, lower.tail = FALSE)
##D ) # asymptotic approximation
##D fisher.test(politics)$p.value # accurate to monte carlo error
##D 
##D out$statistic # accurate to monte carlo error
##D c(statsFit$pearson, statsFit$lrt)
##D 
##D # mosaic(~ Personality + Party, data = politics, shade = TRUE, legend = TRUE)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## eyeHairColor from the Diaconis and Sturmfels reference
##D ############################################################
##D 
##D data(HairEyeColor)
##D eyeHairColor <- margin.table(HairEyeColor, 2:1)
##D 
##D outC <- hierarchical(~ Eye + Hair, data = eyeHairColor)
##D outR <- hierarchical(~ Eye + Hair, data = eyeHairColor, engine = "R")
##D 
##D # doesn't work even with workspace = 2E9 (with over 4.5Gb in memory)
##D #fisher.test(eyeHairColor, hybrid = TRUE, workspace = 2E9)
##D 
##D tableau(outC$moves, dim(eyeHairColor))
##D 
##D 
##D # library(microbenchmark)
##D # microbenchmark(
##D #   hierarchical(~ Eye + Hair, data = eyeHairColor),
##D #   hierarchical(~ Eye + Hair, data = eyeHairColor, engine = "R")
##D # )
##D # 5-10 times faster; much faster with increased iter
##D 
##D 
##D # mosaic(~ Eye + Hair, data = HairEyeColor, shade = TRUE, legend = TRUE)
##D 
##D 
##D 
##D 
##D 
##D 
##D ## abortion preference example from the
##D ## Diaconis and Sturmfels reference pp. 379--381
##D ## a no 3-way interaction model
##D ############################################################
##D 
##D data(abortion)
##D 
##D out <- hierarchical(
##D   ~ Education*Abortion + Abortion*Denomination + Education*Denomination,
##D   data = abortion,
##D   iter = 10000, burn = 50000, thin = 50
##D )
##D out$p.value
##D 
##D 
##D vec2tab(rowMeans(out$steps), dim(abortion)) # cf. p. 380
##D loglin(abortion, subsets(1:3, 2), fit = TRUE)$fit
##D 
##D 
##D 
##D out$param
##D loglin(abortion, subsets(1:3, 2), param = TRUE)$param
##D 
##D 
##D 
##D qqplot(rchisq(1055, df = 8), out$sampsStats$X2s)
##D curve(1*x, from = 0, to = 30, add = TRUE, col = "red")
##D 
##D ( nMoves <- 2*ncol(out$moves) ) # DS uses 110
##D # the markov basis is larger than it needs to be
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## loglin no three-way interaction model example
##D ############################################################
##D 
##D # the help for fits the no three-way interaction model on HairEyeColor,
##D # finds a .66196 p-value using the asymptotic distribution, and concludes
##D # a good fit:
##D data(HairEyeColor)
##D 
##D fit <- loglin(HairEyeColor, subsets(1:3, 2), fit = TRUE, param = TRUE)
##D mod <- hierarchical(~ Eye*Hair + Hair*Sex + Eye*Sex, data = HairEyeColor)
##D 
##D 
##D 
##D 
##D # p values
##D pchisq(fit$lrt, fit$df, lower.tail = FALSE) # see ?loglin
##D mod$p.value
##D 
##D # test statistics
##D c(fit$pearson, fit$lrt)
##D mod$statistic
##D 
##D # fits (estimated tables)
##D fit$fit
##D mod$exp
##D mod$obs
##D 
##D 
##D # checking the autocorrelation
##D acf(mod$sampsStats$PRs)
##D mod <- hierarchical(~ Eye*Hair + Hair*Sex + Eye*Sex, data = HairEyeColor, thin = 100)
##D acf(mod$sampsStats$PRs) # got it!
##D 
##D 
##D # the slight differences in fit$fit and mod$exp (both done with ipf from loglin)
##D # are due to differences in variable order:
##D loglin(HairEyeColor, subsets(1:3, 2), fit = TRUE)$fit
##D loglin(HairEyeColor, subsets(1:3, 2)[c(1,3,2)], fit = TRUE)$fit
##D 
##D # a few model moves
##D vec2tab(mod$moves[,1], dim(HairEyeColor))
##D vec2tab(mod$moves[,50], dim(HairEyeColor))
##D -vec2tab(mod$moves[,50], dim(HairEyeColor))
##D 
##D # they contribute 0 to the marginals of the table
##D vec2tab(mod$moves[,50], dim(HairEyeColor))
##D mod$A %*% mod$move[,50]
##D vec2tab(mod$A %*% mod$move[,50], dim(HairEyeColor))
##D 
##D HairEyeColor
##D HairEyeColor + vec2tab(mod$moves[,50], dim(HairEyeColor))
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## a table with positive marginals but no MLE for
##D ## the no-three way interaction model
##D ############################################################
##D 
##D 
##D data(haberman)
##D 
##D mod <- hierarchical(~ X1*X2 + X2*X3 + X1*X3, data = haberman)
##D 
##D statsFit <- loglin(haberman, subsets(1:3, 2), param = TRUE, fit = TRUE)
##D statsFit$fit
##D statsFit$param
##D c(statsFit$pearson, statsFit$lrt)
##D 
##D algstatFit <- hierarchical(~ X1*X2 + X2*X3 + X1*X3, data = haberman, method = "mcmc")
##D algstatFit$exp
##D algstatFit$param
##D algstatFit$statistic
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## an example from agresti, p.322
##D ############################################################
##D 
##D data(drugs)
##D ftable(aperm(drugs, c(3, 1, 2))) # = table 8.3
##D 
##D out <- hierarchical(~Alcohol + Cigarette + Marijuana, data = drugs)
##D matrix(round(aperm(out$exp, c(2,1,3)), 1), byrow = FALSE)
##D 
##D loglin(drugs, as.list(1:3), fit = TRUE)$fit
##D loglin(drugs, as.list(1:3), param = TRUE)$param
##D 
##D # # the saturated model issues a warning from markov, but works :
##D # out <- hierarchical(~Alcohol * Cigarette * Marijuana, data = drugs)
##D # matrix(round(aperm(out$exp, c(2,1,3)), 1), byrow = FALSE)
##D 
##D 
##D ftable(aperm(out$exp, c(3,1,2)))
##D 
##D stats <- loglin(drugs, as.list(1:3), fit = TRUE, param = TRUE)
##D 
##D 
##D # considered via glm
##D 
##D df <- as.data.frame(drugs)
##D mod <- glm(Freq ~ Alcohol + Cigarette + Marijuana, data = df, family = poisson)
##D summary(mod)
##D mod$fitted.values
##D 
##D 
##D # the same can be done with glm :
##D 
##D mod <- glm(
##D   Freq ~ Alcohol + Cigarette + Marijuana,
##D   data = as.data.frame(drugs), family = poisson
##D )
##D summary(mod)
##D matrix(round(mod$fitted.values[c(1,3,2,4,5,7,6,8)],1))
##D 
##D 
##D 
##D mod <- glm(
##D   Freq ~ Alcohol * Cigarette + Marijuana,
##D   data = as.data.frame(drugs), family = poisson
##D )
##D summary(mod)
##D matrix(round(mod$fitted.values[c(1,3,2,4,5,7,6,8)],1))
##D 
##D 
##D mod <- glm(
##D   Freq ~ Alcohol * Cigarette * Marijuana,
##D   data = as.data.frame(drugs), family = poisson
##D )
##D summary(mod)
##D matrix(round(mod$fitted.values[c(1,3,2,4,5,7,6,8)],1))
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)



