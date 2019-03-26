library(dataMaid)


### Name: isCPR
### Title: Check if a variable consists of Danish CPR numbers
### Aliases: isCPR

### ** Examples

CPRs <-  sapply(c("01011988", "02011987", "04052006", "01021990", "01021991",
                  "01021993", "01021994", "01021995", "01021996", "01021997",
                  "01021970", "01021971", "01021972", "01021973", "01021974"), dataMaid:::makeCPR)
nonCPRs <- c(1:10)
mixedCPRs <- c(CPRs, nonCPRs)

#identify problem
isCPR(CPRs)

#no problem as there are no CPRs
isCPR(nonCPRs)

#no problem because not ALL values are CPRs
isCPR(mixedCPRs)




