library(ConnMatTools)


### Name: relativeLocalRetention
### Title: Relative local retention of a connectivity matrix
### Aliases: relativeLocalRetention

### ** Examples

library(ConnMatTools)
data(chile.loco)

sr <- selfRecruitment(chile.loco)
lr <- localRetention(chile.loco)
rlr <- relativeLocalRetention(chile.loco)



