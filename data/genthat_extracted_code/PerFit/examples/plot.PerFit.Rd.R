library(PerFit)


### Name: plot PerFit
### Title: Plot method for objects of class "PerFit"
### Aliases: plot.PerFit
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the ZU3 scores:
ZU3.out <- ZU3(InadequacyData)

# Plot the sampling distribution of the ZU3 scores, with cutoff value based on a nominal 5% level,
# and 90% confidence interval:
plot(ZU3.out, Type="Both", Blvl=.05, CIlvl = 0.90)



