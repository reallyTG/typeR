library(Surrogate)


### Name: plot MinSurrContCont
### Title: Graphically illustrates the theoretical plausibility of finding
###   a good surrogate endpoint in the continuous-continuous case
### Aliases: 'plot MinSurrContCont' plot.MinSurrContCont
### Keywords: Plausibility of a surrogate

### ** Examples

# compute rho^2_min in the setting where the variances of T in the control
# and experimental treatments equal 100 and 120, delta is fixed at 50,
# and the grid G={0, .01, ..., 1} is considered for the counterfactual 
# correlation rho_T0T1:
MinSurr <- MinSurrContCont(T0T0 = 100, T1T1 = 120, Delta = 50,
T0T1 = seq(0, 1, by = 0.01))

# Plot the results (use percentages on Y-axis)
plot(MinSurr, Type="Percent")

# Same plot, but add the percentages of ICA values that are equal to or 
# larger than the midpoint values of the bins
plot(MinSurr, Labels=TRUE)



