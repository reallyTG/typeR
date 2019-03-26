library(afex)


### Encoding: UTF-8

### Name: mixed
### Title: p-values for fixed effects of mixed-model via lme4::lmer()
### Aliases: mixed lmer_alt

### ** Examples


##################################
## Simple Examples (from MEMSS) ##
##################################

data("Machines", package = "MEMSS") 

# simple model with random-slopes for repeated-measures factor
m1 <- mixed(score ~ Machine + (Machine|Worker), data=Machines)
m1

# suppress correlation among random effect parameters with expand_re = TRUE
m2 <- mixed(score ~ Machine + (Machine||Worker), data=Machines, expand_re = TRUE)
m2

## compare:
summary(m1)$varcor
summary(m2)$varcor
# for wrong solution see: 
# summary(lmer(score ~ Machine + (Machine||Worker), data=Machines))$varcor

# follow-up tests
library("emmeans")  # package emmeans needs to be attached for follow-up tests.
(emm1 <- emmeans(m1, "Machine"))
pairs(emm1, adjust = "holm") # all pairwise comparisons
con1 <- list(
  c1 = c(1, -0.5, -0.5), # 1 versus other 2
  c2 = c(0.5, -1, 0.5) # 1 and 3 versus  2
)
contrast(emm1, con1, adjust = "holm")

# plotting 
emmip(m1, ~Machine, CIs = TRUE)
emmip(m2, ~Machine, CIs = TRUE)


## Not run: 
##D #######################
##D ### Further Options ###
##D #######################
##D 
##D ## Multicore:
##D 
##D require(parallel)
##D (nc <- detectCores()) # number of cores
##D cl <- makeCluster(rep("localhost", nc)) # make cluster
##D # to keep track of what the function is doindg redirect output to outfile:
##D # cl <- makeCluster(rep("localhost", nc), outfile = "cl.log.txt")
##D 
##D data("Machines", package = "MEMSS") 
##D ## There are two ways to use multicore:
##D 
##D # 1. Obtain fits with multicore:
##D mixed(score ~ Machine + (Machine|Worker), data=Machines, cl = cl)
##D 
##D # 2. Obtain PB samples via multicore: 
##D mixed(score ~ Machine + (Machine|Worker), data=Machines,
##D  method = "PB", args_test = list(nsim = 50, cl = cl)) # better use 500 or 1000 
##D 
##D ## Both ways can be combined:
##D # 2. Obtain PB samples via multicore: 
##D mixed(score ~ Machine + (Machine|Worker), data=Machines, cl = cl,
##D  method = "PB", args_test = list(nsim = 50, cl = cl))
##D 
##D #### use all_fit = TRUE and expand_re = TRUE:
##D data("sk2011.2") # data described in more detail below
##D sk2_aff <- droplevels(sk2011.2[sk2011.2$what == "affirmation",])
##D 
##D require(optimx) # uses two more algorithms
##D sk2_aff_b <- mixed(response ~ instruction*type+(inference*type||id), sk2_aff,
##D                expand_re = TRUE, all_fit = TRUE)
##D attr(sk2_aff_b, "all_fit_selected")
##D attr(sk2_aff_b, "all_fit_logLik")
##D 
##D # considerably faster with multicore:
##D clusterEvalQ(cl, library(optimx)) # need to load optimx in cluster
##D sk2_aff_b2 <- mixed(response ~ instruction*type+(inference*type||id), sk2_aff,
##D                expand_re = TRUE, all_fit = TRUE, cl=cl)
##D attr(sk2_aff_b2, "all_fit_selected")
##D attr(sk2_aff_b2, "all_fit_logLik")
##D 
##D 
##D stopCluster(cl)
##D 
## End(Not run)

