rm(list=ls())
require(nlsr)

traceval  <-  TRUE  # traceval set TRUE to debug or give full history

# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing

# A simple starting vector -- must have named parameters for nlxb, nls, wrapnlsr.

eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))

cat("LOCAL DATA IN DATA FRAMES\n")
weeddata1  <-  data.frame(y=ydat, tt=tdat)
startf1  <-  c(b1=1, b2=1, b3=.1)
start1  <-  c(b1=1, b2=1, b3=1)

## With BOUNDS


anlxb1  <-  try(nlxb(eunsc, start=startf1, lower=c(b1=0, b2=0, b3=0), 
      upper=c(b1=500, b2=100, b3=5), trace=traceval, data=weeddata1))

print(anlxb1)

## anlxb1  <-  try(nlxb(eunsc, start=startf1, lower=c(b1=0, b2=0, b3=0), upper=c(b1=500, b2=40, b3=5), trace=traceval, data=weeddata1))

# Check nls too

anlsb1  <-  try(nls(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
     upper=c(b1=500, b2=100, b3=5), trace=traceval, data=weeddata1, 
             algorithm='port'))
print(anlsb1)


anlxb2  <-  try(nlxb(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
        upper=c(b1=500, b2=100, b3=.25), trace=traceval, data=weeddata1))
print(anlxb2)


anlsb2  <-  try(nls(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
                upper=c(b1=500, b2=100, b3=.25), trace=traceval, 
                data=weeddata1, algorithm='port'))
print(anlsb2)



