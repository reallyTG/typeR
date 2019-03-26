###############################################################################
## test.R --- 
## Author          : Gilles Kratzer
## Document created: 12/10/2016
## Last modified   : 12/10/2016
##                 : 06/12/2016
##                 : 29/04/2017 (update tests)
##                 : 29/08/2017 (update tests: skweness, fitabn.mle, buildscorecache.mle, Markov Blanket, Formula statement,infoDag(),essentialgraph(),or(), mi.data(),discretization(), entropy.data(),logit(), expit())
##                 : 16/07/2018 (update tests: compareDag. Renaming)
###############################################################################
##Purpose: Test the ABN sofware to be inline with previous version + test new updates

Sys.setenv("R_TESTS" = "")

context("loading library")

#test_check("abn")
suppressWarnings(library(devtools))
suppressWarnings(library(testthat))
suppressWarnings(library(datasets))
suppressWarnings(library(entropy))
suppressWarnings(library(boot))
suppressWarnings(library(moments))
suppressWarnings(library(mlogit))
suppressWarnings(library(nnet))
suppressWarnings(library(stats))
suppressWarnings(library(AER))
suppressWarnings(library(brglm2))
suppressWarnings(library(brglm))
suppressWarnings(library(arm))
suppressWarnings(library(abn))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##Historical tests
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

context("Historical tests")

