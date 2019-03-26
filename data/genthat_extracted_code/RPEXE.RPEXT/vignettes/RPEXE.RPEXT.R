## ------------------------------------------------------------------------
library(RPEXE.RPEXT)
data(data2)
times = data2[,1]
censor = data2[,2]
group = data2[,3]

ID_nan = which(is.na(times))
times = times[-ID_nan] 
censor = censor[-ID_nan]
group = group[-ID_nan]
armsA_ID = which(group == 1)
armsB_ID = which(group == 2)

## ------------------------------------------------------------------------
# figure(1): Kaplan Meier curve of Arm A without indicating censored points 
km(times[armsA_ID], censor[armsA_ID], 0)

## ------------------------------------------------------------------------
# figure(2): Kaplan Meier curve of armA with censored points indicated
km_red(times[armsA_ID], censor[armsA_ID], 1)

## ------------------------------------------------------------------------
# figure(3): Kaplan Meier curve of armB without indicating censored points 
km(times[armsB_ID], censor[armsB_ID], 0)

## ------------------------------------------------------------------------
# figure(4): Kaplan Meier curve of Arm B with censored points indicated
km_red(times[armsB_ID], censor[armsB_ID], 0)

## ------------------------------------------------------------------------
# figure(5) : Combined plot of both armA and armB 
x1 = cbind(times[armsA_ID], censor[armsA_ID])
x2 = cbind(times[armsB_ID], censor[armsB_ID])
km_combine(x1,x2)

## ------------------------------------------------------------------------
# Fit the rpexe with monotonic order restriction;
pexeoutA     =  RPEXEv1_2(times[armsA_ID],censor[armsA_ID], monotone = 1,criticalp = 0.05)

pexeoutB     =  RPEXEv1_2(times[armsB_ID],censor[armsB_ID],monotone = 1,criticalp = 0.05)

# combined
pexeout = RPEXEv1_2(times,censor,monotone = 1,criticalp = 0.05)

## ------------------------------------------------------------------------
# Calculate the ttot and n from a), 0-2.777, b), 2.777-8.959, c), 8,959-end;

returnvA=totaltest(times[armsA_ID],censor[armsA_ID]) 
m=dim(returnvA)[2]/3
time_dieA=returnvA[,1:m]
ttotA=returnvA[,(m+1):(2*m)]
deathsA=returnvA[,(2*m+1):3*m]

returnvB=totaltest(times[armsB_ID],censor[armsB_ID]) 

m=dim(returnvB)[2]/3

time_dieB=returnvB[,1:m]
ttotB=returnvB[,(m+1):(2*m)]
deathsB=returnvB[,(2*m+1):3*m]

ttotA1 = 0
ttotA2 = 0
ttotA3 = 0
dA1 = 0
dA2 = 0
dA3 = 0
for (i in 1:length(time_dieA))
{
  if ( time_dieA[i]<=2.777)
  {
    ttotA1 = ttotA1+ttotA[i]
    dA1    = dA1+deathsA[i]
  }else if (time_dieA[i]<=8.959)
  {
    ttotA2 = ttotA2+ttotA[i]
    dA2    = dA2+deathsA[i]
  } else 
  {
    ttotA3 = ttotA3+ttotA[i]
    dA3    = dA3+deathsA[i]
  }
}
      
ttotB1 = 0
ttotB2 = 0
ttotB3 = 0
dB1 = 0
dB2 = 0
dB3 = 0
for (i in 1:length(time_dieB))
{
  if ( time_dieB[i]<=2.777)
  {
    ttotB1 = ttotB1+ttotB[i]
    dB1    = dB1+deathsB[i]
  }else if (time_dieB[i]<=8.959)
  {
    ttotB2 = ttotB2+ttotB[i]
    dB2    = dB2+deathsB[i]
  } else 
  {
    ttotB3 = ttotB3+ttotB[i]
    dB3    = dB3+deathsB[i]
  }
}

## ------------------------------------------------------------------------
# Test the two side hypothesis;

# Two-sided test
# first piece
result=exact_pvalue(ttotA1,ttotB1,dA1,dB1,0)
a11 = result[1]
p11 = result[2]
p11
# second piece
result=exact_pvalue(ttotA2,ttotB2,dA2,dB2,0)
a12 = result[1]
p12 = result[2]
p12
# third piece
result=exact_pvalue(ttotA3,ttotB3,dA3,dB3,0)
a13 = result[1]
p13 = result[2]
p13

# One-sided test
# first piece
result=exact_pvalue(ttotA1,ttotB1,dA1,dB1,1)
a21 = result[1]
p21 = result[2]
p21
# second piece
result=exact_pvalue(ttotA2,ttotB2,dA2,dB2,1)
a22 = result[1]
p22 = result[2]
p22
# third piece
result=exact_pvalue(ttotA3,ttotB3,dA3,dB3,1)
a23 = result[1]
p23 = result[2]
p23

