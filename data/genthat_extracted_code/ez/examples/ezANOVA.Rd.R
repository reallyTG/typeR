library(ez)


### Name: ezANOVA
### Title: Compute ANOVA
### Aliases: ezANOVA

### ** Examples


#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)


#Run an ANOVA on the mean correct RT data.
rt_anova = ezANOVA(
    data = ANT[ANT$error==0,]
    , dv = rt
    , wid = subnum
    , within = .(cue,flank)
    , between = group
)

#Show the ANOVA and assumption tests.
print(rt_anova)

## Not run: 
##D #Run an ANOVA on the mean correct RT data, ignoring group.
##D rt_anova2 = ezANOVA(
##D     data = ANT[ANT$error==0,]
##D     , dv = rt
##D     , wid = subnum
##D     , within = .(cue,flank)
##D )
##D 
##D #Show the ANOVA and assumption tests.
##D print(rt_anova2)
## End(Not run)

#Run a purely between-Ss ANOVA on the mean_rt data.
#NOTE use of within_full to ensure that the data are
# collapsed properly
rt_anova3 = ezANOVA(
    data = ANT[ANT$error==0,]
    , dv = rt
    , wid = subnum
    , within_full = .(cue,flank)
    , between = group
)

#Show the ANOVA and assumption tests.
print(rt_anova3)


#add a within-Ss effect to be used as a covariate
ANT$rt2 = ANT$rt + ANT$block*1000 #additive with and independent of the other predictors!

## Not run: 
##D #Run an anova that doesn't use the covariate
##D rt_anova4a = ezANOVA(
##D     data = ANT[ANT$error==0,]
##D     , dv = rt2
##D     , wid = subnum
##D     , within = .(cue,flank)
##D     , between = group
##D )
##D 
##D #Show the ANOVA and assumption tests.
##D # Note loss of power to observe the within effects
##D print(rt_anova4a)
## End(Not run)

#Run an anova that does use the covariate
rt_anova4b = ezANOVA(
    data = ANT[ANT$error==0,]
    , dv = rt2
    , wid = subnum
    , within = .(cue,flank)
    , within_covariates = block
    , between = group
)

#Show the ANOVA and assumption tests.
# Note power to observe the within effects has returned
print(rt_anova4b)


#add a between-Ss effect to be used as a covariate
ANT$bc = as.numeric(as.character(ANT$subnum))%%10 #Note that the effect is balanced across groups
ANT$rt3 = ANT$rt + ANT$bc*1000 #additive with and independent of the other predictors!

## Not run: 
##D #Run an anova that doesn't use the covariate
##D rt_anova5a = ezANOVA(
##D     data = ANT[ANT$error==0,]
##D     , dv = rt2
##D     , wid = subnum
##D     , within = .(cue,flank)
##D     , between = group
##D )
##D 
##D #Show the ANOVA and assumption tests.
##D # Note loss of power to observe the between effects
##D print(rt_anova5a)
## End(Not run)

#Run an anova that does use the covariate
rt_anova5b = ezANOVA(
    data = ANT[ANT$error==0,]
    , dv = rt2
    , wid = subnum
    , within = .(cue,flank)
    , between = group
    , between_covariates = bc
)

#Show the ANOVA and assumption tests.
# Note power to observe the between effects has returned
print(rt_anova5b)




