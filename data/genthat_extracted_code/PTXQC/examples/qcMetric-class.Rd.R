library(PTXQC)


### Name: qcMetric-class
### Title: Class which can compute plots (usually for a single metric).
### Aliases: qcMetric-class qcMetric

### ** Examples


require(ggplot2)
dd = data.frame(x=1:10, y=11:20)
a = qcMetric$new(helpText="small help text", 
                 ## arbitrary arguments, matched during setData()
                 workerFcn=function(.self, data, gtit)
                 {
                   ## usually some code here to produce ggplots
                   pl = lapply(1:2, function(xx) {
                       ggplot(data) +
                         geom_point(aes(x=x*xx,y=y)) +
                         ggtitle(gtit)
                     })
                   return(list(plots = pl))
                 }, 
                 qcCat="LC", 
                 qcName="MS/MS Peak shape", 
                 orderNr = 30)
## test some output
a$setData(dd, "my title")
a$plots  ## the raw plots
a$getPlots(TRUE) ## same as above
a$getPlots(FALSE) ## plots without title
a$getTitles()  ## get the titles of the all plots
a$helpText
a$qcName






