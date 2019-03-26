library(survey)


### Name: svycoplot
### Title: Conditioning plots of survey data
### Aliases: svycoplot
### Keywords: survey hplot

### ** Examples

data(api)
dclus2<-svydesign(id=~dnum+snum,  weights=~pw,
                    data=apiclus2, fpc=~fpc1+fpc2)

svycoplot(api00~api99|sch.wide*comp.imp, design=dclus2, style="hexbin")
svycoplot(api00~api99|sch.wide*comp.imp, design=dclus2, style="hexbin", hexscale="absolute")

svycoplot(api00~api99|sch.wide, design=dclus2, style="trans")

svycoplot(api00~meals|stype,design=dclus2,
  style="transparent",
  basecol=function(d) c("darkred","purple","forestgreen")[as.numeric(d$stype)],
  alpha=c(0,1)) 



