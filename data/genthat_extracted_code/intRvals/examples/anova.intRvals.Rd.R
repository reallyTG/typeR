library(intRvals)


### Name: anova.intRvals
### Title: Compares model fits of 'intRvals' objects
### Aliases: anova.intRvals

### ** Examples

data(goosedrop)
model1=estinterval(goosedrop$interval,fun="gamma")
# visually inspect model1 fit:
plot(model1)
# The observed distribution has intervals near zero.
# We allow a small random baseline to reduce the effect
# of intervals near zero on the fit result.
model2=estinterval(goosedrop$interval,fun="gamma",fpp.method='auto')
# model2 performs better than model1:
anova(model1,model2)



