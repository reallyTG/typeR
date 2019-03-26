library(EffectTreat)


### Name: plot GoodPretreatContCont
### Title: Graphically illustrates the theoretical plausibility of finding
###   a good pretreatment predictor in the continuous-continuous case
### Aliases: 'plot GoodPretreatContCont' plot.GoodPretreatContCont
### Keywords: Plausibility of a good pretreatment predictor
###   Continuous-continuous setting

### ** Examples


# compute rho^2_min in the setting where the variances of T in the control
# and experimental treatments equal 100 and 120, delta is fixed at 50,
# and the grid G={0, .01, ..., 1} is considered for the counterfactual 
# correlation rho_T0T1:

MinPred <- GoodPretreatContCont(T0T0 = 100, T1T1 = 120, Delta = 50,
T0T1 = seq(0, 1, by = 0.01))

# Plot the results (use percentages on Y-axis)
plot(MinPred, Type="Percent")

# Same plot, but add the percentages of ICA values that are equal to or 
# larger than the midpoint values of the bins
plot(MinPred, Labels=TRUE)



