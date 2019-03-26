library(survey)


### Name: twophase
### Title: Two-phase designs
### Aliases: twophase twophasevar twophase2var [.twophase subset.twophase
###   print.twophase summary.twophase print.summary.twophase
###   model.frame.twophase na.fail.twophase na.omit.twophase
###   na.exclude.twophase svyrecvar.phase1 multistage.phase1
###   onestage.phase1 onestrat.phase1
### Keywords: survey

### ** Examples

 ## two-phase simple random sampling.
 data(pbc, package="survival")
 pbc$randomized<-with(pbc, !is.na(trt) & trt>0)
 pbc$id<-1:nrow(pbc)
 d2pbc<-twophase(id=list(~id,~id), data=pbc, subset=~randomized)
 svymean(~bili, d2pbc)

 ## two-stage sampling as two-phase
 data(mu284)
 ii<-with(mu284, c(1:15, rep(1:5,n2[1:5]-3)))
 mu284.1<-mu284[ii,]
 mu284.1$id<-1:nrow(mu284.1)
 mu284.1$sub<-rep(c(TRUE,FALSE),c(15,34-15))
 dmu284<-svydesign(id=~id1+id2,fpc=~n1+n2, data=mu284)
 ## first phase cluster sample, second phase stratified within cluster
 d2mu284<-twophase(id=list(~id1,~id),strata=list(NULL,~id1),
                     fpc=list(~n1,NULL),data=mu284.1,subset=~sub)
 svytotal(~y1, dmu284)
 svytotal(~y1, d2mu284)
 svymean(~y1, dmu284)
 svymean(~y1, d2mu284)

 ## case-cohort design: this example requires R 2.2.0 or later
 library("survival")
 data(nwtco)

 ## stratified on case status
 dcchs<-twophase(id=list(~seqno,~seqno), strata=list(NULL,~rel),
         subset=~I(in.subcohort | rel), data=nwtco)
 svycoxph(Surv(edrel,rel)~factor(stage)+factor(histol)+I(age/12), design=dcchs)

 ## Using survival::cch 
 subcoh <- nwtco$in.subcohort
 selccoh <- with(nwtco, rel==1|subcoh==1)
 ccoh.data <- nwtco[selccoh,]
 ccoh.data$subcohort <- subcoh[selccoh]
 cch(Surv(edrel, rel) ~ factor(stage) + factor(histol) + I(age/12), data =ccoh.data,
        subcoh = ~subcohort, id=~seqno, cohort.size=4028, method="LinYing")


 ## two-phase case-control
 ## Similar to Breslow & Chatterjee, Applied Statistics (1999) but with
 ## a slightly different version of the data set
 
 nwtco$incc2<-as.logical(with(nwtco, ifelse(rel | instit==2,1,rbinom(nrow(nwtco),1,.1))))
 dccs2<-twophase(id=list(~seqno,~seqno),strata=list(NULL,~interaction(rel,instit)),
    data=nwtco, subset=~incc2)
 dccs8<-twophase(id=list(~seqno,~seqno),strata=list(NULL,~interaction(rel,stage,instit)),
    data=nwtco, subset=~incc2)
 summary(glm(rel~factor(stage)*factor(histol),data=nwtco,family=binomial()))
 summary(svyglm(rel~factor(stage)*factor(histol),design=dccs2,family=quasibinomial()))
 summary(svyglm(rel~factor(stage)*factor(histol),design=dccs8,family=quasibinomial()))

 ## Stratification on stage is really post-stratification, so we should use calibrate()
 gccs8<-calibrate(dccs2, phase=2, formula=~interaction(rel,stage,instit))
 summary(svyglm(rel~factor(stage)*factor(histol),design=gccs8,family=quasibinomial()))

 ## For this saturated model calibration is equivalent to estimating weights.
 pccs8<-calibrate(dccs2, phase=2,formula=~interaction(rel,stage,instit), calfun="rrz")
 summary(svyglm(rel~factor(stage)*factor(histol),design=pccs8,family=quasibinomial()))

 ## Since sampling is SRS at phase 1 and stratified RS at phase 2, we
 ## can use method="simple" to save memory.
 dccs8_simple<-twophase(id=list(~seqno,~seqno),strata=list(NULL,~interaction(rel,stage,instit)),
    data=nwtco, subset=~incc2,method="simple")
 summary(svyglm(rel~factor(stage)*factor(histol),design=dccs8_simple,family=quasibinomial()))






