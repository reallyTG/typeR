library(nlmixr)


### Name: vpc_nlmixr_nlme
### Title: Visual predictive check (VPC) for nlmixr nlme objects
### Aliases: vpc_nlmixr_nlme vpcNlmixrNlme vpc.nlmixrNlme

### ** Examples

specs <- list(fixed=lKA+lCL+lV~1, random = pdDiag(lKA+lCL~1), start=c(lKA=0.5, lCL=-3.2, lV=-1))
fit <- nlme_lin_cmpt(theo_md, par_model=specs, ncmt=1, verbose=TRUE)
vpc(fit, nsim = 100, condition = NULL)



