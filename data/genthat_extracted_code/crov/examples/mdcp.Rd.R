library(crov)


### Name: mdcp
### Title: Monotonicity Direction Classification (MDC) procedure
### Aliases: mdcp

### ** Examples

# Ordinal predictors: EduLevel, IncQuint, Health,
# Overcrowd, and NumChildren
mdcpExample <- mdcp(QoL ~ EduLevel + Age + IncQuint + Gender + Health +
Overcrowd + Activity + NumChildren, data = crovData,
CLS1 = 0.95, TLBS2 = 0.90, TLNS2 = 0.99, StepSizeCLS2 = 0.0002)
mdcpExample$MDCproc
cbind("CMLE"=mdcpExample$estimates,"UMLE"=mdcpExample$UMLE)
mdcpExample$UMLE_SE
mdcpExample$log.lik
mdcpExample$allModels[1:6]



