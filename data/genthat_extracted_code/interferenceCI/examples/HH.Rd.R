library(interferenceCI)


### Name: HH
### Title: Large sample confidence intervals for treatment effects on a
###   binary outcome in a two-stage randomized experiment with interference
### Aliases: HH
### Keywords: interference large sample confidence interval

### ** Examples

#Table 3 from Hudgens and Halloran (2008) 
hh = array(c(16,18,12541-16,12541-18,26,54,11513-26,11513-54,17,119,10772-17,
     25134-119,22,122,8883-22,20727-122,15,92,5627-15,13130-92),c(2,2,5))
e1 = HH('OE',c(1,1,0,0,0),hh,round(0.3*c(25082,23026,35906,29610,18757),0),
     round(0.5*c(25082,23026,35906,29610,18757),0),0.05)
round(1000*e1$est,3)
round(1000000*e1$v,3)



