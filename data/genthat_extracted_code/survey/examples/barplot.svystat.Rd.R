library(survey)


### Name: barplot.svystat
### Title: Barplots and Dotplots
### Aliases: barplot.svystat barplot.svrepstat barplot.svyby dotchart
###   dotchart.svystat dotchart.svrepstat dotchart.svyby
### Keywords: survey hplot

### ** Examples


data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)

a<-svymean(~stype, dclus1)
barplot(a)
barplot(a, names.arg=c("Elementary","High","Middle"), col="purple", 
  main="Proportions of school level")

b<-svyby(~enroll+api.stu, ~stype, dclus1, svymean)
barplot(b,beside=TRUE,legend=TRUE)
dotchart(b)




