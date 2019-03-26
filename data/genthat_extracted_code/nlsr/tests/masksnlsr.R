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

cat("TEST MASKS\n")

anlsmnqm  <-  try(nlxb(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
   upper=c(b1=500, b2=100, b3=5), masked=c("b2"), trace=traceval, data=weeddata1))
print(anlsmnqm)

cat("UNCONSTRAINED\n")
an1q  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1))
print(an1q)


cat("MASKED\n")

an1qm3  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1, 
                masked=c("b3")))
print(an1qm3)

# Note that the parameters are put in out of order to test code.
an1qm123  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1, 
                  masked=c("b2","b1","b3")))
print(an1qm123)



