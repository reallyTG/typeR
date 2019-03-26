library(FixSeqMTP)


### Name: FSFWER.arbidept.cv
### Title: Critical Values for Fixed Sequence FWER Controlling Procedures
###   under Arbitrary Dependence
### Aliases: FSFWER.arbidept.cv

### ** Examples

  ## Clinical trial example in Qiu et al. (2015)
Pval <- c(0.0008, 0.0135, 0.0197, 0.7237, 0.0003, 0.2779, 0.0054, 0.8473)
FSFWER.arbidept.cv(p=Pval, alpha=0.05, method = "reject")
FSFWER.arbidept.cv(p=Pval, alpha=0.05, beta=0.1, method = "accept")
FSFWER.arbidept.cv(p=Pval, alpha=0.05, beta=0.5, method = "accept")
FSFWER.arbidept.cv(p=Pval, alpha=0.05, beta=0.9, method = "accept")
FSFWER.arbidept.cv(p=Pval, alpha=0.05, method = "both")



