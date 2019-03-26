library(pems.utils)


### Name: 3.2.analysis.summary.reports
### Title: Generating summary reports
### Aliases: 3.2.analysis.summary.reports summary.reports summaryReport
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#basic usage

summaryReport(velocity, local.time, data=pems.1)

#   distance.travelled.km time.total.s avg.speed.km.h avg.running.speed.km.h
# 1              6.186056         1000        22.2698               28.78538
#   time.idle.s time.idle.pc avg.accel.m.s.s time.accel.s time.accel.pc
# 1          40            4       0.7921279          271          27.1
#   avg.decel.m.s.s time.decel.s time.decel.pc
# 1      -0.9039449          238          23.8

#apply to multiple cases

my.pems <- list(pems.1, pems.1)

sapply(my.pems, function(x) 
                    summaryReport(velocity, local.time, data = x))


#                        [,1]       [,2]      
# distance.travelled.km  6.186056   6.186056  
# time.total.s           1000       1000      
# avg.speed.km.h         22.2698    22.2698   
# avg.running.speed.km.h 28.78538   28.78538  
# time.idle.s            40         40        
# time.idle.pc           4          4         
# avg.accel.m.s.s        0.7921279  0.7921279 
# time.accel.s           271        271       
# time.accel.pc          27.1       27.1      
# avg.decel.m.s.s        -0.9039449 -0.9039449
# time.decel.s           238        238       
# time.decel.pc          23.8       23.8  







