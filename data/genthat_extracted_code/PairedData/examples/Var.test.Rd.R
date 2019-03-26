library(PairedData)


### Name: Var.test
### Title: Tests of variance(s) for normal distribution(s)
### Aliases: Var.test Var.test.default pitman.morgan.test.default
###   Var.test.paired
### Keywords: htest

### ** Examples

data(HorseBeginners)

#one sample test
Var.test(HorseBeginners$Actual,ratio=15)

# two independent samples test
Var.test(HorseBeginners$Actual,HorseBeginners$Imaginary)

# two dependent samples test
Var.test(HorseBeginners$Actual,HorseBeginners$Imaginary,paired=TRUE)
p<-with(HorseBeginners,paired(Actual,Imaginary))
Var.test(p)



