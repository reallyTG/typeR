library(wavethresh)


### Name: WTEnv
### Title: Environment that exists to store intermediate calculations for
###   re-use within the same R session.
### Aliases: WTEnv
### Keywords: algebra

### ** Examples

#
# See what it is
#
WTEnv
#<environment: 0x102fc3830>
#
# Compute something that uses the environment
#
fred <- PsiJ(-5)
#
# Now let's see what got put in
#
ls(envir=WTEnv)
#[1] "Psi.5.10.DaubLeAsymm"



