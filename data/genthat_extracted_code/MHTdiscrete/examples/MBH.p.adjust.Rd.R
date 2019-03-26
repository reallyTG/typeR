library(MHTdiscrete)


### Name: MBH.p.adjust
### Title: The adjusted p-values for Modified Benjamini-Hochberg (BH)
###   step-up FDR controlling procedure.
### Aliases: MBH.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
MBH.p.adjust(p,p.set)



