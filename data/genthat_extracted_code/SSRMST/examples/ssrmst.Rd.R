library(SSRMST)


### Name: ssrmst
### Title: Sample Size Calculation using Restricted Mean Survival Time
### Aliases: ssrmst

### ** Examples

 #---Example data

 #--Non-inferiority test
 ac_rate   = 15
 ac_period = 35
 tot_time  = 510
 tau       = 500
 scale0    = 8500
 scale1    = 8500
 margin    = 18

 a = ssrmst(ac_rate=ac_rate, ac_period=ac_period, tot_time=tot_time,
            tau=tau, scale0=scale0, scale1=scale1, margin=margin, ntest=20)
 print(a)


 #--Superiority test
 ac_rate   = 15
 ac_period = 35
 tot_time  = 510
 tau       = 500
 scale0    = 4000
 scale1    = 8500
 b = ssrmst(ac_rate=ac_rate, ac_period=ac_period, tot_time=tot_time,
            tau=tau, scale0=scale0, scale1=scale1, ntest=20)
 print(b)



