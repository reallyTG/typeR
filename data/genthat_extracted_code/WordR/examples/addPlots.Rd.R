library(WordR)


### Name: addPlots
### Title: Read Word document with bookmarks and create other Word document
###   with rendered plots in place.
### Aliases: addPlots

### ** Examples

library(ggplot2)
Plots<-list(plot1=function()plot(hp~wt,data=mtcars,col=cyl),
 plot2=function()print(ggplot(mtcars,aes(x=wt,y=hp,col=as.factor(cyl)))+geom_point()))
addPlots(
 paste(examplePath(),'templates/templatePlots.docx',sep = ''),
 paste(tempdir(),'/resultPlots.docx',sep = ''),
 Plots,height=4)




