library(LMERConvenienceFunctions)


### Name: LMERConvenienceFunctions-package
### Title: Model Selection and Post-hoc Analysis for (G)LMER Models
### Aliases: LMERConvenienceFunctions-package LMERConvenienceFunctions
### Keywords: package

### ** Examples

## Not run: 
##D   ############################################
##D   #            Load and format data.         #
##D   ############################################
##D   library(LCFdata)
##D   data(eeg)
##D 
##D   # restrict to electrode Fz and 80--180 ms window
##D   eeg <- eeg[eeg$Time >= 80 & eeg$Time <= 180, ]
##D   eeg <- eeg[, c("Subject", "Item", "Time", "Fz",
##D     "FreqB", "LengthB", "WMC")]
##D 
##D   # mean center FreqB
##D   eeg$FreqBc <- eeg$FreqB - mean(eeg$FreqB)
##D   # split FreqBc into 3 categories. Doesn't make sense, 
##D   # but it's merely for example
##D   eeg$FreqBdc <- "high"
##D   eeg$FreqBdc[eeg$FreqBc<=quantile(eeg$FreqBc)[3]] <- "mid"
##D   eeg$FreqBdc[eeg$FreqBc<=quantile(eeg$FreqBc)[2]] <- "low"
##D   eeg$FreqBdc <- as.factor(eeg$FreqBdc)
##D   eeg$FreqBdc <- relevel(eeg$FreqBdc, "low")
##D 
##D   # mean center LengthB
##D   eeg$LengthBc <- eeg$LengthB - mean(eeg$LengthB)
##D 
##D   # mean center WMC
##D   eeg$WMCc <- eeg$WMC - mean(eeg$WMC)
##D 
##D   ############################################
##D   #      Demonstrate plotDensity3d.fnc.      #
##D   ############################################
##D   plotDensity3d.fnc(x = sort(unique(eeg$WMCc)), 
##D     y = sort(unique(eeg$LengthBc)))
##D 
##D   ############################################
##D   #        Demonstrate plotRaw3d.fnc.        #
##D   ############################################
##D   plotRaw3d.fnc(data = eeg, response = "Fz", pred = "WMCc",
##D     intr = "LengthBc", plot.type = "persp", theta = 150)
##D 
##D   ############################################
##D   #       Analyze data. Demonstrate model    #
##D   #       selection, and diagnostic plots.   #
##D   #       Also demonstrate forward fitting   #
##D   #       of random effects and back fitting #
##D   #       of fixed effects. Finally,         #
##D   #       demonstrate pamer.fnc.             # 
##D   ############################################
##D   library(lme4)
##D   # fit initial model
##D   m0 <- lmer(Fz ~ (FreqBdc + LengthBc + WMCc)^2 + (1 | Subject), 
##D     data = eeg)
##D   m1 <- lmer(Fz ~ (FreqBdc + LengthBc + WMCc)^2 + (1 | Subject) +
##D     (1 | Item), data = eeg)
##D 
##D   # which model to choose?
##D   relLik(m0, m1)
##D 
##D   # choose m1
##D   # check model assumptions 
##D   mcp.fnc(m1)
##D 
##D   # remove outliers
##D   eeg <- romr.fnc(m1, eeg, trim = 2.5)
##D   eeg$n.removed
##D   eeg$percent.removed
##D   eeg<-eeg$data
##D 
##D   # update model
##D   m1 <- lmer(Fz ~ (FreqBdc + LengthBc + WMCc)^2 + (1 | Subject) +
##D     (1 | Item), data = eeg)
##D   
##D   # re-check model assumptions 
##D   mcp.fnc(m1)
##D 
##D   # forward-fit random effect structure (simple for the purposes
##D   # of the example).
##D   m2 <- ffRanefLMER.fnc(model = m1, ran.effects = 
##D     c("(0 + LengthBc | Subject)", "(0 + WMCc | Item)"), 
##D     log.file = FALSE)
##D 
##D   # backfit model m2. In this case, could use bfFixefLMER_t.fnc instead.
##D   m3 <- bfFixefLMER_F.fnc(m2, log.file = FALSE)
##D 
##D   # The calls to ffRanefLMER.fnc and bfFixefLMER_F.fnc could 
##D   # be replaced by a call to fitLMER.fnc. In this latter case, however, 
##D   # bfFixefLMER_F.fnc would be called first, then the random effect 
##D   # structure would be forward fitted, and finally teh fixed effects
##D   # would be backfitted again.
##D   m3b <- fitLMER.fnc(model = m1, ran.effects = c("(0 + LengthBc | Subject)",
##D     "(0 + WMCc | Item)"), backfit.on = "F", log.file = FALSE)
##D   pamer.fnc(m3b)
##D   # The results are the same. This may not necessarily be the case
##D   # elsewhere. First forward fitting the random effect structure and
##D   # then backfitting the fixed effects, potentially pruning irrelevant 
##D   # random effects, is probably the best approach. Nonetheless, there is 
##D   # no hard evidence to this effect.
##D 
##D   # check model assumptions 
##D   mcp.fnc(m3)
##D 
##D   # check significance of model terms
##D   pamer.fnc(m3)
##D 
##D   ############################################
##D   #       Demonstrate mcposthoc.fnc and      #
##D   #       summary.mcposthoc.                 #
##D   ############################################
##D   # Only the intercept is significant. For purposes of the 
##D   # example, let's perform a posthoc analysis on FreqBdc on
##D   # model m2.
##D   m2.ph <- mcposthoc.fnc(model = m2, var = list(ph1 = "FreqBdc"))
##D 
##D   # Now check if and how the different levels differ between
##D   # each other. First check high vs mid and high vs low:
##D   summary(m2.ph, term = "FreqBdchigh") 
##D   # Then low vs mid (the low vs high row is redundant from the 
##D   # above summary):
##D   summary(m2.ph, term = "FreqBdclow")
##D   # Note that none of the levels differ from each other. Indeed, 
##D   # the backfitting process indicated that the model only has an 
##D   # intercept (i.e., the FreqBc factor variable was not significant).
##D 
##D   # Just to show how one would look at posthocs for interactions. Let's 
##D   # look at the effect of Length at each FreqB bin:
##D   summary(object = m2.ph, term = "LengthBc")
##D   # Does Length effect different Freq bins? Start with low 
##D   # versus mid and high
##D   smry <- summary(object = m2.ph, term = "FreqBdclow:LengthBc")
##D   # then mid versus low and high
##D   smry <- summary(object = m2.ph, term = "FreqBdcmid:LengthBc")
##D 
##D   ############################################
##D   #       Demonstrate `revived' version of   #
##D   #       plotLMER.fnc and plotLMER3d.fnc.   #
##D   ############################################
##D   # Generate plot for Length X Freq with function plotLMER.fnc.
##D   plotLMER.fnc(m2, pred = "LengthBc", intr = list("FreqBdc", 
##D     levels(eeg$FreqBdc), "beg", list(1 : 3, 1 : 3)))
##D 
##D   # Plotting the Length:WMC interaction with plotLMER3d.fnc. It'll
##D   # take a little bit of time.
##D   plotLMER3d.fnc(m2,"LengthBc","WMCc")
##D   # Plot it a second time to demonstrate caching. You can notice the 
##D   # speed-up.
##D   plotLMER3d.fnc(m2,"LengthBc","WMCc")
##D 
##D 
##D   ############################################
##D   #       Demonstrate modeling and           #
##D   #       backfitting of glmer.              #
##D   ############################################
##D   # Split FreqBc into 2 categories.
##D   eeg$FreqBdc <- "high"
##D   eeg$FreqBdc[eeg$FreqBc<=median(eeg$FreqBc)] <- "low"
##D   eeg$FreqBdc <- as.factor(eeg$FreqBdc)
##D   eeg$FreqBdc <- relevel(eeg$FreqBdc, "low")
##D 
##D   # Fit glmer model.
##D   m4 <- glmer(FreqBdc ~ (Fz + LengthBc + WMCc)^2 + (1 | Subject),
##D 	family = "binomial", data = eeg)
##D   summary(m4)
##D 
##D   # Back fit fixed effects, forward fit random effects, and then
##D   # re-back fit fixed effects. Need to set argument backfit.on to "t".
##D   m5 <- fitLMER.fnc(model = m4, ran.effects = "(0 + LengthBc | Subject)",
##D 	backfit.on = "t", log.file = FALSE)
##D   summary(m5)
##D 
##D   # Plot the 2-way interaction.
##D   plotLMER.fnc(m5, pred = "Fz", intr = list("LengthBc", 
##D 	quantile(eeg$LengthBc), "med",list(1:5,1:5)))
##D 
##D   # Look at the same plot, but in 3d.
##D   plotLMER3d.fnc(m5, pred = "Fz", intr = "LengthBc")
##D 
##D   ############################################
##D   #       Test backfitting on AIC,           #
##D   #       BIC, llrt, relLik.AIC, and         #
##D   #       relLik.BIC.                        #
##D   ############################################
##D   # AIC
##D   m.test <- bfFixefLMER_F.fnc(m2, method = "AIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m2, method = "AIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m4, method = "AIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_F.fnc(m4, method = "AIC",
##D 	log.file = FALSE)
##D 
##D   # BIC
##D   m.test <- bfFixefLMER_F.fnc(m2, method = "BIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m2, method = "BIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m4, method = "BIC",
##D 	log.file = FALSE)
##D 
##D   # llrt
##D   m.test <- bfFixefLMER_F.fnc(m2, method = "llrt",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m2, method = "llrt",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m4, method = "llrt",
##D 	log.file = FALSE)
##D 
##D   # relLik.AIC
##D   m.test <- bfFixefLMER_F.fnc(m2, method = "relLik.AIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m2, method = "relLik.AIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m4, method = "relLik.AIC",
##D 	log.file = FALSE)
##D 
##D   # relLik.BIC
##D   m.test <- bfFixefLMER_F.fnc(m2, method = "relLik.BIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m2, method = "relLik.BIC",
##D 	log.file = FALSE)
##D   m.test <- bfFixefLMER_t.fnc(m4, method = "relLik.BIC",
##D 	log.file = FALSE)
## End(Not run)



