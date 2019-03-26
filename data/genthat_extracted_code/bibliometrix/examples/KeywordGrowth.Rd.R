library(bibliometrix)


### Name: KeywordGrowth
### Title: Yearly occurrences of top keywords/terms
### Aliases: KeywordGrowth

### ** Examples


data(scientometrics)
topKW=KeywordGrowth(scientometrics, Tag = "ID", sep = ";", top=5, cdf=TRUE)
topKW

# Plotting results
# 
# library(reshape2)
# library(ggplot2)
# DF=melt(topKW, id='Year')
# ggplot(DF,aes(Year,value, group=variable, color=variable))+geom_line()




