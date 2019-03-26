library(MOTE)


### Name: omega.partial.SS.bn
### Title: Partial Omega Squared for Between Subjects ANOVA from F
### Aliases: omega.partial.SS.bn
### Keywords: ANOVA effect omega, size,

### ** Examples


#The following example is derived from the "bn2_data" dataset, included
#in the MOTE library.

#Is there a difference in atheletic spending budget for different sports?
#Does that spending interact with the change in coaching staff? This data includes
#(fake) atheletic budgets for baseball, basketball, football, soccer, and volleyball teams
#with new and old coaches to determine if there are differences in
#spending across coaches and sports.

library(ez)
bn2_data$partno = 1:nrow(bn2_data)
anova_model = ezANOVA(data = bn2_data,
                      dv = money,
                      wid = partno,
                      between = .(coach, type),
                      detailed = TRUE,
                      type = 3)

#You would calculate one eta for each F-statistic.
#Here's an example for the interaction with typing in numbers.
omega.partial.SS.bn(dfm = 4, dfe = 990,
                    msm = 338057.9 / 4,
                    mse = 32833499 / 990,
                    ssm = 338057.9,
                    n = 1000, a = .05)

#Here's an example for the interaction with code.
omega.partial.SS.bn(dfm = anova_model$ANOVA$DFn[4],
                    dfe = anova_model$ANOVA$DFd[4],
                    msm = anova_model$ANOVA$SSn[4] / anova_model$ANOVA$DFn[4],
                    mse = anova_model$ANOVA$SSd[4] / anova_model$ANOVA$DFd[4],
                    ssm = anova_model$ANOVA$SSn[4],
                    n = nrow(bn2_data),
                    a = .05)



