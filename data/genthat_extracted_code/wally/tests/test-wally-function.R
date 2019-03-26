
# {{{ load packages
library(survival)
library(testthat)
library(prodlim)
library(riskRegression)
library(wally)
# }}}


# {{{ "Wally for survival weird formula and hanging"
test_that("Wally for survival weird formula and hanging",{
    set.seed(10)
    d <- sampleData(138,outcome="survival")
    setnames(d,c("time","event"),c("truc","toto"))
    f <- coxph(Surv(truc,toto)~X6+X7,data=d,x=TRUE)
    d$pi <- predictRisk(f,times=2,newdata=d)
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,time=2,
                   formula=as.formula(paste("Hist(","truc",",","toto",")~1")),
                   data=d,hanging=TRUE,seed=5987,
                   colbox="red",
                   superuser.hide=FALSE,
                   superuser.choice=NULL,q=13)
    ## model input
    v <- wallyPlot(f,
                   time=2,
                   formula=as.formula(paste("Hist(","truc",",","toto",")~1")),
                   data=d,
                   hanging=TRUE,
                   seed=5987,
                   colbox="red",
                   superuser.hide=FALSE,
                   superuser.choice=NULL,
                   q=13)
    expect_equal(u,v)
})
# }}}

# {{{ "Wally for survival with small sample size"
test_that("Wally for survival with small sample size",{
    set.seed(10)
    d <- sampleData(30,outcome="survival")
    head(d)
    f <- coxph(Surv(time,event)~X1+X7,data=d,x=TRUE)
    d$pi <- predictRisk(f,times=2,newdata=d)
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,time=2,
                   formula=Hist(time,event)~1,
                   data=d,hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,q=13)
})
# }}}

# {{{ "Wally for survival with very small sample size"
test_that("Wally for survival with very small sample size",{
    set.seed(10)
    then <- 7
    myq <- 5
    thetime <- 1
    d <- data.frame(time=jitter(c(rep(0.75,then),
                        rep(1,then),
                        rep(2,then))
                        ),
                    event=rep(c(1,0,1),then),
                    pi= runif(n=3*then,min=0,max=1)
                    )
    d
    # {{{ key descriptive statistics
    quant <- quantile(d$pi,seq(0,1,1/myq))
    PredGroup <- cut(d$pi,breaks =quant, include.lowest=TRUE)
    d$Event1 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==1)
    d$Event2 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==2)
    d$Censored <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==0)
    d$Surv <- as.numeric(d[,"time"]>thetime)
    tabGroup <- rbind(table(d[,c("Event1")],PredGroup)["1",],
                      table(d[,c("Censored")],PredGroup)["1",],
                      table(d[,c("Surv")],PredGroup)["1",])
    rownames(tabGroup) <- c("Event 1","Censored","Alive")
    tabGroup <- cbind(tabGroup,rowSums(tabGroup))
    colnames(tabGroup)[ncol(tabGroup)] <- "All"
    if(length(d$time)!=length(unique(d$time))){
        cat("\n There are ties in event times :\n")
        print(table(d$time))
        cat("\n")
    }
    cat("\n")
    print(tabGroup)
    cat("\n")
    ## d
    # }}}
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=thetime,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=myq)
})
# }}}

# {{{ "Wally for survival with small sample size and many censored event"
test_that("Wally for survival with small sample size and many censored event",{
    set.seed(10)
    then <- 10
    d <- data.frame(time=jitter(c(rep(0.75,then),
                        rep(1,then),
                        rep(2,then))
                        ),
                    event=rep(c(1,0,0),then),
                    pi= runif(n=3*then,min=0,max=1)
                    )
    d
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=2,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   type="risk",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=3)
})
# }}}

# {{{ "Wally for competing risks with small sample"
test_that("Wally for competing risks with small sample",{
    set.seed(10)
    then <- 10
    d <- data.frame(time=jitter(c(rep(0.75,then),
                        rep(1,then),
                        rep(2,then))
                        ),
                    event=rep(c(1,0,2),then),
                    pi= runif(n=3*then,min=0,max=1)
                    )
    d
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=2,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=3)
})
# }}}

# {{{ "Wally for competing risks with small sample V0"
test_that("Wally for competing risks with small sample V0",{
    set.seed(10)
    then <- 10
    d <- data.frame(time=jitter(c(rep(0.75,then),
                        rep(1,then),
                        rep(2,then))
                        ),
                    event=rep(c(1,0,2),then),
                    pi= round(runif(n=3*then,min=0,max=1),1)
                    )
    d
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=2,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=3)
})
# }}}

# {{{ "Wally for competing risks with small sample V1"
test_that("Wally for competing risks with small sample V1",{
    # {{{  generate data
    set.seed(10)
    then <- 10
    thetime <- 2
    myq <- 5   
    d <- data.frame(time=jitter(c(
                        rep(1,2*then),
                        rep(2,2*then))
                        ),    
                    event=rep(c(2,1,0,2),then),
                    pi= round(runif(n=4*then,min=0,max=1),1)
                    )
    # }}}

    # {{{ key descriptive statistics
    quant <- quantile(d$pi,seq(0,1,1/myq))
    PredGroup <- cut(d$pi,breaks =quant, include.lowest=TRUE)
    d$Event1 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==1)
    d$Event2 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==2)
    d$Censored <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==0)
    d$Surv <- as.numeric(d[,"time"]>thetime)
    tabGroup <- rbind(table(d[,c("Event1")],PredGroup)["1",],
                      table(d[,c("Event2")],PredGroup)["1",],
                      table(d[,c("Censored")],PredGroup)["1",],
                      table(d[,c("Surv")],PredGroup)["1",])
    rownames(tabGroup) <- c("Event 1","Event 2","Censored","Alive")
    tabGroup <- cbind(tabGroup,rowSums(tabGroup))
    colnames(tabGroup)[ncol(tabGroup)] <- "All"
    cat("\n")
    print(tabGroup)
    cat("\n")
    ## d
    # }}}
    # {{{ run wally
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=thetime,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=myq)
    # }}}
})
# }}}