###################################################
## Replicating Maxwell & Delaney (2004) Examples ##
###################################################
## Not run: 
##D 
##D ### replicate results from Table 15.4 (Maxwell & Delaney, 2004, p. 789)
##D data(md_15.1)
##D # random intercept plus random slope
##D (t15.4a <- mixed(iq ~ timecat + (1+time|id),data=md_15.1))
##D 
##D # to also replicate exact parameters use treatment.contrasts and the last level as base level:
##D contrasts(md_15.1$timecat) <- contr.treatment(4, base = 4)
##D (t15.4b <- mixed(iq ~ timecat + (1+time|id),data=md_15.1, check_contrasts=FALSE))
##D summary(t15.4a)  # gives "wrong" parameters extimates
##D summary(t15.4b)  # identical parameters estimates
##D 
##D # for more examples from chapter 15 see ?md_15.1
##D 
##D ### replicate results from Table 16.3 (Maxwell & Delaney, 2004, p. 837)
##D data(md_16.1)
##D 
##D # original results need treatment contrasts:
##D (mixed1_orig <- mixed(severity ~ sex + (1|id), md_16.1, check_contrasts=FALSE))
##D summary(mixed1_orig$full_model)
##D 
##D # p-value stays the same with afex default contrasts (contr.sum),
##D # but estimates and t-values for the fixed effects parameters change.
##D (mixed1 <- mixed(severity ~ sex + (1|id), md_16.1))
##D summary(mixed1$full_model)
##D 
##D 
##D # data for next examples (Maxwell & Delaney, Table 16.4)
##D data(md_16.4)
##D str(md_16.4)
##D 
##D ### replicate results from Table 16.6 (Maxwell & Delaney, 2004, p. 845)
##D # Note that (1|room:cond) is needed because room is nested within cond.
##D # p-value (almost) holds.
##D (mixed2 <- mixed(induct ~ cond + (1|room:cond), md_16.4))
##D # (differences are dut to the use of Kenward-Roger approximation here,
##D # whereas M&W's p-values are based on uncorrected df.)
##D 
##D # again, to obtain identical parameter and t-values, use treatment contrasts:
##D summary(mixed2) # not identical
##D 
##D # prepare new data.frame with contrasts:
##D md_16.4b <- within(md_16.4, cond <- C(cond, contr.treatment, base = 2))
##D str(md_16.4b)
##D 
##D # p-value stays identical:
##D (mixed2_orig <- mixed(induct ~ cond + (1|room:cond), md_16.4b, check_contrasts=FALSE))
##D summary(mixed2_orig$full_model) # replicates parameters
##D 
##D 
##D ### replicate results from Table 16.7 (Maxwell & Delaney, 2004, p. 851)
##D # F-values (almost) hold, p-values (especially for skill) are off
##D (mixed3 <- mixed(induct ~ cond + skill + (1|room:cond), md_16.4))
##D 
##D # however, parameters are perfectly recovered when using the original contrasts:
##D mixed3_orig <- mixed(induct ~ cond + skill + (1|room:cond), md_16.4b, check_contrasts=FALSE)
##D summary(mixed3_orig)
##D 
##D 
##D ### replicate results from Table 16.10 (Maxwell & Delaney, 2004, p. 862)
##D # for this we need to center cog:
##D md_16.4b$cog <- scale(md_16.4b$cog, scale=FALSE)
##D 
##D # F-values and p-values are relatively off:
##D (mixed4 <- mixed(induct ~ cond*cog + (cog|room:cond), md_16.4b))
##D # contrast has a relatively important influence on cog
##D (mixed4_orig <- mixed(induct ~ cond*cog + (cog|room:cond), md_16.4b, check_contrasts=FALSE))
##D 
##D # parameters are again almost perfectly recovered:
##D summary(mixed4_orig)
## End(Not run)

###########################
## Full Analysis Example ##
###########################

## Not run: 
##D ### split-plot experiment (Singmann & Klauer, 2011, Exp. 2)
##D ## between-factor: instruction
##D ## within-factor: inference & type
##D ## hypothesis: three-way interaction
##D data("sk2011.2")
##D 
##D # use only affirmation problems (S&K also splitted the data like this)
##D sk2_aff <- droplevels(sk2011.2[sk2011.2$what == "affirmation",])
##D 
##D # set up model with maximal by-participant random slopes 
##D sk_m1 <- mixed(response ~ instruction*inference*type+(inference*type|id), sk2_aff)
##D 
##D sk_m1 # prints ANOVA table with nicely rounded numbers (i.e., as characters)
##D nice(sk_m1)  # returns the same but without printing potential warnings
##D anova(sk_m1) # returns and prints numeric ANOVA table (i.e., not-rounded)
##D summary(sk_m1) # lmer summary of full model
##D 
##D # same model but using Satterthwaite approximation of df
##D # very similar results but faster
##D sk_m1b <- mixed(response ~ instruction*inference*type+(inference*type|id), 
##D                 sk2_aff, method="S")
##D nice(sk_m1b)
##D # identical results as:
##D anova(sk_m1$full_model)
##D 
##D # suppressing correlation among random slopes:
##D # very similar results, but significantly faster and often less convergence warnings. 
##D sk_m2 <- mixed(response ~ instruction*inference*type+(inference*type||id), sk2_aff,
##D                expand_re = TRUE)
##D sk_m2
##D 
##D ## mixed objects can be passed to emmeans
##D library("emmeans")  # however, package emmeans needs to be attached first
##D 
##D # recreates basically Figure 4 (S&K, 2011, upper panel)
##D # only the 4th and 6th x-axis position are flipped
##D emmip(sk_m1, instruction~type+inference)
##D 
##D # use lattice instead of ggplot2:
##D emm_options(graphics.engine = "lattice") 
##D emmip(sk_m1, instruction~type+inference)
##D emm_options(graphics.engine = "ggplot") # reset options 
##D 
##D # set up reference grid for custom contrasts:
##D # this can be made faster via:
##D emm_options(lmer.df = "Kenward-Roger") # set df for emmeans to KR
##D # emm_options(lmer.df = "Satterthwaite") # the default
##D # emm_options(lmer.df = "asymptotic") # the fastest, no df
##D (rg1 <- emmeans(sk_m1, c("instruction", "type", "inference")))
##D 
##D # set up contrasts on reference grid:
##D contr_sk2 <- list(
##D   ded_validity_effect = c(rep(0, 4), 1, rep(0, 5), -1, 0),
##D   ind_validity_effect = c(rep(0, 5), 1, rep(0, 5), -1),
##D   counter_MP = c(rep(0, 4), 1, -1, rep(0, 6)),
##D   counter_AC = c(rep(0, 10), 1, -1)
##D )
##D 
##D # test the main double dissociation (see S&K, p. 268)
##D contrast(rg1, contr_sk2, adjust = "holm")
##D # only plausibility effect is not significant here.
## End(Not run)

