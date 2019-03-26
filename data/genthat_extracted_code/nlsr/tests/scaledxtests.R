require(nlsr)
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

anlxb1  <-  try(nlxb(eunsc, start=start1, trace=traceval, data= weeddata1))
print(anlxb1)

anlxb2  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata2))
print(anlxb2)


suneasy  <-  c(b1=200, b2=50, b3=0.3)
ssceasy  <-  c(b1=2, b2=5, b3=3)
st1scal  <-  c(b1=100, b2=10, b3=0.1)


cat("EASY start -- unscaled")
anls01  <-  try(nls(eunsc, start=suneasy, trace=traceval, data=weeddata1))
print(anls01)
anl01  <-  try(nlxb(eunsc, start=suneasy, trace=traceval, data=weeddata1))
print(anl01)

cat("All 1s start -- unscaled")
anls02  <-  try(nls(eunsc, start=start1, trace=traceval, data=weeddata1))
if (class(anls02) == "try-error") {
   cat("FAILED:")
   print(anls02)
} else {
   print(anls02)
}
anl02  <-  nlxb(eunsc, start=start1, trace=traceval, data=weeddata1)
print(anl02)

escal  <-   y ~ 100*b1/(1+10*b2*exp(-0.1*b3*tt))

cat("ones start -- scaled")
anls03  <-  try(nls(escal, start=start1, trace=traceval, data=weeddata1))
print(anls03)
anl03  <-  nlxb(escal, start=start1, trace=traceval, data=weeddata1)
print(anl03)

# cat("HARD start -- scaled")
# anls04  <-  try(nls(escal, start=st1scal, trace=traceval, data=weeddata1))
# print(anls04)
# anl04  <-  nlxb(escal, start=st1scal, trace=traceval, data=weeddata1)
# print(anl04)

cat("EASY start -- scaled")
anls05  <-  try(nls(escal, start=ssceasy, trace=traceval, data=weeddata1))
print(anls05)
anl05  <-  nlxb(escal, start=ssceasy, trace=traceval, data=weeddata1)
print(anl05)

