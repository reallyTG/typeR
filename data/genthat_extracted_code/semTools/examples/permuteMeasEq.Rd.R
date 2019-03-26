library(semTools)


### Name: permuteMeasEq
### Title: Permutation Randomization Tests of Measurement Equivalence and
###   Differential Item Functioning (DIF)
### Aliases: permuteMeasEq

### ** Examples


## Not run: 
##D 
##D ########################
##D ## Multiple-Group CFA ##
##D ########################
##D 
##D ## create 3-group data in lavaan example(cfa) data
##D HS <- lavaan::HolzingerSwineford1939
##D HS$ageGroup <- ifelse(HS$ageyr < 13, "preteen",
##D                       ifelse(HS$ageyr > 13, "teen", "thirteen"))
##D 
##D ## specify and fit an appropriate null model for incremental fit indices
##D mod.null <- c(paste0("x", 1:9, " ~ c(T", 1:9, ", T", 1:9, ", T", 1:9, ")*1"),
##D               paste0("x", 1:9, " ~~ c(L", 1:9, ", L", 1:9, ", L", 1:9, ")*x", 1:9))
##D fit.null <- cfa(mod.null, data = HS, group = "ageGroup")
##D 
##D ## fit target model with varying levels of measurement equivalence
##D mod.config <- '
##D visual  =~ x1 + x2 + x3
##D textual =~ x4 + x5 + x6
##D speed   =~ x7 + x8 + x9
##D '
##D miout <- measurementInvariance(mod.config, data = HS, std.lv = TRUE,
##D                                group = "ageGroup")
##D 
##D (fit.config <- miout[["fit.configural"]])
##D (fit.metric <- miout[["fit.loadings"]])
##D (fit.scalar <- miout[["fit.intercepts"]])
##D 
##D 
##D ####################### Permutation Method
##D 
##D ## fit indices of interest for multiparameter omnibus test
##D myAFIs <- c("chisq","cfi","rmsea","mfi","aic")
##D moreAFIs <- c("gammaHat","adjGammaHat")
##D 
##D ## Use only 20 permutations for a demo.  In practice,
##D ## use > 1000 to reduce sampling variability of estimated p values
##D 
##D ## test configural invariance
##D set.seed(12345)
##D out.config <- permuteMeasEq(nPermute = 20, con = fit.config)
##D out.config
##D 
##D ## test metric equivalence
##D set.seed(12345) # same permutations
##D out.metric <- permuteMeasEq(nPermute = 20, uncon = fit.config, con = fit.metric,
##D                             param = "loadings", AFIs = myAFIs,
##D                             moreAFIs = moreAFIs, null = fit.null)
##D summary(out.metric, nd = 4)
##D 
##D ## test scalar equivalence
##D set.seed(12345) # same permutations
##D out.scalar <- permuteMeasEq(nPermute = 20, uncon = fit.metric, con = fit.scalar,
##D                             param = "intercepts", AFIs = myAFIs,
##D                             moreAFIs = moreAFIs, null = fit.null)
##D summary(out.scalar)
##D 
##D ## Not much to see without significant DIF.
##D ## Try using an absurdly high alpha level for illustration.
##D outsum <- summary(out.scalar, alpha = .50)
##D 
##D ## notice that the returned object is the table of DIF tests
##D outsum
##D 
##D ## visualize permutation distribution
##D hist(out.config, AFI = "chisq")
##D hist(out.metric, AFI = "chisq", nd = 2, alpha = .01,
##D      legendArgs = list(x = "topright"))
##D hist(out.scalar, AFI = "cfi", printLegend = FALSE)
##D 
##D 
##D ####################### Extra Output
##D 
##D ## function to calculate expected change of Group-2 and -3 latent means if
##D ## each intercept constraint were released
##D extra <- function(con) {
##D   output <- list()
##D   output["x1.vis2"] <- lavTestScore(con, release = 19:20, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[70]
##D   output["x1.vis3"] <- lavTestScore(con, release = 19:20, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[106]
##D   output["x2.vis2"] <- lavTestScore(con, release = 21:22, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[70]
##D   output["x2.vis3"] <- lavTestScore(con, release = 21:22, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[106]
##D   output["x3.vis2"] <- lavTestScore(con, release = 23:24, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[70]
##D   output["x3.vis3"] <- lavTestScore(con, release = 23:24, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[106]
##D   output["x4.txt2"] <- lavTestScore(con, release = 25:26, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[71]
##D   output["x4.txt3"] <- lavTestScore(con, release = 25:26, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[107]
##D   output["x5.txt2"] <- lavTestScore(con, release = 27:28, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[71]
##D   output["x5.txt3"] <- lavTestScore(con, release = 27:28, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[107]
##D   output["x6.txt2"] <- lavTestScore(con, release = 29:30, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[71]
##D   output["x6.txt3"] <- lavTestScore(con, release = 29:30, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[107]
##D   output["x7.spd2"] <- lavTestScore(con, release = 31:32, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[72]
##D   output["x7.spd3"] <- lavTestScore(con, release = 31:32, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[108]
##D   output["x8.spd2"] <- lavTestScore(con, release = 33:34, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[72]
##D   output["x8.spd3"] <- lavTestScore(con, release = 33:34, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[108]
##D   output["x9.spd2"] <- lavTestScore(con, release = 35:36, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[72]
##D   output["x9.spd3"] <- lavTestScore(con, release = 35:36, univariate = FALSE,
##D                                     epc = TRUE, warn = FALSE)$epc$epc[108]
##D   output
##D }
##D 
##D ## observed EPC
##D extra(fit.scalar)
##D 
##D ## permutation results, including extra output
##D set.seed(12345) # same permutations
##D out.scalar <- permuteMeasEq(nPermute = 20, uncon = fit.metric, con = fit.scalar,
##D                             param = "intercepts", AFIs = myAFIs,
##D                             moreAFIs = moreAFIs, null = fit.null, extra = extra)
##D ## summarize extra output
##D summary(out.scalar, extra = TRUE)
##D 
##D 
##D ###########
##D ## MIMIC ##
##D ###########
##D 
##D ## Specify Restricted Factor Analysis (RFA) model, equivalent to MIMIC, but
##D ## the factor covaries with the covariate instead of being regressed on it.
##D ## The covariate defines a single-indicator construct, and the
##D ## double-mean-centered products of the indicators define a latent
##D ## interaction between the factor and the covariate.
##D mod.mimic <- '
##D visual  =~ x1 + x2 + x3
##D age =~ ageyr
##D age.by.vis =~ x1.ageyr + x2.ageyr + x3.ageyr
##D 
##D x1 ~~ x1.ageyr
##D x2 ~~ x2.ageyr
##D x3 ~~ x3.ageyr
##D '
##D 
##D HS.orth <- indProd(var1 = paste0("x", 1:3), var2 = "ageyr", match = FALSE,
##D                    data = HS[ , c("ageyr", paste0("x", 1:3))] )
##D fit.mimic <- cfa(mod.mimic, data = HS.orth, meanstructure = TRUE)
##D summary(fit.mimic, stand = TRUE)
##D 
##D ## Whereas MIMIC models specify direct effects of the covariate on an indicator,
##D ## DIF can be tested in RFA models by specifying free loadings of an indicator
##D ## on the covariate's construct (uniform DIF, scalar invariance) and the
##D ## interaction construct (nonuniform DIF, metric invariance).
##D param <- as.list(paste0("age + age.by.vis =~ x", 1:3))
##D names(param) <- paste0("x", 1:3)
##D # param <- as.list(paste0("x", 1:3, " ~ age + age.by.vis")) # equivalent
##D 
##D ## test both parameters simultaneously for each indicator
##D do.call(rbind, lapply(param, function(x) lavTestScore(fit.mimic, add = x)$test))
##D ## or test each parameter individually
##D lavTestScore(fit.mimic, add = as.character(param))
##D 
##D 
##D ####################### Permutation Method
##D 
##D ## function to recalculate interaction terms after permuting the covariate
##D datafun <- function(data) {
##D   d <- data[, !names(data) %in% paste0("x", 1:3, ".ageyr")]
##D   indProd(var1 = paste0("x", 1:3), var2 = "ageyr", match = FALSE, data = d)
##D }
##D 
##D set.seed(12345)
##D perm.mimic <- permuteMeasEq(nPermute = 20, modelType = "mimic",
##D                             con = fit.mimic, param = param,
##D                             covariates = "ageyr", datafun = datafun)
##D summary(perm.mimic)
##D 
## End(Not run)




