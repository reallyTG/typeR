library(bibliometrix)


### Name: sourceGrowth
### Title: Number of documents published annually per Top Sources
### Aliases: sourceGrowth

### ** Examples


data(scientometrics)
topSO=sourceGrowth(scientometrics, top=1, cdf=TRUE)
topSO

# Plotting results
# 
# library(reshape2)
# library(ggplot2)
# DF=melt(topSO, id='Year')
# ggplot(DF,aes(Year,value, group=variable, color=variable))+geom_line()




