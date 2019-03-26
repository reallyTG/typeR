library(medflex)


### Name: plot.neModel
### Title: Confidence interval plots for natural effect components
### Aliases: plot.neModel plot.neModelBoot

### ** Examples

data(UPBdata)

impData <- neImpute(UPB ~ att * negaff + educ + gender + age, 
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ att0 * att1 + educ + gender + age, 
                 family = binomial, expData = impData, se = "robust")

plot(neMod)
plot(neMod, transf = exp, 
     ylabels = c("PDE", "TDE", "PIE", "TIE", "TE"))
plot(neMod, level = 0.9, xRef = c(-1, 0))



