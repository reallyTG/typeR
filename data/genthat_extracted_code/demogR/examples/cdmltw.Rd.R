library(demogR)


### Name: cdmltw
### Title: Coale-Demeny Model Life Tables
### Aliases: cdmltw cdmlte cdmlts cdmltn
### Keywords: array algebra

### ** Examples

## Generate West model life table family for females
Wf <- cdmltw()

## Plot survivorship for the 25 levels
plot(Wf$age,Wf$lx[1,], type="l", xlab="Age", ylab="Survivorship")
for(i in 2:25) lines(Wf$age, Wf$lx[i,])