test_that("Test fitabn()", {

  load(file = "testdata/fitabn_ex0.Rdata")
  #load(file = "tests/testthat/testdata/fitabn_ex0.Rdata")

  myres.c.test <- fitabn(dag.m = mydag,data.df=mydat,data.dists=mydists,create.graph = TRUE)
  expect_that(myres.c.test,equals(myres.c))
  })

  test_that("Test buildscorecache() and hillclimber()", {

    load(file = "testdata/buildscorecache_ex1.Rdata")
    #load(file = "tests/testthat/testdata/buildscorecache_ex1.Rdata")

    invisible(mycache.test<-buildscorecache(data.df=mydat,data.dists=mydists, max.parents=max.par))
    invisible(mp.dag.test<-mostprobable(score.cache=mycache))
    invisible(myres.test<-fitabn(dag.m=mp.dag,data.df=mydat,data.dists=mydists,create.graph=TRUE))
    invisible(heur.res.test<-search.hillclimber(score.cache=mycache,num.searches=10,seed=42,verbose=F, trace=FALSE,timing.on=TRUE))


    expect_that(mycache.test,equals(mycache))
    expect_that(mp.dag.test,equals(mp.dag))
    expect_that(myres.test,equals(myres))
    expect_that(heur.res.test,equals(heur.res))

  })

  ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ##Updates tests
  ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  context("Development tests")

  test_that("Test fitabn.mle()",{

    #Gaussian
    df<-airquality[complete.cases(airquality),]

    dist<-list(Ozone="gaussian",Solar.R="gaussian",Wind="gaussian",Temp="gaussian",Month="gaussian",Day="gaussian")
    names(dist)<-colnames(df)

    d<-matrix(data = 0,nrow = 6,ncol = 6)
    d[1,]<-c(0,1,1,1,1,1)
    colnames(d)<-rownames(d)<-names(dist)

    m1<-fitabn.mle(dag.m = d,data.df = df,data.dists = dist,centre = FALSE)
    m2<-lm(df[,1]~as.matrix(df[,2:6]))

    expect_that(unname(m1$coef[[1]]), equals(unname(t(coef(summary.lm(object = m2))[,1]))))
    expect_that(unname(m1$Stderror[[1]]),equals(unname(t(coef(summary.lm(object = m2))[,2]))))
    expect_that(unname(m1$pvalue[[1]]),equals(unname(t(coef(summary.lm(object = m2))[,4]))))

   ##test centre
    m1 <- fitabn.mle(dag.m = d,data.df = df,data.dists = dist,centre = TRUE)
    m3 <- fitabn.mle(dag.m = d,data.df = df,data.dists = dist)
    d[1,]<-c(0,1,0,0,0,0)
    m2 <- fitabn.mle(dag.m = d,data.df = df,data.dists = dist)
    m4 <- cor(df[,1:6])

    expect_that(m1, equals(m3))
    expect_that(unname(m2$coef[[1]])[2], equals(m4[1,2]))

    #Binomial
    dist<-list(a="binomial",b="binomial")

    data.param <- matrix(data = c(0,0.5,0,0),nrow = 2L,ncol = 2L,byrow = T)

    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    out.sim<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 100,data.param = data.param,simulate = TRUE,seed = 132))

    m1<-fitabn.mle(dag.m = data.param,data.df = out.sim,data.dists = dist,centre = FALSE)
    m2<-glm(formula = out.sim$a~out.sim$b,family = "binomial")

    expect_that(unname(m1$coef[[1]]), equals(unname(t(coef(summary.glm(object = m2))[,1]))))
    expect_that(unname(m1$Stderror[[1]]),equals(unname(t(coef(summary.glm(object = m2))[,2]))))
    expect_that(unname(m1$pvalue[[1]]),equals(unname(t(coef(summary.glm(object = m2))[,4]))))

    #Poisson
    dist<-list(a="poisson",b="poisson")

    data.param <- matrix(data = c(0,0.5,0,0),nrow = 2L,ncol = 2L,byrow = T)

    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    out.sim<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 100,data.param = data.param,simulate = TRUE,seed = 132))

    m1<-fitabn.mle(dag.m = data.param,data.df = out.sim,data.dists = dist,centre = FALSE)
    m2<-glm(formula = out.sim$a~out.sim$b,family = "poisson")

    ##pvalues and stderr are computed up to 10e-06 precision!
    expect_that(unname(m1$coef[[1]]), equals(unname(t(coef(summary.glm(object = m2))[,1]))))
    expect_that(object = unname(m1$Stderror[[1]]),condition = equals(unname(t(coef(summary.glm(object = m2))[,2])),tolerance=1e-6))
    expect_that(unname(m1$pvalue[[1]]),equals(unname(t(coef(summary.glm(object = m2))[,4])),tolerance=1e-6))

    #multinomial (as response and as response)
    dist<-list(a="multinomial", b="gaussian")

    #link matrix
    data.param <- matrix(data = c(1,0,0,1),nrow = 2L,ncol = 2L,byrow = T)
    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    data.param.mult<-matrix(data = c(0.7,0.1,0.2, 0,0,0),nrow = 2L,ncol = 3L,byrow = T)

    out<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 1000,data.param = data.param,simulate = T,data.param.mult = data.param.mult,seed = 132))

    res<-out$`a[1]`
    res[out$`a[2]`==1]<-2
    res[out$`a[3]`==1]<-3

    dta<-data.frame(b=rnorm(n = length(res),mean = 1,sd = 1), c=rnorm(n = length(res),mean = 5,sd = 1))

    dta$res<-factor(res)

    dist<-list(a="gaussian",b="gaussian",c="multinomial")

    dag<-matrix(data = c(0,1,1,0,0,0,0,0,0),nrow = 3,ncol = 3,byrow = TRUE)

    colnames(dag)<-rownames(dag)<-names(dist)

    names(dta)<-names(dist)

    fit.abn.mle<-fitabn.mle(dag.m = (dag),data.df = dta,data.dists = dist,centre = FALSE)

    m.1<-model.matrix(object = ~dta$c+0,contrasts.arg = contr.treatment)

    m2<-lm(dta[,1]~-1+as.matrix(cbind(dta[,2], m.1)))

    #as predictors

    expect_that(unname(fit.abn.mle$coef[[1]]), equals(unname(t(coef(summary.lm(object = m2))[,1]))))
    expect_that(unname(fit.abn.mle$Stderror[[1]]),equals(unname(t(coef(summary.lm(object = m2))[,2])),tolerance=1e-3))
    expect_that(unname(fit.abn.mle$pvalue[[1]]),equals(unname(t(coef(summary.lm(object = m2))[,4])),tolerance=1e-3))

    #as response (intercept only)
    expect_that(unname(fit.abn.mle$coef[[3]]), equals(unname(t(coef(summary(multinom(formula = m.1~1,trace=FALSE)))[,1]))))
    expect_that(unname(fit.abn.mle$Stderror[[3]]),equals(unname(t(summary(multinom(formula = m.1~1,trace=FALSE))$standard.errors)),tolerance=1e-6))
    expect_that(unname(fit.abn.mle$pvalue[[3]]),equals(unname(t(coeftest(multinom(formula = m.1~1,trace=FALSE))[,4])),tolerance=1e-4))

    #as response

    dag<-matrix(data = c(0,0,0,0,0,0,1,1,0),nrow = 3,ncol = 3,byrow = TRUE)

    colnames(dag)<-rownames(dag)<-names(dist)

    fit.abn.mle<-fitabn.mle(dag.m = (dag),data.df = dta,data.dists = dist,centre = FALSE)

    m.1<-model.matrix(object = ~dta$c+0,contrasts.arg = contr.treatment)

    m2<-multinom(formula = m.1~dta$a+dta$b,trace=FALSE)

    expect_that(unname(as.vector(fit.abn.mle$coef[[3]])), equals(unname(as.vector(coef(summary(multinom(formula = m.1~dta$a+dta$b,trace=FALSE)))))))
    expect_that(unname(as.vector(fit.abn.mle$Stderror[[3]])),equals(unname(as.vector(summary(multinom(formula = m.1~dta$a+dta$b,trace=FALSE))$standard.errors)),tolerance=1e-6))
    expect_that(unname(as.vector(fit.abn.mle$pvalue[[3]])),equals(unname(as.vector(coeftest(multinom(formula = m.1~dta$a+dta$b,trace=FALSE))[c(1,4,2,5,3,6),4])),tolerance=1e-6))

    ##complicated output

    dag<-matrix(data = c(0,1,1,0,0,1,1,1,0),nrow = 3,ncol = 3,byrow = TRUE)

    colnames(dag)<-rownames(dag)<-names(dist)

    fit.abn.mle<-fitabn.mle(dag.m = (dag),data.df = dta,data.dists = dist,centre = FALSE)

  })

  test_that("Test buildscorecache.mle()",{

    df<-airquality[complete.cases(airquality),]

    #distribution (gaussian)
    dist<-list(Ozone="gaussian",Solar.R="gaussian",Wind="gaussian",Temp="gaussian",Month="gaussian",Day="gaussian")
    names(dist)<-colnames(df)

    mycache.computed.mle<-buildscorecache.mle(data.df = df,data.dists = dist,max.parents = 6)
    mycache.old<-buildscorecache(data.df=df,data.dists=dist,max.parents=6,dry.run = T)

    mycache.computed.mle.1<-buildscorecache.mle(data.df = df,data.dists = dist,max.parents = 3)
    mycache.old.1<-buildscorecache(data.df=df,data.dists=dist,max.parents=3,dry.run = T)

    ##dag retain
    mycache.computed.mle.2<-buildscorecache.mle(data.df = df,data.dists = dist,dag.banned = NULL, dag.retained = ~Ozone|Solar.R,max.parents = 3,dry.run = TRUE)
    mycache.old.2<-buildscorecache(data.df=df,data.dists=dist,max.parents=3,dry.run = T,dag.retained = ~Ozone|Solar.R,dag.banned = NULL)

    mycache.computed.mle.3<-buildscorecache.mle(data.df = df,data.dists = dist,dag.banned = NULL, dag.retained = ~Wind|.,max.parents = 6,dry.run = TRUE)
    mycache.old.3<-buildscorecache(data.df=df,data.dists=dist,max.parents=6,dry.run = T,dag.retained = ~Wind|.,dag.banned = NULL)


    ##dag ban
    mycache.computed.mle.4<-buildscorecache.mle(data.df = df,data.dists = dist,dag.banned = ~Ozone|Solar.R:Wind,max.parents = 3,dry.run = TRUE)
    mycache.old.4<-buildscorecache(data.df=df,data.dists=dist,max.parents=3,dry.run = T,dag.banned = ~Ozone|Solar.R:Wind)

    ##test cache
    expect_that(mycache.computed.mle$children, equals(mycache.old$children))
    expect_that(mycache.computed.mle$node.defn, equals(mycache.old$node.defn))
    expect_that(mycache.computed.mle.1$children, equals(mycache.old.1$children))
    expect_that(mycache.computed.mle.1$node.defn, equals(mycache.old.1$node.defn))
    expect_that(mycache.computed.mle.2$children, equals(mycache.old.2$children))
    expect_that(mycache.computed.mle.2$node.defn, equals(mycache.old.2$node.defn))
    expect_that(mycache.computed.mle.3$children, equals(mycache.old.3$children))
    expect_that(mycache.computed.mle.3$node.defn, equals(mycache.old.3$node.defn))
    expect_that(mycache.computed.mle.4$children, equals(mycache.old.4$children))
    expect_that(mycache.computed.mle.4$node.defn, equals(mycache.old.4$node.defn))

    ##test scoring
    #Gaussian
    dist<-list(a="gaussian",b="gaussian")

    data.param <- matrix(data = c(0,0.5,0,0),nrow = 2L,ncol = 2L,byrow = T)

    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    out.sim<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 100,data.param = data.param,simulate = TRUE,seed = 132))

    mycache<-invisible(buildscorecache.mle(data.df=out.sim,data.dists=dist,max.parents=2,centre = FALSE))

    #mLik
    expect_that(mycache$mlik[1], equals(as.numeric(logLik(lm(formula = out.sim$a ~ 1)))))
    expect_that(mycache$mlik[2], equals(as.numeric(logLik(lm(formula = out.sim$a ~ 1 + out.sim$b)))))
    expect_that(mycache$mlik[3], equals(as.numeric(logLik(lm(formula = out.sim$b ~ 1)))))

    #AIC
    expect_that(mycache$aic[1], equals(as.numeric(AIC(lm(formula = out.sim$a ~ 1)))))
    expect_that(mycache$aic[2], equals(as.numeric(AIC(lm(formula = out.sim$a ~ 1 + out.sim$b)))))
    expect_that(mycache$aic[3], equals(as.numeric(AIC(lm(formula = out.sim$b ~ 1)))))

    #BIC
    expect_that(mycache$bic[1], equals(as.numeric(BIC(lm(formula = out.sim$a ~ 1)))))
    expect_that(mycache$bic[2], equals(as.numeric(BIC(lm(formula = out.sim$a ~ 1 + out.sim$b)))))
    expect_that(mycache$bic[3], equals(as.numeric(BIC(lm(formula = out.sim$b ~ 1)))))

    ##Gaussian: correlation coefficients

    mycache<-invisible(buildscorecache.mle(data.df=out.sim,data.dists=dist,max.parents=2,centre = TRUE))

    expect_that(mycache$mlik[1],equals(as.numeric(logLik(lm(formula = (out.sim$a-mean(out.sim$a))/sd(out.sim$a) ~ 1)))))

    #Binomial
    dist<-list(a="binomial",b="binomial")

    data.param <- matrix(data = c(0,0.5,0,0),nrow = 2L,ncol = 2L,byrow = T)

    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    out.sim<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 100,data.param = data.param,simulate = TRUE,seed = 132))

    mycache<-invisible(buildscorecache.mle(data.df=out.sim,data.dists=dist,max.parents=2,centre = FALSE))

    #mLik
    expect_that(mycache$mlik[1], equals(as.numeric(logLik(glm(formula = out.sim$a ~ 1,family = binomial)))))
    expect_that(mycache$mlik[2], equals(as.numeric(logLik(glm(formula = out.sim$a ~ 1 + out.sim$b,family = binomial)))))
    expect_that(mycache$mlik[3], equals(as.numeric(logLik(glm(formula = out.sim$b ~ 1,family = binomial)))))

    #AIC
    expect_that(mycache$aic[1], equals(as.numeric(AIC(glm(formula = out.sim$a ~ 1,family = binomial)))))
    expect_that(mycache$aic[2], equals(as.numeric(AIC(glm(formula = out.sim$a ~ 1 + out.sim$b,family = binomial)))))
    expect_that(mycache$aic[3], equals(as.numeric(AIC(glm(formula = out.sim$b ~ 1,family = binomial)))))

    #BIC
    expect_that(mycache$bic[1], equals(as.numeric(BIC(glm(formula = out.sim$a ~ 1,family = binomial)))))
    expect_that(mycache$bic[2], equals(as.numeric(BIC(glm(formula = out.sim$a ~ 1 + out.sim$b,family = binomial)))))
    expect_that(mycache$bic[3], equals(as.numeric(BIC(glm(formula = out.sim$b ~ 1,family = binomial)))))

    #Poisson
    dist<-list(a="poisson",b="poisson")

    data.param <- matrix(data = c(0,0.5,0,0),nrow = 2L,ncol = 2L,byrow = T)

    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    out.sim<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 100,data.param = data.param,simulate = TRUE,seed = 132))

    mycache<-invisible(buildscorecache.mle(data.df=out.sim,data.dists=dist,max.parents=2))

    #mLik
    expect_that(mycache$mlik[1], equals(as.numeric(logLik(glm(formula = out.sim$a ~ 1,family = poisson)))))
    expect_that(mycache$mlik[2], equals(as.numeric(logLik(glm(formula = out.sim$a ~ 1 + out.sim$b,family = poisson)))))
    expect_that(mycache$mlik[3], equals(as.numeric(logLik(glm(formula = out.sim$b ~ 1,family = poisson)))))

    #AIC
    expect_that(mycache$aic[1], equals(as.numeric(AIC(glm(formula = out.sim$a ~ 1,family = poisson)))))
    expect_that(mycache$aic[2], equals(as.numeric(AIC(glm(formula = out.sim$a ~ 1 + out.sim$b,family = poisson)))))
    expect_that(mycache$aic[3], equals(as.numeric(AIC(glm(formula = out.sim$b ~ 1,family = poisson)))))

    #BIC
    expect_that(mycache$bic[1], equals(as.numeric(BIC(glm(formula = out.sim$a ~ 1,family = poisson)))))
    expect_that(mycache$bic[2], equals(as.numeric(BIC(glm(formula = out.sim$a ~ 1 + out.sim$b,family = poisson)))))
    expect_that(mycache$bic[3], equals(as.numeric(BIC(glm(formula = out.sim$b ~ 1,family = poisson)))))

    #multinomial (as response)
    dist<-list(a="multinomial", b="gaussian")

    #link matrix
    data.param <- matrix(data = c(1,0,0,1),nrow = 2L,ncol = 2L,byrow = T)
    #naming
    colnames(data.param)<-rownames(data.param)<-names(dist)

    data.param.mult<-matrix(data = c(0.7,0.1,0.2, 0,0,0),nrow = 2L,ncol = 3L,byrow = T)

    out<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 100,n.thin = 1,n.iter = 1000,data.param = data.param,simulate = T,data.param.mult = data.param.mult,seed = 132))

    res<-out$`a[1]`
    res[out$`a[2]`==1]<-2
    res[out$`a[3]`==1]<-3

    dta<-data.frame(b=rnorm(n = length(res),mean = 1,sd = 1), c=rnorm(n = length(res),mean = 5,sd = 1))

    dta$res<-factor(res)

    dist<-list(a="gaussian",b="gaussian",c="multinomial")

    names(dta)<-names(dist)

    mycache<-invisible(buildscorecache.mle(data.df=dta,data.dists=dist,max.parents=3,centre = FALSE))

    #mLik
    expect_that(mycache$mlik[9], equals(as.numeric(logLik(multinom(formula = dta$c ~ 1,trace=FALSE)))))
    expect_that(mycache$mlik[10], equals(as.numeric(logLik(multinom(formula = dta$c ~ 1 + dta$a,trace=FALSE)))))
    expect_that(mycache$mlik[11], equals(as.numeric(logLik(multinom(formula = dta$c ~ 1 + dta$b,trace=FALSE)))))

    #AIC
    expect_that(mycache$aic[9], equals(as.numeric(AIC(multinom(formula = dta$c ~ 1,trace=FALSE)))))
    expect_that(mycache$aic[10], equals(as.numeric(AIC(multinom(formula = dta$c ~ 1 + dta$a,trace=FALSE)))))
    expect_that(mycache$aic[11], equals(as.numeric(AIC(multinom(formula = dta$c ~ 1 + dta$b,trace=FALSE)))))

    #BIC
    expect_that(mycache$bic[9], equals(as.numeric(BIC(multinom(formula = dta$c ~ 1,trace=FALSE)))))
    expect_that(mycache$bic[10], equals(as.numeric(BIC(multinom(formula = dta$c ~ 1 + dta$a,trace=FALSE)))))
    expect_that(mycache$bic[11], equals(as.numeric(BIC(multinom(formula = dta$c ~ 1 + dta$b,trace=FALSE)))))

    ##Multinomial (as predictors)

    #mLik
    m.1<-model.matrix(object = ~dta$c+0,contrasts.arg = contr.treatment)

    expect_that(mycache$mlik[3], equals(as.numeric(logLik(glm(formula = dta$a ~ 0 + m.1,family = gaussian)))))
    expect_that(mycache$mlik[4], equals(as.numeric(logLik(glm(formula = dta$a ~ 0 + m.1 + dta$b,family = gaussian)))))

    #AIC
    expect_that(mycache$aic[3], equals(as.numeric(AIC(glm(formula = dta$a ~ 0 + m.1,family = gaussian)))))
    expect_that(mycache$aic[4], equals(as.numeric(AIC(glm(formula = dta$a ~ 0 + m.1 + dta$b,family = gaussian)))))

    #BIC
    expect_that(mycache$bic[3], equals(as.numeric(BIC(glm(formula = dta$a ~ 0 + m.1,family = gaussian)))))
    expect_that(mycache$bic[4], equals(as.numeric(BIC(glm(formula = dta$a ~ 0 + m.1 + dta$b,family = gaussian)))))

    #data separation

    ##simulation data
    n <- 1000
    x1 <- rnorm (n)
    x2 <- rbinom (n, 1, .5)
    b0 <- 1
    b1 <- 1.5
    b2 <- 2
    y <- rbinom (n, 1, boot::inv.logit(b0+b1*x1+b2*x2))

    y <- ifelse (x2==1, 1, y)

    dist<-list(a="binomial",b="gaussian",c="binomial")
    dta<-data.frame(y,x1,x2)
    names(dta)<-names(dist)

    mycache<-invisible(buildscorecache.mle(data.df=dta,data.dists=dist,max.parents=2,centre = FALSE,dry.run = FALSE))

    expect_that(mycache$mlik[1], equals(suppressWarnings(as.numeric(logLik(brglm(formula = dta$a ~ 1)))),tolerance=1e-2))
    expect_that(mycache$mlik[2], equals(as.numeric(logLik(suppressWarnings(brglm(formula = dta$a ~ dta$b)))),tolerance=1e-2))
    expect_that(mycache$mlik[3], equals(as.numeric(logLik(suppressWarnings(brglm(formula = dta$a ~ dta$c)))),tolerance=1e-2))
    expect_that(mycache$mlik[4], equals(as.numeric(logLik(suppressWarnings(brglm(formula = dta$a ~ dta$b + dta$c)))),tolerance=1e-2))
    expect_that(mycache$mlik[12], equals(as.numeric(logLik(suppressWarnings(brglm(formula = dta$c ~ dta$b + dta$a)))),tolerance=1e-2))
  })


  test_that("Markov Blanket",{
    dist<-list(a="gaussian",b="gaussian",c="gaussian",d="gaussian", e="binomial",
               f="binomial")

    #define parameter matrix
    data.param <- matrix(data = c(0,0.2,0.5,0,0.01,0,0,0,0.3,0.1,0, 0.8, 0,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0.1, 0,0,0,0,0,0),nrow =
                           6L,ncol = 6L,byrow = T)
    colnames(data.param) <- rownames(data.param) <- names(dist)

    a<-mb(dag.m = data.param,node = "b",data.dists = dist)
    b<-mb(dag.m = data.param,node = "e",data.dists = dist)
    c<-mb(dag.m = data.param,node = c("b","e"),data.dists = dist)

    expect_that(a,equals(c("a", "c", "d", "f", "e")))
    expect_that(b,equals(c("a", "f", "b", "c")))
    expect_that(c,equals(c("a", "c","d","f","e", "b")))
    })

  test_that("Formula statement", {
    dist<-list(a="gaussian",b="gaussian",c="gaussian",d="gaussian",e="gaussian",f="gaussian")

    m.formula.1<-plotabn(dag = ~a|b:c+b|c:d+a|e:f,data.dists = dist,plot = FALSE)
    m.formula.2<-plotabn(dag = ~a|.,data.dists = dist,plot = FALSE)

    m.true.1<-matrix(data = c(0,1,1,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),nrow = 6,ncol = 6,byrow = TRUE)
    m.true.2<-matrix(data = c(0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),nrow = 6,ncol = 6,byrow = TRUE)
    colnames(m.true.1)<-rownames(m.true.1)<-colnames(m.true.2)<-rownames(m.true.2)<-names(dist)

    expect_that(m.formula.1, equals(m.true.1))
    expect_that(m.formula.2, equals(m.true.2))

    ## formula with real data

    df<-airquality[complete.cases(airquality),]

    #distribution (gaussian)
    dist<-list(Ozone="gaussian",Solar.R="gaussian",Wind="gaussian",Temp="gaussian",Month="gaussian",Day="gaussian")
    names(dist)<-colnames(df)

    m.formula.1<-plotabn(dag = ~Ozone|Solar.R,data.dists = dist,plot = FALSE)
    m.formula.2<-plotabn(dag = ~Solar.R|.,data.dists = dist,plot = FALSE)

    m.true.1<-matrix(data = c(0,1,0,0,0,0, rep(0,30)),nrow = 6,ncol = 6,byrow = TRUE)
    m.true.2<-matrix(data = c(0,0,0,0,0,0,1,0,1,1,1,1,rep(0,24)),nrow = 6,ncol = 6,byrow = TRUE)
    colnames(m.true.1)<-rownames(m.true.1)<-colnames(m.true.2)<-rownames(m.true.2)<-names(dist)

    expect_that(m.formula.1, equals(m.true.1))
    expect_that(m.formula.2, equals(m.true.2))


  })



  test_that("infoDag()", {

    dag<-matrix(data = 0, nrow = 6,ncol = 6)
    dist<-list(a="gaussian",b="gaussian",c="gaussian",d="gaussian",e="gaussian",f="gaussian")
    colnames(dag)<-rownames(dag)<-names(dist)

    infoDag.out1<-infoDag(dag.m = dag, name = names(dist))

    dag<-matrix(data = c(0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), nrow = 6,ncol = 6)
    colnames(dag)<-rownames(dag)<-names(dist)

    infoDag.out2<-infoDag(dag.m = dag, name = names(dist))

    dag<-matrix(data = c(0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), nrow = 6,ncol = 6)
    colnames(dag)<-rownames(dag)<-names(dist)

    #plotabn(dag.m = dag,data.dists = dist)

    infoDag.out3<-infoDag(dag.m = dag, name = names(dist))

    expect_equal(infoDag.out1$n.nodes,6)
    expect_equal(infoDag.out1$n.arcs,0)
    expect_equal(infoDag.out1$mb.average,0)
    expect_equal(infoDag.out1$nh.average,0)
    expect_equal(infoDag.out1$parent.average,0)
    expect_equal(infoDag.out1$children.average,0)

    expect_equal(infoDag.out2$n.nodes,6)
    expect_equal(infoDag.out2$n.arcs,2)
    expect_equal(infoDag.out2$mb.average,1)
    expect_equal(infoDag.out2$nh.average,2/3)
    expect_equal(infoDag.out2$parent.average,1/3)
    expect_equal(infoDag.out2$children.average,1/3)

    expect_equal(infoDag.out3$n.nodes,6)
    expect_equal(infoDag.out3$n.arcs,3)
    expect_equal(infoDag.out3$mb.average,2)
    expect_equal(infoDag.out3$nh.average,1)
    expect_equal(infoDag.out3$parent.average,0.5)
    expect_equal(infoDag.out3$children.average,0.5)

  })

  test_that("logit(), expit()", {

    expect_equal(abn::logit(x = 0.678),boot::logit(p = 0.678))
    expect_equal(abn::logit(x = 0.7834917410),boot::logit(p = 0.7834917410))

    expect_equal(abn::expit(x = 0.678),boot::inv.logit(x = 0.678))
    expect_equal(abn::expit(x = -0.7834923434217410),boot::inv.logit(x = -0.7834923434217410))

  })

  test_that("discretization(), entropyData()",{

    dist<-list(a="gaussian",b="gaussian",c="gaussian")
    data.param <- matrix(data = c(0,1,0,
                                  0,0,1,
                                  0,0,0),nrow = 3L,ncol = 3L,byrow = T)

    data.param.var<-matrix(data = 0,nrow = 3L,ncol = 3L)
    diag(data.param.var)<-c(0.1,0.1,0.1)

    out<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 1000000,n.thin = 1,n.iter = 100,data.param = data.param,data.param.var = data.param.var,simulate = TRUE,seed = 132))

    y2d.entropy.1<-entropy::discretize2d(x1 = out$a,x2 = out$b,numBins1 = 100,numBins2 = 100)
    y2d.abn.1<-abn::discretization(data.df = out[,c(1,2)],discretization.method = 100,data.dists = dist[c(1,2)],nb.states = FALSE)

    y2d.entropy.2<-entropy::discretize2d(x1 = out$a,x2 = out$c,numBins1 = 100,numBins2 = 100)
    y2d.abn.2<-abn::discretization(data.df = out[,c(1,3)],discretization.method = 100,data.dists = dist[c(1,2)],nb.states = FALSE)


    #Not the same dimnames!
    dimnames(y2d.abn.1)<-dimnames(y2d.entropy.1)
    dimnames(y2d.abn.2)<-dimnames(y2d.entropy.2)

    expect_equal(y2d.abn.1,y2d.entropy.1)
    expect_equal(y2d.abn.2,y2d.entropy.2)

    expect_equal(entropyData(freqs.table = y2d.abn.1),entropy.empirical(y = y2d.entropy.1,unit = "log2"))
    expect_equal(entropyData(freqs.table = y2d.abn.2),entropy.empirical(y = y2d.entropy.2,unit = "log2"))
    })

  test_that("or(), miData(), ", {

    prob<-logit(0.75)

    ##pure binomial
    dist<-list(a="binomial",b="binomial",c="binomial")
    data.param <- matrix(data = c(0,prob,0,
                                  0,0,prob,
                                  0,0,0),nrow = 3L,ncol = 3L,byrow = T)

    out<-invisible(simulateabn(data.dists = dist,n.chains = 1,n.adapt = 1000000,n.thin = 10,n.iter = 100,data.param = data.param,simulate = TRUE,seed = 132))

    x.bc<-table(as.numeric(as.character(out$b)),as.numeric(as.character(out$c)),dnn = c("b","c"))

    x.ab<-table(as.numeric(out$a),as.numeric(out$b),dnn = c("a","b"))

    x.ac<-table(as.numeric(out$a),as.numeric(out$c),dnn = c("a","c"))

    ##OR()

    expect_equal(abn::or(x = x.bc),3/2)
    expect_equal(abn::or(x = x.ab),1)
    expect_equal(abn::or(x = x.ac),8/3)

    ##MUTUAL INFORMATION

    expect_equal(miData(freqs.table = x.bc,method = "mi.raw"), mi.empirical(y2d = x.bc))
    expect_equal(miData(freqs.table = x.ab,method = "mi.raw"), mi.empirical(y2d = x.ab))
    expect_equal(miData(freqs.table = x.ac,method = "mi.raw"), mi.empirical(y2d = x.ac))

  })

  test_that("skewness()", {

    data <- c(19.09, 19.55, 17.89, 17.73, 25.15, 27.27, 25.24, 21.05, 21.65, 20.92, 22.61, 15.71, 22.04, 22.60, 24.25)

    expect_equal(abn:::skewness(x = data),moments::skewness(x = data))

  })

  test_that("essentialGraph()",{

    dist.test<-list(a="gaussian",b="gaussian",c="gaussian")

    compareDag(ref = essentialGraph(dag.m = plotabn(dag.m = ~a|b+b|c,data.dists = dist.test,plot = F)),test = essentialGraph(dag.m = plotabn(dag.m = ~a|b+c|b,data.dists = dist.test,plot = F)))
    compareDag(ref = essentialGraph(dag.m = plotabn(dag.m = ~a|b+b|c,data.dists = dist.test,plot = F)),test = essentialGraph(dag.m = plotabn(dag.m = ~b|a+b|c,data.dists = dist.test,plot = F)))


    ##essentialGraph()
    expect_equal(object = essentialGraph(dag.m = plotabn(dag.m = ~a|b+c|b,data.dists = dist.test,plot = FALSE)),expected = essentialGraph(dag.m = plotabn(dag.m = ~b|a+c|b,data.dists = dist.test,plot = FALSE)))
    expect_equal(object = essentialGraph(dag.m = plotabn(dag.m = ~a|b+b|c,data.dists = dist.test,plot = FALSE)),expected = essentialGraph(dag.m = plotabn(dag.m = ~b|a+c|b,data.dists = dist.test,plot = FALSE)))

    expect_equal(essentialGraph(dag.m = plotabn(dag.m = ~b|a+b|c,data.dists = dist.test,plot = FALSE)),plotabn(dag.m = ~b|a+b|c,data.dists = dist.test,plot = FALSE))


  #more complex
    dist.test<-list(a="gaussian",b="gaussian",c="gaussian", d="gaussian", e="gaussian", f="gaussian")
    #examples from "Bayesian Networks in Bioinformatics, Kyu-Baek Hwang"

    minimal.dag<-matrix(data = c(0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0),nrow = 6,byrow = TRUE)
    colnames(minimal.dag)<-rownames(minimal.dag)<-names(dist.test)
    completed.dag<-matrix(data = c(0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0),nrow = 6,byrow = TRUE)
    colnames(completed.dag)<-rownames(completed.dag)<-names(dist.test)

    expect_equal(plotabn(essentialGraph(plotabn(dag.m = ~f|e:a+e|c+c|a:b+d|b,data.dists = dist.test,plot = FALSE),PDAG = "minimal"),data.dists = dist.test,plot = FALSE) ,minimal.dag)
    expect_equal(plotabn(essentialGraph(plotabn(dag.m = ~f|e:a+e|c+c|a:b+d|b,data.dists = dist.test,plot = FALSE),PDAG = "completed"),data.dists = dist.test, plot = FALSE), completed.dag)

  })

  test_that("compareDag()",{

    a <- matrix(data = 0,nrow = 3,ncol = 3)

    a1 <- matrix(data = c(0,0,0,
                          1,0,0,
                          1,0,0),nrow = 3,ncol = 3)
    a2 <- matrix(data = c(0,0,0,
                         1,0,0,
                         1,1,0),nrow = 3,ncol = 3)
    b <- matrix(data = c(0,0,0,
                         1,0,1,
                         1,1,0),nrow = 3,ncol = 3)

    expect_equal(compareDag(ref = a,test = b)$`Hamming-distance`,expected = 4)
    expect_equal(compareDag(ref = a1,test = b)$`Hamming-distance`,expected = 2)
    expect_equal(compareDag(ref = a1,test = b)$TPR,expected = 1)
    expect_equal(compareDag(ref = a1,test = b)$PPV,expected = .5)
    expect_equal(compareDag(ref = a2,test = b)$`Hamming-distance`,expected = 1)
    expect_equal(compareDag(ref = a2,test = b)$PPV,expected = .75)
    expect_equal(compareDag(ref = a2,test = b)$FDR,expected = 0)
    expect_equal(compareDag(ref = a2,test = b)$TPR,expected = 1)
    })
  
  