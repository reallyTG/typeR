library(MSGARCH)


### Name: CreateSpec
### Title: Model specification.
### Aliases: CreateSpec

### ** Examples

# create a Markov-switching specification
# MS-GARCH(1,1)-GJR(1,1)-Student
spec <- CreateSpec(variance.spec = list(model = c("sGARCH","gjrGARCH")),
                   distribution.spec = list(distribution = c("std","std")),
                   switch.spec = list(do.mix = FALSE))
print(spec)

# create a 3-regime Markov-switching specification with the help of variable K
# MS(3)-GARCH(1,1)- Student
spec <- CreateSpec(variance.spec = list(model = c("sGARCH")),
                   distribution.spec = list(distribution = c("std")),
                   switch.spec = list(do.mix = FALSE, K = 3))
print(spec)

# create a mixture specification
# MIX-GARCH(1,1)-GJR(1,1)-Student
spec <- CreateSpec(variance.spec = list(model = c("sGARCH","gjrGARCH")),
                   distribution.spec = list(distribution = c("std","std")),
                   switch.spec = list(do.mix = TRUE))
print(spec)

# setting fixed parameter for the sGARCH beta parameter
# MS-GARCH(1,1)-GJR(1,1)-Student with beta_1 fixed to 0
spec <- CreateSpec(variance.spec = list(model = c("sGARCH","gjrGARCH")),
                   distribution.spec = list(distribution = c("std","std")),
                   switch.spec = list(do.mix = FALSE),
                   constraint.spec = list(fixed = list(beta_1 = 0)))
print(spec)

# setting restriction for the shape parameter of the Student-t across regimes
# MS-GARCH(1,1)-GJR(1,1)-Student with shape parameter constraint across regime
spec <- CreateSpec(variance.spec = list(model = c("sGARCH","gjrGARCH")),
                   distribution.spec = list(distribution = c("std","std")),
                   switch.spec = list(do.mix = FALSE),
                   constraint.spec = list(regime.const = c("nu")))
print(spec)

# setting custom parameter priors for the beta parameters
# MS-GARCH(1,1)-GJR(1,1)-Student with prior modification
spec <- CreateSpec(variance.spec = list(model = c("sGARCH","gjrGARCH")),
                   distribution.spec = list(distribution = c("std","std")),
                   switch.spec = list(do.mix = FALSE),
                   prior = list(mean = list(beta_1 = 0.9, beta_2 = 0.3),
                                sd = list(beta_1 = 0.05, beta_2 = 0.01)))
print(spec)



