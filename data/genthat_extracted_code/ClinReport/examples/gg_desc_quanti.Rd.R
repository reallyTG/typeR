library(ClinReport)


### Name: gg_desc_quanti
### Title: Creates a ggplot object corresponding to a quantitative desc
###   object
### Aliases: gg_desc_quanti

### ** Examples

 ## Don't show: 
data(data)

desc=report.quanti(data=data,y="y_numeric",x1="GROUP",
	x2="TIMEPOINT")

ClinReport:::gg_desc_quanti(desc,title="My title",ylab="Hello dear",
	ylim=c(-2,8),xlab="Great!",legend.label="Treatment group")

# With SD

ClinReport:::gg_desc_quanti(desc,title="My title",ylab="Hello dear",
	ylim=c(-2,8),xlab="Great!",legend.label="Treatment group",add.sd=TRUE)


desc2=report.quanti(data=data,y="y_numeric",x1="GROUP")

desc3=report.quanti(data=data,y="y_numeric")



ClinReport:::gg_desc_quanti(desc2,title="My title",ylab="Hello dear")


ClinReport:::gg_desc_quanti(desc3,title="My title",ylab="Hello dear")
## End(Don't show)




