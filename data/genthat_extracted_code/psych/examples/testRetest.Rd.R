library(psych)


### Name: testRetest
### Title: Find various test-retest statistics, including test, person and
###   item reliability
### Aliases: testRetest testReliability
### Keywords: multivariate models

### ** Examples

#lmer set to FALSE for speed.
#set lmer to TRUE to get variance components
sai.xray <- subset(sai,sai$study=="XRAY")
#The case where the two measures are identified by time
#automatically reverses items but throws a warning
stability <- testRetest(sai.xray[-c(1,3)],lmer=FALSE) 
stability  #show the results
#get a second data set
sai.xray1 <- subset(sai.xray,sai.xray$time==1)
msq.xray <- subset(msqR,(msqR$study=="XRAY") & (msqR$time==1))
 
select <- colnames(sai.xray1)[colnames(sai.xray1 ) %in% colnames(msqR)]
select <-select[-c(1:3)]  #get rid of the id information
#The case where the two times are in the form x, y

dependability <-  testRetest(sai.xray1,msq.xray,keys=select[-c(1:3)],lmer=FALSE)
dependability  #show the results





