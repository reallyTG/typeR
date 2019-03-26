library(ConnMatTools)


### Name: localRetention
### Title: Local retention of a connectivity matrix
### Aliases: localRetention

### ** Examples

library(ConnMatTools)
data(chile.loco)

sr <- selfRecruitment(chile.loco)
lr <- localRetention(chile.loco)
rlr <- relativeLocalRetention(chile.loco)



