library(ez)


### Name: ezPredict
### Title: Compute predicted values from the fixed effects of a mixed
###   effects model
### Aliases: ezPredict

### ** Examples

library(lme4)

#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)

#fit a mixed effects model to the rt data
rt_fit = lmer(
    formula = rt ~ cue*flank*group + (1|subnum)
    , data = ANT[ANT$error==0,]
)

#obtain the predictions from the model
rt_preds = ezPredict(
    fit = rt_fit
)


#visualize the predictions
ezPlot2(
    preds = rt_preds
    , x = flank
    , row = cue
    , col = group
    , y_lab = 'RT (ms)'
)




