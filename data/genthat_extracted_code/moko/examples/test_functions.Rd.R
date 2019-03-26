library(moko)


### Name: test_functions
### Title: Test functions for optimization
### Aliases: test_functions Shaffer1 Shaffer2 Fonseca Kursawe Viennet Binh

### ** Examples


#function should be evaluated in the -A < x < A interval,
#where A is from 10 to 10^5 and \length(x) = 1
Shaffer1(0)

#function should be evaluated in the -5 < x < 10 interval \length(x) = 1
Shaffer2(0)

#function should be evaluated in the -20 < x < 20 interval and \length(x) >= 1
Fonseca(rep(0,10))

#function should be evaluated in the -5 < x < 5 interval and \length(x) == 3
Kursawe(rep(0,3))

#function should be evaluated in the -3 < x < 3 interval and \length(x) == 2
Viennet(c(0.5,0.5))

#function should be evaluated in the 0 < x < (5,3) interval and \length(x) == 2
Binh(c(0,0))



