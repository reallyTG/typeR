library(cancerTiming)


### Name: eventTiming
### Title: Estimate the time of events in tumor data
### Aliases: eventTiming

### ** Examples

data(mutData)
ACNLOH<-matrix(c(1,3,1,0),ncol=2,nrow=2,byrow=TRUE)
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7)
onlyMuts$t_depth<-onlyMuts$t_ref_count+onlyMuts$t_alt_count
x<-eventTiming(x=onlyMuts$t_alt_count,m=onlyMuts$t_depth,
    history=ACNLOH,totalCopy=2,type="CNLOH",normCont=0.22)
x$pi #estimate of time of stages
x$q #estimate of the multinomial (likelihood of each of the alleles)
x$call$alleleSet #possible set of alleles after 
                #adjusting for normal contamination



