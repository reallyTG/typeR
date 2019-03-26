library(MHTdiscrete)


### Name: Roth.p.adjust
### Title: The adjusted p-values for Roth's step-up FWER controlling
###   procedure.
### Aliases: Roth.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
Roth.p.adjust(p,p.set,digits=5)



