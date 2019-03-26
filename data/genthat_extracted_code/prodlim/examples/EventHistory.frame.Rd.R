library(prodlim)


### Name: EventHistory.frame
### Title: Event history frame
### Aliases: EventHistory.frame

### ** Examples


## Here are some data with an event time and no competing risks
## and two covariates X1 and X2.
## Suppose we want to declare that variable X1 is treated differently
## than variable X2. For example, X1 could be a cluster variable, or
## X1 should have a proportional effect on the outcome.
dsurv <- data.frame(time=1:7,
                    status=c(0,1,1,0,0,0,1),
                    X2=c(2.24,3.22,9.59,4.4,3.54,6.81,5.05),
                    X3=c(1,1,1,1,0,0,1),
                    X4=c(44.69,37.41,68.54,38.85,35.9,27.02,41.84),
                    X1=factor(c("a","b","a","c","c","a","b"),
                        levels=c("c","a","b")))
## We pass a formula and the data
e <- EventHistory.frame(Hist(time,status)~prop(X1)+X2+cluster(X3)+X4,
                        data=dsurv,
                        specials=c("prop","cluster"),
                        stripSpecials=c("prop","cluster"))
names(e)
## The first element is the event.history which is result of the left hand
## side of the formula:
e$event.history
## same as
with(dsurv,Hist(time,status))
## to see the structure do 
colnames(e$event.history)
unclass(e$event.history)
## in case of competing risks there will be an additional column called event,
## see help(Hist) for more details

## The other elements are the design, i.e., model.matrix for the non-special covariates
e$design
## and a data.frame for the special covariates
e$prop
## The special covariates can be returned as a model.matrix
e2 <- EventHistory.frame(Hist(time,status)~prop(X1)+X2+cluster(X3)+X4,
                         data=dsurv,
                         specials=c("prop","cluster"),
                         stripSpecials=c("prop","cluster"),
                         specialsDesign=TRUE)
e2$prop
## and the non-special covariates can be returned as a data.frame
e3 <- EventHistory.frame(Hist(time,status)~prop(X1)+X2+cluster(X3)+X4,
                         data=dsurv,
                         specials=c("prop","cluster"),
                         stripSpecials=c("prop","cluster"),
                         specialsDesign=TRUE,
                         unspecialsDesign=FALSE)
e3$design

## the general idea is that the function is used to parse the combination of
## formula and data inside another function. Here is an example with
## competing risks
SampleRegression <- function(formula,data=parent.frame()){
    thecall <- match.call()
    ehf <- EventHistory.frame(formula=formula,
                              data=data,
                              stripSpecials=c("prop","cluster","timevar"),
                              specials=c("prop","timevar","cluster"))
    time <- ehf$event.history[,"time"]
    status <- ehf$event.history[,"status"]
    ## event as a factor
    if (attr(ehf$event.history,"model")=="competing.risks"){
        event <- ehf$event.history[,"event"]
        Event <- getEvent(ehf$event.history)
        list(response=data.frame(time,status,event,Event),X=ehf[-1])
    }
    else{ # no competing risks
        list(response=data.frame(time,status),X=ehf[-1])
    }
}
dsurv$outcome <- c("cause1","0","cause2","cause1","cause2","cause2","0")
SampleRegression(Hist(time,outcome)~prop(X1)+X2+cluster(X3)+X4,dsurv)

## let's test if the parsing works
form1 <- Hist(time,outcome!="0")~prop(X1)+X2+cluster(X3)+X4
form2 <- Hist(time,outcome)~prop(X1)+cluster(X3)+X4
ff <- list(form1,form2)
lapply(ff,function(f){SampleRegression(f,dsurv)})


## here is what the riskRegression package uses to
## distinguish between covariates with
## time-proportional effects and covariates with
## time-varying effects:
## Not run: 
##D library(riskRegression)
##D data(Melanoma)
##D f <- Hist(time,status)~prop(thick)+strata(sex)+age+prop(ulcer,power=1)+timevar(invasion,test=1)
##D ## here the unspecial terms, i.e., the term age is treated as prop
##D ## also, strata is an alias for timvar
##D 
##D EHF <- prodlim::EventHistory.frame(formula,
##D                                    Melanoma[1:10],
##D                                    specials=c("timevar","strata","prop","const","tp"),
##D                                    stripSpecials=c("timevar","prop"),
##D                                    stripArguments=list("prop"=list("power"=0),
##D                                        "timevar"=list("test"=0)),
##D                                    stripAlias=list("timevar"=c("strata"),
##D                                        "prop"=c("tp","const")),
##D                                    stripUnspecials="prop",
##D                                    specialsDesign=TRUE,
##D                                    dropIntercept=TRUE)       
##D EHF$prop
##D EHF$timevar
## End(Not run)



