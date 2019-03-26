library(intubate)


### Name: survey
### Title: Interfaces for survey package for data science pipelines.
### Aliases: ntbt_svyby ntbt_svycoxph ntbt_svydesign ntbt_svyglm
###   ntbt_svymean ntbt_svyquantile ntbt_svyratio ntbt_svytotal
###   ntbt_twophase
### Keywords: intubate magrittr survey svyby svycoxph svydesign svyglm
###   svymean svyquantile svyratio svytotal twophase

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(survey)
##D 
##D ## svydesign
##D data(api)
##D ## Original function to interface
##D # stratified sample
##D dstrat <- svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
##D # one-stage cluster sample
##D dclus1 <- svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
##D # two-stage cluster sample: weights computed from population sizes.
##D dclus2 <- svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)
##D 
##D ## The interface puts data as first parameter
##D # stratified sample
##D dstrat <- ntbt_svydesign(data=apistrat, id=~1,strata=~stype, weights=~pw, fpc=~fpc)
##D # one-stage cluster sample
##D dclus1 <- ntbt_svydesign(data=apiclus1, id=~dnum, weights=~pw, fpc=~fpc)
##D # two-stage cluster sample: weights computed from population sizes.
##D dclus2 <- ntbt_svydesign(data=apiclus2, id=~dnum+snum, fpc=~fpc1+fpc2)
##D 
##D ## so it can be used easily in a pipeline.
##D dstrat <- apistrat %>%
##D   ntbt_svydesign(id=~1,strata=~stype, weights=~pw, fpc=~fpc)
##D # one-stage cluster sample
##D dclus1 <- apiclus1 %>%
##D   ntbt_svydesign(id=~dnum, weights=~pw, fpc=~fpc)
##D # two-stage cluster sample: weights computed from population sizes.
##D dclus2 <- apiclus2 %>%
##D   ntbt_svydesign(id=~dnum+snum, fpc=~fpc1+fpc2)
##D 
##D ## twofase
##D ## two-phase simple random sampling.
##D data(pbc, package="survival")
##D pbc$randomized <- with(pbc, !is.na(trt) & trt>0)
##D pbc$id<-1:nrow(pbc)
##D 
##D ## Original function to interface
##D d2pbc <- twophase(id=list(~id,~id), data=pbc, subset=~randomized)
##D svymean(~bili, d2pbc)
##D 
##D ## The interface puts data as first parameter
##D d2pbc <- ntbt_twophase(data=pbc, id=list(~id,~id), subset=~randomized)
##D svymean(~bili, d2pbc)
##D 
##D ## so it can be used easily in a pipeline.
##D d2pbc <- pbc %>%
##D   ntbt_twophase(id=list(~id,~id), subset=~randomized)
##D svymean(~bili, d2pbc)
##D 
##D 
##D ## ntbt_svyby, ntbt_svyglm, ntbt_svymean,
##D ## ntbt_svyquantile, ntbt_svyratio, ntbt_svytotal
##D 
##D ## From vignette of survey
##D vars<-names(apiclus1)[c(12:13,16:23,27:37)] 
##D 
##D ## original
##D dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)
##D summary(dclus1)
##D ## direct call
##D dclus1 <- apiclus1 %>%
##D   ntbt(svydesign, id = ~dnum, weights = ~pw, fpc = ~fpc)
##D summary(dclus1)
##D ## interface
##D dclus1 <- apiclus1 %>%
##D   ntbt_svydesign(id = ~dnum, weights = ~pw, fpc = ~fpc)
##D summary(dclus1)
##D 
##D ## original
##D svymean(~api00, dclus1)
##D ## direct call
##D dclus1 %>%
##D   ntbt(svymean, x=~api00)
##D ## interface
##D dclus1 %>%
##D   ntbt_svymean(x=~api00)
##D 
##D ## original
##D svyquantile(~api00, dclus1, quantile=c(0.25,0.5,0.75), ci=TRUE)
##D ## direct call
##D dclus1 %>%
##D   ntbt(svyquantile, ~api00, quantile=c(0.25,0.5,0.75), ci=TRUE)
##D ## interface
##D dclus1 %>%
##D   ntbt(svyquantile, ~api00, quantile=c(0.25,0.5,0.75), ci=TRUE)
##D 
##D ## original
##D svytotal(~stype, dclus1)
##D svytotal(~enroll, dclus1)
##D ## direct call
##D dclus1 %>%
##D   ntbt(svytotal, ~stype)
##D dclus1 %>%
##D   ntbt(svytotal,~enroll)
##D ## interface
##D dclus1 %>%
##D   ntbt(svytotal, ~stype)
##D dclus1 %>%
##D   ntbt(svytotal,~enroll)
##D 
##D ## original
##D svyratio(~api.stu, ~enroll, dclus1)
##D svyratio(~api.stu, ~enroll, design=subset(dclus1, stype=="H"))
##D ## direct call
##D dclus1 %>%
##D   ntbt(svyratio, ~api.stu, ~enroll)
##D dclus1 %>%
##D   ntbt(svyratio, ~api.stu, ~enroll, design=subset("#", stype=="H"))
##D ## interface
##D dclus1 %>%
##D   ntbt_svyratio(~api.stu, ~enroll)
##D dclus1 %>%
##D   ntbt_svyratio(~api.stu, ~enroll, design=subset("#", stype=="H"))
##D 
##D ## original
##D svymean(make.formula(vars),dclus1,na.rm=TRUE)
##D ## direct call
##D dclus1 %>%
##D   ntbt(svymean, make.formula(vars), na.rm=TRUE)
##D ## interface
##D dclus1 %>%
##D   ntbt_svymean(make.formula(vars), na.rm=TRUE)
##D 
##D ## original
##D svyby(~ell+meals, ~stype, design=dclus1, svymean)
##D ## direct call
##D dclus1 %>%
##D   ntbt(svyby, ~ell+meals, ~stype, svymean)
##D ## interface
##D dclus1 %>%
##D   ntbt_svyby(~ell+meals, ~stype, svymean)
##D 
##D ## original
##D regmodel <- svyglm(api00~ell+meals, design=dclus1)
##D summary(regmodel)
##D logitmodel <- svyglm(I(sch.wide=="Yes")~ell+meals, design=dclus1,
##D                      family=quasibinomial()) 
##D summary(logitmodel)
##D ## direct call
##D dclus1 %>%
##D   ntbt(svyglm, api00~ell+meals) %>%
##D   summary()
##D dclus1 %>%
##D   ntbt(svyglm, I(sch.wide=="Yes")~ell+meals, family=quasibinomial()) %>%
##D   summary()
##D ## interface
##D dclus1 %>%
##D   ntbt_svyglm(api00~ell+meals) %>%
##D   summary()
##D dclus1 %>%
##D   ntbt_svyglm(I(sch.wide=="Yes")~ell+meals, family=quasibinomial()) %>%
##D   summary()
##D 
##D ## ntbt_svycoxph
##D ## stratified on case status
##D data(nwtco)
##D ## original
##D dcchs <- twophase(id=list(~seqno,~seqno), strata=list(NULL,~rel),
##D                   subset=~I(in.subcohort | rel), data=nwtco)
##D svycoxph(Surv(edrel,rel)~factor(stage)+factor(histol)+I(age/12), design=dcchs)
##D ## direct call
##D nwtco %>%
##D   ntbt(twophase,id = list(~seqno,~seqno), strata = list(NULL,~rel),
##D        subset = ~I(in.subcohort | rel)) %>%
##D   ntbt(svycoxph, Surv(edrel,rel)~factor(stage)+factor(histol)+I(age/12))
##D ## interface
##D nwtco %>%
##D   ntbt_twophase(id = list(~seqno,~seqno), strata = list(NULL,~rel),
##D        subset = ~I(in.subcohort | rel)) %>%
##D   ntbt_svycoxph(Surv(edrel,rel)~factor(stage)+factor(histol)+I(age/12))
##D 
##D ## Involved example using `intubOrders`, transforming the code in:
##D 
##D ## https://cran.r-project.org/web/packages/survey/vignettes/survey.pdf
##D 
##D data(api)
##D 
##D ## First, the original code from the vignette
##D vars<-names(apiclus1)[c(12:13,16:23,27:37)] 
##D 
##D dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)
##D summary(dclus1)
##D svymean(~api00, dclus1)
##D svyquantile(~api00, dclus1, quantile=c(0.25,0.5,0.75), ci=TRUE)
##D svytotal(~stype, dclus1)
##D svytotal(~enroll, dclus1)
##D svyratio(~api.stu,~enroll, dclus1)
##D svyratio(~api.stu, ~enroll, design=subset(dclus1, stype=="H"))
##D svymean(make.formula(vars),dclus1,na.rm=TRUE)
##D svyby(~ell+meals, ~stype, design=dclus1, svymean)
##D regmodel <- svyglm(api00~ell+meals,design=dclus1)
##D logitmodel <- svyglm(I(sch.wide=="Yes")~ell+meals, design=dclus1, family=quasibinomial()) 
##D summary(regmodel)
##D summary(logitmodel)
##D 
##D ## Now using intubOrders and ntbt.
##D 
##D ## Strategy 1: long pipeline, light use of intubOrders.
##D 
##D apiclus1 %>%
##D   ntbt(svydesign, id = ~dnum, weights = ~ pw, fpc = ~ fpc, "<|| summary >") %>%
##D   ntbt(svymean, ~ api00, "<|f| print >") %>%
##D   ntbt(svyquantile, ~ api00, quantile = c(0.25,0.5,0.75), ci = TRUE, "<|f| print >") %>%
##D   ntbt(svytotal, ~ stype, "<|f| print >") %>%
##D   ntbt(svytotal, ~ enroll, "<|f| print >") %>%
##D   ntbt(svyratio, ~ api.stu, ~ enroll, "<|f| print >") %>%
##D   ntbt(svyratio, ~ api.stu, ~ enroll, design = subset("#", stype == "H"), "<|f| print >") %>%
##D   ntbt(svymean, make.formula(vars), na.rm = TRUE, "<|f| print >") %>%
##D   ntbt(svyby, ~ ell + meals, ~ stype, svymean, "<|f| print >") %>%
##D   ntbt(svyglm, api00 ~ ell + meals, "<|f| summary >") %>%
##D   ntbt(svyglm, I(sch.wide == "Yes") ~ ell + meals, family = quasibinomial(), "<|f| summary >") %>%
##D   summary() ## We have forwarded the result from svydesign (line 2),
##D             ## so we could still continue using it downstream.
##D 
##D ## Strategy 2: short pipeline, heavy use of *one* intubOrder.
##D apiclus1 %>%
##D   ntbt(svydesign, id = ~dnum, weights = ~pw, fpc = ~fpc,
##D        "<|f|
##D          summary;
##D          svymean(~api00, #);
##D          svyquantile(~api00, #, quantile = c(0.25, 0.5, 0.75), ci = TRUE);
##D          svytotal(~stype, #);
##D          svytotal(~enroll, #);
##D          svyratio(~api.stu,~enroll, #);
##D          svyratio(~api.stu, ~enroll, design = subset(#, stype == 'H'));
##D          svymean(make.formula(vars), #, na.rm = TRUE);
##D          svyby(~ell+meals, ~stype, #, svymean);
##D          summary(svyglm(api00~ell+meals, #));
##D          summary(svyglm(I(sch.wide == 'Yes')~ell+meals, #, family = quasibinomial())) >") %>%
##D   head()  ## We have forwarded the original dataset,
##D           ## so we could continue using it downstream.
## End(Not run)



