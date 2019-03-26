##parametric model test

initial=matrix(c(0.5,0,0,1,0,0,1,0.5,1,1,1,0,0,1),nrow=1)
const = c(0,1,2,0.1,0.1,2,2)
param=T

y=matrix(c(1,3,1,0,1,1),nrow=2)
result = Train(y,param,const,initial)
smart = result$smart
hellingerScore = result$HellingerScore
logLoss = result$LogLoss
const[1] = result$N
smart = round(smart,6)

correctsmart = matrix(c(1,3,0.9,1, 0.4736842,0.5263158,0.4673181,0.4726924,0.01731805,
                 0.00000000,0.01731805,0.02269242, 0.03705838,0.00000000,0.03705838,
                 0.04800674,0.4673181,0.4500000,0.01731805,0.00000000,0.01731805,
                 0.00000000,0.4673181,0.4726924,0.9986267,0.9519933, 0.03568506,
                 0.00000000, 0.03568506,0.00000000,0.9986267,0.9976954,0.5326819,
                 0.5273076, 0.5326819,0.4500000,0.5326819,0.5273076,1.0000000,
                 0.8533919,1,1,0.9826819,0.9000000,0.5326819,0.4500000,
                 0.5326819,0.4500000, 0.9826819,0.9773076,0.8447818,0.9785061,0,
                 0,0,0,0.8447818,0.8533919),nrow=2)

correcthellingerScore = matrix(c(-12416.24,-18233.17),nrow=1)
correctlogLoss = matrix(c(2.662034,2.477825),nrow=1)

correctsmart = round(correctsmart,6)
correcthellingerScore = round(correcthellingerScore,2)
correctlogLoss =  round(correctlogLoss,6)
hellingerScore = round(hellingerScore,2)
logLoss = round(logLoss,6)

correctconst = c(2,1,2,0.1,0.1,2,2)

expect_that(smart,equals(correctsmart))
expect_that(const,equals(correctconst))
expect_that(hellingerScore,equals(correcthellingerScore))
expect_that(logLoss,equals(correctlogLoss))

##non-parametric model test
param=FALSE
const = c(0,1,2,0.1,0.1,2,1)
initial = matrix(c(0,0,1,1),nrow=1)

y=matrix(c(1,3,1,0,1,1),nrow=2)
result = Train(y,param,const,initial)
smart = result$smart
hellingerScore = result$HellingerScore
logLoss = result$LogLoss
const[1] = result$N
smart=round(smart,6)

correctsmart = matrix(c(1,3,0.9,1,0.4736842,0.5263158,0.06065307,-0.03125017,0.06065307,
                 0.06570419,1.0606531,0.9342958,1.060653,1.031250),nrow=2)

correcthellingerScore = matrix(c(-8153.223,-9515.37),nrow=1)
correctlogLoss = matrix(c(2.627919,2.472533),nrow=1)

correctsmart=round(correctsmart,6)
correcthellingerScore = round(correcthellingerScore,2)
correctlogLoss =  round(correctlogLoss,6)
hellingerScore = round(hellingerScore,2)
logLoss = round(logLoss,6)

correctconst = c(2,1,2,0.1,0.1,2,1)

expect_that(smart,equals(correctsmart))
expect_that(const,equals(correctconst))
expect_that(hellingerScore,equals(correcthellingerScore))
expect_that(logLoss,equals(correctlogLoss))
