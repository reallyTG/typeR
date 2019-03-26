library(MHTdiscrete)


### Name: Sidak.p.adjust
### Title: The adjusted p-values for Sidak single-step FWER controlling
###   procedure.
### Aliases: Sidak.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
Sidak.p.adjust(p)