####################
## Other Examples ##
####################

## Not run: 
##D 
##D # use the obk.long data (not reasonable, no random slopes)
##D data(obk.long)
##D mixed(value ~ treatment * phase + (1|id), obk.long)
##D 
##D # Examples for using the per.parameter argument 
##D # note, require method = "nested-KR", "LRT", or "PB" 
##D # also we use custom contrasts
##D data(obk.long, package = "afex")
##D obk.long$hour <- ordered(obk.long$hour)
##D contrasts(obk.long$phase) <- "contr.sum"
##D contrasts(obk.long$treatment) <- "contr.sum" 
##D 
##D # tests only the main effect parameters of hour individually per parameter.
##D mixed(value ~ treatment*phase*hour +(1|id), per_parameter = "^hour$", 
##D       data = obk.long, method = "nested-KR", check_contrasts = FALSE)
##D 
##D # tests all parameters including hour individually
##D mixed(value ~ treatment*phase*hour +(1|id), per_parameter = "hour", 
##D       data = obk.long, method = "nested-KR", check_contrasts = FALSE)
##D 
##D # tests all parameters individually
##D mixed(value ~ treatment*phase*hour +(1|id), per_parameter = ".", 
##D       data = obk.long, method = "nested-KR", check_contrasts = FALSE)
##D 
##D # example data from package languageR:
##D # Lexical decision latencies elicited from 21 subjects for 79 English concrete nouns, 
##D # with variables linked to subject or word. 
##D data(lexdec, package = "languageR")
##D 
##D # using the simplest model
##D m1 <- mixed(RT ~ Correct + Trial + PrevType * meanWeight + 
##D     Frequency + NativeLanguage * Length + (1|Subject) + (1|Word), data = lexdec)
##D m1
##D # Mixed Model Anova Table (Type 3 tests, KR-method)
##D # 
##D # Model: RT ~ Correct + Trial + PrevType * meanWeight + Frequency + NativeLanguage * 
##D # Model:     Length + (1 | Subject) + (1 | Word)
##D # Data: lexdec
##D #                  Effect         df         F p.value
##D # 1               Correct 1, 1627.73   8.15 **    .004
##D # 2                 Trial 1, 1592.43   7.57 **    .006
##D # 3              PrevType 1, 1605.39      0.17     .68
##D # 4            meanWeight   1, 75.39 14.85 ***   .0002
##D # 5             Frequency   1, 76.08 56.53 ***  <.0001
##D # 6        NativeLanguage   1, 27.11      0.70     .41
##D # 7                Length   1, 75.83   8.70 **    .004
##D # 8   PrevType:meanWeight 1, 1601.18    6.18 *     .01
##D # 9 NativeLanguage:Length 1, 1555.49 14.24 ***   .0002
##D # ---
##D # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘+’ 0.1 ‘ ’ 1
##D 
##D # Fitting a GLMM using parametric bootstrap:
##D require("mlmRev") # for the data, see ?Contraception
##D 
##D gm1 <- mixed(use ~ age + I(age^2) + urban + livch + (1 | district), method = "PB",
##D  family = binomial, data = Contraception, args_test = list(nsim = 10))
##D ## note that nsim = 10 is way too low for all real examples!
##D 
## End(Not run)

## Not run: 
##D #####################################
##D ## Interplay with effects packages ##
##D #####################################
##D 
##D data("Machines", package = "MEMSS") 
##D # simple model with random-slopes for repeated-measures factor
##D m1 <- mixed(score ~ Machine + (Machine|Worker), data=Machines, 
##D             set_data_arg = TRUE) ## necessary for it to work!
##D   
##D library("effects")
##D 
##D Effect("Machine", m1$full_model) # not correct:
##D #  Machine effect
##D # Machine
##D #        A        B        C 
##D # 59.65000 52.35556 60.32222 
##D 
##D # compare:
##D emmeans::emmeans(m1, "Machine")
##D  # Machine   emmean       SE  df asymp.LCL asymp.UCL
##D  # A       52.35556 1.680711 Inf  49.06142  55.64969
##D  # B       60.32222 3.528546 Inf  53.40640  67.23804
##D  # C       66.27222 1.806273 Inf  62.73199  69.81245
##D 
##D ## necessary to set contr.sum globally:
##D set_sum_contrasts()
##D Effect("Machine", m1$full_model)
##D #  Machine effect
##D # Machine
##D #        A        B        C 
##D # 52.35556 60.32222 66.27222 
##D 
##D plot(Effect("Machine", m1$full_model))
## End(Not run)



