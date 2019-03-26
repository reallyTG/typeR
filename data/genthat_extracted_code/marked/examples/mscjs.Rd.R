library(marked)


### Name: mscjs
### Title: Fitting function for Multistate CJS models
### Aliases: mscjs

### ** Examples

## No test: 
# this example requires admb
# The same example is in the RMark package and it is included here to
# illustrate the differences in the handling of mlogit parameters between RMark 
# and marked.  The MARK software handles parameters like Psi which must sum to 1
# by excluding one of the cells that is used as a reference cell and is computed by
# subtracting the other cell values from 1 so the total sums to 1.  This is often
# handled with an mlogit parameter in which the cell values are exp(beta) and the
# reference cell is set to 1 and the values are divided by the sum across the cells
# so the resulting values are probabilities that sum to 1. In marked, instead of removing
# one of the cells, all are included and the user must select which should be the
# reference cell by setting the value fix=1 for that cell and others are NA so they are
# estimated. For transition parameters like Psi, the default design data is setup so 
# that the probability of remaining in the cell (stratum=tostratum) is the reference cell
# and fix set to 1.  Thus, this means 2 changes are needed to the script in RMark.
# The first is to remove the statement skagit.ddl$Psi$fix=NA because that over-rides
# the default fix values.  The other is to add
# skagit.ddl$Psi$fix[skagit.ddl$Psi$stratum=="B"&skagit.ddl$Psi$tostratum=="B"&
#  skagit.ddl$Psi$time==5]=0
# to change the value from 1 to 0 which forces movement from B to A in the interval 5 to 6. If
# this is not done then Psi B to B=Psi B to A=0.5 because each is 1 and when they are normalized
# they are divided by the sum which is 2 (1/2).
if(class(try(setup_admb("mscjs")))!="try-error")
{
data(skagit)
skagit.processed=process.data(skagit,model="Mscjs",groups=c("tag"),strata.labels=c("A","B"))
skagit.ddl=make.design.data(skagit.processed)
#
# p
#
# Can't be seen at 5A or 2B,6B (the latter 2 don't exist)
skagit.ddl$p$fix=ifelse((skagit.ddl$p$stratum=="A"&skagit.ddl$p$time==5) | 
(skagit.ddl$p$stratum=="B"&skagit.ddl$p$time%in%c(2,6)),0,NA)
# Estimated externally from current data to allow estimation of survival at last interval
skagit.ddl$p$fix[skagit.ddl$p$tag=="v7"&skagit.ddl$p$time==6&skagit.ddl$p$stratum=="A"]=0.687
skagit.ddl$p$fix[skagit.ddl$p$tag=="v9"&skagit.ddl$p$time==6&skagit.ddl$p$stratum=="A"]=0.975
#
# Psi
#
# only 3 possible transitions are A to B at time interval 2 to 3 and 
# for time interval 3 to 4 from A to B and from B to A
# rest are fixed values
############ change for RMark to marked; remove next line
#skagit.ddl$Psi$fix=NA
# stay in A for intervals 1-2, 4-5 and 5-6
skagit.ddl$Psi$fix[skagit.ddl$Psi$stratum=="A"&
 skagit.ddl$Psi$tostratum=="B"&skagit.ddl$Psi$time%in%c(1,4,5)]=0
# stay in B for interval 4-5
skagit.ddl$Psi$fix[skagit.ddl$Psi$stratum=="B"&skagit.ddl$Psi$tostratum=="A"
 &skagit.ddl$Psi$time==4]=0
# leave B to go to A for interval 5-6
skagit.ddl$Psi$fix[skagit.ddl$Psi$stratum=="B"&skagit.ddl$Psi$tostratum=="A"&
skagit.ddl$Psi$time==5]=1
############ change for RMark to marked; add next line to set B to B to 0 otherwise it has
############ been set to 1 by default which would make psi B to B = psi B to A = 0.5
skagit.ddl$Psi$fix[skagit.ddl$Psi$stratum=="B"&skagit.ddl$Psi$tostratum=="B"&
skagit.ddl$Psi$time==5]=0
# "stay" in B for interval 1-2 and 2-3 because none will be in B
skagit.ddl$Psi$fix[skagit.ddl$Psi$stratum=="B"&skagit.ddl$Psi$tostratum=="A"&
skagit.ddl$Psi$time%in%1:2]=0
# 
# S
#
# None in B, so fixing S to 1
skagit.ddl$S$fix=ifelse(skagit.ddl$S$stratum=="B"&skagit.ddl$S$time%in%c(1,2),1,NA)
skagit.ddl$S$fix[skagit.ddl$S$stratum=="A"&skagit.ddl$S$time==4]=1
# fit model
p.timexstratum.tag=list(formula=~time:stratum+tag,remove.intercept=TRUE)
Psi.sxtime=list(formula=~-1+stratum:time)
S.stratumxtime=list(formula=~-1+stratum:time)
#
mod1=crm(skagit.processed,skagit.ddl,
model.parameters=list(S=S.stratumxtime,p= p.timexstratum.tag,Psi=Psi.sxtime),hessian=TRUE)
if(class(mod1)[1]!="try-error") mod1
} 
## End(No test)



