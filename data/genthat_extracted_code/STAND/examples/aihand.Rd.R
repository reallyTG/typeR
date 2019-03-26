library(STAND)


### Name: aihand
### Title: Industrial Hygiene Air Monitoring Data
### Aliases: aihand
### Keywords: datasets

### ** Examples

data(aihand) # Table V.2 Mulhausen and Damiano (1998)

# calculate summary statistics for non-detect data
ndt <- IH.summary(aihand,L=5)
x <- aihand$x ;  det <- rep(1,length(x))
aiha<-data.frame(x,det) #  complete data
# calculate summary statistics for complete data
cdt <- IH.summary(aiha,L=5)
# output results in a table
round(cbind(cdt,ndt),3)

#  rm(aiha,aihand,cdt,det,ndt)
# add results for exact method for complete data case
# for Xp and the exceedance fraction



