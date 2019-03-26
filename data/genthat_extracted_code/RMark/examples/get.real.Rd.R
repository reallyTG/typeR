library(RMark)


### Name: get.real
### Title: Extract or compute sets of real parameters
### Aliases: get.real
### Keywords: utility

### ** Examples


data(example.data)
pregion=list(formula=~region)
PhiAge=list(formula=~Age)
mod=mark(example.data,model.parameters=list(p=pregion,Phi=PhiAge),
 groups=c("sex","age","region"),age.var=2,initial.ages=c(0,1,2),threads=1)
# extract list of Phi parameter estimates for all groups in PIM format 
Phi.estimates=get.real(mod,"Phi")  
# print out parameter estimates in triangular PIM format
for(i in 1:length(Phi.estimates))  
{
  cat(names(Phi.estimates)[i],"\n")
  print(Phi.estimates[[i]]$pim,na.print="")
}
require(plotrix)
#extract parameter estimates of capture probability p with se and conf intervals
p.table=get.real(mod,"p",se=TRUE) 
print(p.table[p.table$region==1,])  # print values from region 1
estimates=by(p.table$estimate,p.table$region,mean)
lcl=by(p.table$lcl,p.table$region,mean)
ucl=by(p.table$ucl,p.table$region,mean)
plotCI(c(1:4),estimates,ucl-estimates,estimates-lcl,xlab="Region",
         ylab="Capture probability",
		ylim=c(.5,1),main="Capture probability estimates by region")