# {{{ "Wally for competing risks with small sample V2"
test_that("Wally for competing risks with small sample V2",{
    # {{{  generate data
    set.seed(10)
    then <- 10
    thetime <- 2
    myq <- 5   
    d <- data.frame(time=jitter(c(
                        rep(1,2*then),
                        rep(2,2*then))
                        ),    
                    event=rep(c(2,1,0,2,0,2,0,2),then/2),
                    pi= round(runif(n=4*then,min=0,max=1),1)
                    )
    # }}}
    # {{{ key descriptive statistics
    quant <- quantile(d$pi,seq(0,1,1/myq))
    PredGroup <- cut(d$pi,breaks =quant, include.lowest=TRUE)
    d$Event1 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==1)
    d$Event2 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==2)
    d$Censored <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==0)
    d$Surv <- as.numeric(d[,"time"]>thetime)
    tabGroup <- rbind(table(d[,c("Event1")],PredGroup)["1",],
                      table(d[,c("Event2")],PredGroup)["1",],
                      table(d[,c("Censored")],PredGroup)["1",],
                      table(d[,c("Surv")],PredGroup)["1",])
    rownames(tabGroup) <- c("Event 1","Event 2","Censored","Alive")
    tabGroup <- cbind(tabGroup,rowSums(tabGroup))
    colnames(tabGroup)[ncol(tabGroup)] <- "All"
    cat("\n")
    print(tabGroup)
    cat("\n")
    ## d
    # }}}
    
    # {{{ run wally
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=thetime,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=myq)
    # }}}
})
# }}}

# {{{ "Wally for competing risks with small sample V3"
test_that("Wally for competing risks with small sample V3",{
    # {{{  generate data
    set.seed(10)
    then <- 10
    thetime <- 2
    myq <- 5   
    d <- data.frame(time=jitter(c(
                        rep(1,2*then),
                        rep(2,2*then))
                        ),    
                    event=rep(c(2,1,0,0,0,0,0,0),then/2),
                    pi= round(runif(n=4*then,min=0,max=1),1)
                    )
    # }}}
    # {{{ key descriptive statistics
    quant <- quantile(d$pi,seq(0,1,1/myq))
    PredGroup <- cut(d$pi,breaks =quant, include.lowest=TRUE)
    d$Event1 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==1)
    d$Event2 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==2)
    d$Censored <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==0)
    d$Surv <- as.numeric(d[,"time"]>thetime)
    tabGroup <- rbind(table(d[,c("Event1")],PredGroup)["1",],
                      table(d[,c("Event2")],PredGroup)["1",],
                      table(d[,c("Censored")],PredGroup)["1",],
                      table(d[,c("Surv")],PredGroup)["1",])
    rownames(tabGroup) <- c("Event 1","Event 2","Censored","Alive")
    tabGroup <- cbind(tabGroup,rowSums(tabGroup))
    colnames(tabGroup)[ncol(tabGroup)] <- "All"
    cat("\n")
    print(tabGroup)
    cat("\n")
    ## d
    # }}}
    
    # {{{ run wally
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=thetime,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=myq)
    # }}}
})
# }}}

# {{{ Wally for competing risks with  ties in  times
test_that("Wally for competing risks with  ties in  times",{
    # {{{  generate data
    set.seed(10)
    then <- 10
    thetime <- 2
    myq <- 5   
    d <- data.frame(time=round(runif(n=4*then,min=0,max=3)*4)/4,    
                    event=rep(c(2,1,0,0,0,0,0,0),then/2),
                    pi= round(runif(n=4*then,min=0,max=1),1)
                    )    
    # }}}
    # {{{ key descriptive statistics
    quant <- quantile(d$pi,seq(0,1,1/myq))
    PredGroup <- cut(d$pi,breaks =quant, include.lowest=TRUE)
    d$Event1 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==1)
    d$Event2 <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==2)
    d$Censored <- as.numeric(d[,"time"]<=thetime)*as.numeric(d[,"event"]==0)
    d$Surv <- as.numeric(d[,"time"]>thetime)
    tabGroup <- rbind(table(d[,c("Event1")],PredGroup)["1",],
                      table(d[,c("Event2")],PredGroup)["1",],
                      table(d[,c("Censored")],PredGroup)["1",],
                      table(d[,c("Surv")],PredGroup)["1",])
    rownames(tabGroup) <- c("Event 1","Event 2","Censored","Alive")
    tabGroup <- cbind(tabGroup,rowSums(tabGroup))
    colnames(tabGroup)[ncol(tabGroup)] <- "All"
    if(length(d$time)!=length(unique(d$time))){
        cat("\n There are ties in event times :\n")
        print(table(d$time))
        cat("\n")
    }
    cat("\n")
    print(tabGroup)
    cat("\n")
    ## d
    # }}}
    
    # {{{ run wally
    pred <- as.matrix(d$pi,ncol=1)
    ## matrix input
    u <- wallyPlot(pred,
                   time=thetime,
                   formula=Hist(time,event)~1,
                   data=d,
                   hanging=TRUE,
                   seed=598,
                   colbox="red",
                   superuser.hide=FALSE,
                   ylim=c(-1,1),
                   superuser.choice=NULL,
                   q=myq)
    # }}}
})
# }}}










