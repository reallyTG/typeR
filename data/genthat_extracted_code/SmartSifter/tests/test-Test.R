##parametric model tests

initial=matrix(c(0.5,0,0,1,0,0,1,0.5,1,1,1,0,0,1),nrow=1)
const = c(0,1,2,0.1,0.1,2,2)
param=TRUE

y=matrix(c(1,3,1,0,1,1),nrow=2)
result = Train(y,param,const,initial)
smart = result$smart
const[1] = result$N

y=matrix(c(2,1,0),nrow=1)
result = Test(y,param,smart,const,initial)
smart = result$smart
hellingerScore = as.numeric(result$HellingerScore)
logLoss = as.numeric(result$LogLoss)
const[1] = result$N

smart=round(smart,6)

correctsmart = matrix(c(1,3,2,0.81,0.9,1,0.2988930,0.3321033,0.3690037,0.4673181,
                 0.4726924,0.4726924,0.01731805,0.00000000,0.02269242,
                 0.01731805,0.02269242,0.00000000,0.03705838,0.00000000,
                 0.04800674,0.03705838,0.04800674,0.00000000,0.4673181,
                 0.4500000,0.4726924,0.01731805,0.00000000,0.00000000,
                 0.01731805,0.00000000,0.00000000,0.4673181,0.4726924,
                 0.4500000,0.9986267,0.9519933,0.9976954,0.03568506,0,0,
                 0.03568506,0,0,0.9986267,0.9976954,0.9519933,0.5326819,
                 0.5273076,0.5273076,0.5326819,0.4500000,0.5273076,0.5326819,
                 0.5273076,0.4500000,1.0000000,0.8533919,1,1,1,0.8533919,
                 0.9826819,0.9000000,0.9773076,0.5326819,0.45,0.45,
                 0.5326819,0.45,0.45,0.9826819,0.9773076,0.9,0.8447818,
                 0.9785061,0.8533919,0,0,0,0,0,0,0.8447818,0.8533919,
                 0.9785061),nrow=3)

correctsmart = round(correctsmart,6)
hellingerScore = round(hellingerScore,3) 
logLoss = round(logLoss,6)

correctconst = c(3,1,2,0.1,0.1,2,2)

expect_that(smart,equals(correctsmart))
expect_that(const,equals(correctconst))
expect_that(hellingerScore,equals(-6603.622))
expect_that(logLoss,equals(2.372465))

##non-parametric model test
param=FALSE
const = c(0,1,2,0.1,0.1,2,1)
initial = matrix(c(0,0,1,1),nrow=1)

y=matrix(c(1,3,1,0,1,1),nrow=2)
result = Train(y,param,const,initial)
smart = result$smart
const[1] = result$N


y=matrix(c(2,1,0),nrow=1)
result = Test(y,param,smart,const,initial)
smart = result$smart
hellingerScore = as.numeric(result$HellingerScore)
logLoss = as.numeric(result$LogLoss)
const[1] = result$N

smart=round(smart,6)

correctsmart = matrix(c(1,3,2,0.81,0.9,1,0.2988930,0.3321033,0.3690037,0.06065307,
                 -0.03125017,0.06570419,0.06065307,0.06570419,-0.03125017,
                 1.0606531,0.9342958,1.0312502,1.0606531,1.0312502,0.9342958),nrow=3)
correctconst = c(3,1,2,0.1,0.1,2,1)

correctsmart=round(correctsmart,6)
hellingerScore = round(hellingerScore,3) 
logLoss = round(logLoss,6)

expect_that(smart,equals(correctsmart))
expect_that(const,equals(correctconst))
expect_that(hellingerScore,equals(-5559.15))
expect_that(logLoss,equals(2.367172))
