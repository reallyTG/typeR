library(mpcmp)


### Name: glm.cmp
### Title: Fit a Mean Parametrized Conway-Maxwell-Poisson Generalized
###   Linear Model
### Aliases: glm.cmp

### ** Examples

### Huang (2017) Page 368--370: Overdispersed Attendance data
## No test: 
data(attendance)
M.attendance <- glm.cmp(daysabs~ gender+math+prog, data=attendance)
M.attendance
summary(M.attendance)
## End(No test)

### Huang (2017) Page 371--372: Underdispersed Takeover Bids data
data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
    M.bids
summary(M.bids)

### Huang (2017) Page 373--375: Underdispersed Cotton bolls data
### Model fitting for predictor V 
## No test: 
data(cottonbolls)
M.bolls <- glm.cmp(nc~ 1+stages:def+stages:def2, data= cottonbolls)
M.bolls
summary(M.bolls)
## End(No test)



