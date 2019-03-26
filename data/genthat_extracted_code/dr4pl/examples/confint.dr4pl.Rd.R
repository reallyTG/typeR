library(dr4pl)


### Name: confint.dr4pl
### Title: Fit a 4 parameter logistic (4PL) model to dose-response data.
### Aliases: confint.dr4pl

### ** Examples

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_1)  # Fit a 4PL model to data

## Use the data 'sample_data_1' to obtain confidence intervals.
confint(obj.dr4pl)  # 95% confidence intervals
confint(obj.dr4pl, level = 0.99)  # 99% confidence intervals

theta <- FindInitialParms(x = sample_data_1$Dose, y = sample_data_1$Response)

# Use the same data 'sample_data_1' but different parameter estimates to obtain
# confidence intervals.
confint(obj.dr4pl, parm = theta)




