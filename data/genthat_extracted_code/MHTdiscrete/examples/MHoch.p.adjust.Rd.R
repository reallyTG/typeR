library(MHTdiscrete)


### Name: MHoch.p.adjust
### Title: The adjusted p-values for Modified Hochberg step-up FWER
###   controlling procedure.
### Aliases: MHoch.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
MHoch.p.adjust(p,p.set)
## Compare with the traditional Hochberg adjustment
p.adjust(p,method = "hochberg")
## Compare with the Roth adjustment
Roth.p.adjust(p,p.set)



