library(mada)


### Name: madauni
### Title: Meta-Analyisis of univariate measures of diagnostic accuracy
### Aliases: madauni

### ** Examples

data(AuditC)

## First example: DOR meta-analysis
AuditC.uni <- madauni(AuditC)
summary(AuditC.uni)

## Second example: sensitivity analysis
## Do continuity corrections make a difference?
AuditC.uni_low <- madauni(AuditC, correction = 0.1)
AuditC.uni_single <-  madauni(AuditC, 
          correction.control = "single") ## default is "all"
confint(AuditC.uni)
confint(AuditC.uni_low)
confint(AuditC.uni_single)



