library(eRm)


### Name: llra.datprep
### Title: Prepare Data Set for LLRA Analysis
### Aliases: llra.datprep

### ** Examples

    # example 3 items, 3 timepoints, n=10, 2x2 treatments
    dat<-sim.rasch(10,9)
    tr1<-sample(c("a","b"),10,r=TRUE)
    tr2<-sample(c("x","y"),10,r=TRUE)

    # one treatment
    res<-llra.datprep(dat,mpoints=3,groups=tr1)
    res<-llra.datprep(dat,mpoints=3,groups=tr1,baseline="b") 

    # two treatments
    res<-llra.datprep(dat,mpoints=3,groups=cbind(tr1,tr2))
    res<-llra.datprep(dat,mpoints=3,groups=cbind(tr1,tr2),baseline=c("b","x")) 

    # two treatments - data frame
    tr.dfr<-data.frame(tr1, tr2)
    res<-llra.datprep(dat,mpoints=3,groups=tr.dfr) 



