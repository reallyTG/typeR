library(mbbefd)


### Name: asiacomrisk
### Title: Large commercial risks in Asia-Pacific
### Aliases: asiacomrisk
### Keywords: datasets

### ** Examples


# (1) load of data
#
data(asiacomrisk)
dim(asiacomrisk)

# (2) basic boxplots
#

asiacomrisk
boxplot(DR ~ Usage, data=asiacomrisk)
boxplot(DR ~ SubUsage, data=asiacomrisk)
boxplot(DR ~ Period, data=asiacomrisk)
boxplot(DR ~ CountryStatus, data=asiacomrisk)





