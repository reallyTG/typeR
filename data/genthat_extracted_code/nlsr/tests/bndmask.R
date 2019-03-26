traceval  <-  TRUE  # traceval set TRUE to debug or give full history

# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing

# A simple starting vector -- must have named parameters for nlxb, nls, wrapnlsr.
start1  <-  c(b1=1, b2=1, b3=1)
startf1  <-  c(b1=1, b2=1, b3=.1)

eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))

cat("LOCAL DATA IN DATA FRAMES\n")
weeddata1  <-  data.frame(y=ydat, tt=tdat)
weeddata2  <-  data.frame(y=1.5*ydat, tt=tdat)


cat("BOUNDS")
start2  <-  c(b1=100, b2=10, b3=0.1)
an1qb1  <-  try(nlxb(eunsc, start=start2, trace=traceval, data=weeddata1, 
                     lower=c(0,0,0), upper=c(200, 60, .3)))
print(an1qb1)
tmp  <-  readline("next")


cat("BOUNDS and MASK")

an1qbm2  <-  try(nlxb(eunsc, start=start2, trace=traceval, data=weeddata1, 
                      lower=c(0,0,0), upper=c(200, 60, .3), masked=c("b2")))
print(an1qbm2)
tmp  <-  readline("next")



