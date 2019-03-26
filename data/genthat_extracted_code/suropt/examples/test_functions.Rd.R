library(suropt)


### Name: test_functions
### Title: nowacki_beam_tps' Test functions for optimization
### Aliases: test_functions shaffer1 shaffer2 fonseca kursawe viennet binh

### ** Examples


#function should be evaluated in the -A < x < A interval,
#where A is from 10 to 10^5 and \length(x) = 1
shaffer1(0)

#function should be evaluated in the -5 < x < 10 interval \length(x) = 1
shaffer2(0)

#function should be evaluated in the -20 < x < 20 interval and \length(x) >= 1
fonseca(rep(0,10))

#function should be evaluated in the -5 < x < 5 interval and \length(x) == 3
kursawe(rep(0,3))

#function should be evaluated in the -3 < x < 3 interval and \length(x) == 2
viennet(c(0.5,0.5))

#function should be evaluated in the 0 < x < (5,3) interval and \length(x) == 2
binh(c(0,0))



