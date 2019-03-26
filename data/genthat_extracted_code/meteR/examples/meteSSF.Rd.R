library(meteR)


### Name: meteSSF
### Title: meteSSF
### Aliases: meteSSF
### Keywords: METE, MaxEnt lagrange multiplier,

### ** Examples

data(anbo)
## calculate SSF Pi
pi1 <- meteSSF(anbo$spp, 'crcr', anbo$count, row=anbo$row, col=anbo$column, A=1, A0=16)
pi1



