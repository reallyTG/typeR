library(MHTdiscrete)


### Name: MHolm.p.adjust
### Title: The adjusted p-values for Modified Holm step-down FWER
###   controlling procedure.
### Aliases: MHolm.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
MHolm.p.adjust(p,p.set)
## Compare with the traditional Holm adjustment
p.adjust(p,method = "holm")
## Compare with the Tarone-Holm adjustment
TH.p.adjust(p,p.set)



