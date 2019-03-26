library(ZVCV)


### Name: VDP
### Title: Example of estimation using SMC
### Aliases: VDP

### ** Examples

set.seed(1)

# Load the SMC results
data(VDP) 

# Set up the list of control variates to choose from 
options <- list()
# Vanilla Monte Carlo
options[[1]] <- list(polyorder = 0)
# Standard ZV-CV with polynomial order selected through cross-validation
options[[2]] <- list(polyorder = Inf, regul_reg = FALSE)

##############################
# Posterior expectation - The true expectation is 0.9852 to 4 decimal places
##############################

# Note the exp() because samples and derivatives were stored on the log scale
# but we are interested in the expectation on the original scale
posterior <- zvcv(exp(VDP$samples[,,8]), VDP$samples[,,8],
VDP$der_loglike[,,8] + VDP$der_logprior[,,8], options = options) 
posterior$expectation # The posterior expectation estimate
posterior$polyorder # The selected polynomial order

##############################
# Evidence estimation - The true logged evidence is 10.36 to 2 decimal places
##############################

## Not run: 
##D # Getting additional temperatures based on maintaing a CESS of 0.99N rather than 0.9N
##D temp <- Expand_Temperatures(VDP$temperatures, VDP$loglike, 0.99)
##D VDP$temperatures_new <- temp$temperatures_all # the new temperatures
##D VDP$most_recent <- temp$relevant_samples # the samples associated with the new temperatures
## End(Not run)

## Don't show: 
# Getting additional temperatures based on maintaing a CESS of 0.91N rather than 0.9N
temp <- Expand_Temperatures(VDP$temperatures, VDP$loglike, 0.91)
VDP$temperatures_new <- temp$temperatures_all # the new temperatures
VDP$most_recent <- temp$relevant_samples # the samples associated with the new temperatures
## End(Don't show)

# Evidence estimation using the SMC identity
Z_SMC <- evidence_SMC(VDP$samples, VDP$loglike, VDP$der_loglike, VDP$der_logprior,
VDP$temperatures, VDP$temperatures_new, VDP$most_recent, options = options)
Z_SMC$log_evidence

# Evidence estimation using the CTI identity
Z_CTI <- evidence_CTI(VDP$samples, VDP$loglike, VDP$der_loglike, VDP$der_logprior,
VDP$temperatures, VDP$temperatures_new, VDP$most_recent, options = options)
Z_CTI$log_evidence_PS2



