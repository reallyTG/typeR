library(psych)


### Name: describe
### Title: Basic descriptive statistics useful for psychometrics
### Aliases: describe describeData describeFast
### Keywords: multivariate models univar

### ** Examples

data(sat.act)
describe(sat.act)

describe(sat.act,skew=FALSE)
describe(sat.act,IQR=TRUE) #show the interquartile Range
describe(sat.act,quant=c(.1,.25,.5,.75,.90) ) #find the 10th, 25th, 50th, 
                   #75th and 90th percentiles
                   
                   
 
describeData(sat.act) #the fast version just  gives counts and head and tail

print(describeFast(sat.act),short=FALSE)  #even faster is just counts  (just less information)  

#now show how to adjust the displayed number of digits
 des <- describe(sat.act)  #find the descriptive statistics.  Keep the original accuracy
 des  #show the normal output, which is rounded to 2 decimals
 print(des,digits=3)  #show the output, but round to 3 (trailing) digits
 print(des, signif=3) #round all numbers to the 3 significant digits 





