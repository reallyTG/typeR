library(GDINA)


### Name: GDINA
### Title: CDM calibration under the G-DINA model framework
### Aliases: GDINA anova.GDINA coef.GDINA extract.GDINA personparm.GDINA
###   logLik.GDINA deviance.GDINA nobs.GDINA vcov.GDINA npar.GDINA
###   indlogLik.GDINA indlogPost.GDINA summary.GDINA

### ** Examples

## Not run: 
##D ####################################
##D #        Example 1.                #
##D #     GDINA, DINA, DINO            #
##D #    ACDM, LLM and RRUM            #
##D # estimation and comparison        #
##D #                                  #
##D ####################################
##D 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D 
##D #--------GDINA model --------#
##D 
##D mod1 <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D mod1
##D # summary information
##D summary(mod1)
##D 
##D AIC(mod1) #AIC
##D BIC(mod1) #BIC
##D logLik(mod1) #log-likelihood value
##D deviance(mod1) # deviance: -2 log-likelihood
##D npar(mod1) # number of parameters
##D 
##D 
##D head(indlogLik(mod1)) # individual log-likelihood
##D head(indlogPost(mod1)) # individual log-posterior
##D 
##D # structural parameters
##D # see ?coef
##D coef(mod1) # item probabilities of success for each latent group
##D coef(mod1, withSE = TRUE) # item probabilities of success & standard errors
##D coef(mod1, what = "delta") # delta parameters
##D coef(mod1, what = "delta",withSE=TRUE) # delta parameters
##D coef(mod1, what = "gs") # guessing and slip parameters
##D coef(mod1, what = "gs",withSE = TRUE) # guessing and slip parameters & standard errors
##D 
##D # person parameters
##D # see ?personparm
##D personparm(mod1) # EAP estimates of attribute profiles
##D personparm(mod1, what = "MAP") # MAP estimates of attribute profiles
##D personparm(mod1, what = "MLE") # MLE estimates of attribute profiles
##D 
##D #plot item response functions for item 10
##D plot(mod1,item = 10)
##D plot(mod1,item = 10,withSE = TRUE) # with error bars
##D #plot mastery probability for individuals 1, 20 and 50
##D plot(mod1,what = "mp", person =c(1,20,50))
##D 
##D # Use extract function to extract more components
##D # See ?extract
##D 
##D # ------- DINA model --------#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod2 <- GDINA(dat = dat, Q = Q, model = "DINA")
##D mod2
##D coef(mod2, what = "gs") # guess and slip parameters
##D coef(mod2, what = "gs",withSE = TRUE) # guess and slip parameters and standard errors
##D 
##D # Model comparison at the test level via likelihood ratio test
##D anova(mod1,mod2)
##D 
##D # -------- DINO model -------#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod3 <- GDINA(dat = dat, Q = Q, model = "DINO")
##D #slip and guessing
##D coef(mod3, what = "gs") # guess and slip parameters
##D coef(mod3, what = "gs",withSE = TRUE) # guess and slip parameters + standard errors
##D 
##D # Model comparison at test level via likelihood ratio test
##D anova(mod1,mod2,mod3)
##D 
##D # --------- ACDM model -------#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod4 <- GDINA(dat = dat, Q = Q, model = "ACDM")
##D mod4
##D # --------- LLM model -------#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod4b <- GDINA(dat = dat, Q = Q, model = "LLM")
##D mod4b
##D # --------- RRUM model -------#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod4c <- GDINA(dat = dat, Q = Q, model = "RRUM")
##D mod4c
##D 
##D # --- Different CDMs for different items --- #
##D 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D models <- c(rep("GDINA",3),"LLM","DINA","DINO","ACDM","RRUM","LLM","RRUM")
##D mod5 <- GDINA(dat = dat, Q = Q, model = models)
##D anova(mod1,mod2,mod3,mod4,mod4b,mod4c,mod5)
##D 
##D 
##D ####################################
##D #        Example 2.                #
##D #        Model estimations         #
##D # With monotonocity constraints    #
##D ####################################
##D 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D # for item 10 only
##D mod11 <- GDINA(dat = dat, Q = Q, model = "GDINA",mono.constraint = c(rep(FALSE,9),TRUE))
##D mod11
##D mod11a <- GDINA(dat = dat, Q = Q, model = "DINA",mono.constraint = TRUE)
##D mod11a
##D mod11b <- GDINA(dat = dat, Q = Q, model = "ACDM",mono.constraint = TRUE)
##D mod11b
##D mod11c <- GDINA(dat = dat, Q = Q, model = "LLM",mono.constraint = TRUE)
##D mod11c
##D mod11d <- GDINA(dat = dat, Q = Q, model = "RRUM",mono.constraint = TRUE)
##D mod11d
##D coef(mod11d,"delta")
##D coef(mod11d,"rrum")
##D 
##D ####################################
##D #           Example 3a.            #
##D #        Model estimations         #
##D # With Higher-order att structure  #
##D ####################################
##D 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D # --- Higher order G-DINA model ---#
##D mod12 <- GDINA(dat = dat, Q = Q, model = "DINA",
##D                att.dist="higher.order",higher.order=list(nquad=31,model = "2PL"))
##D personparm(mod12,"HO") # higher-order ability
##D # structural parameters
##D # first column is slope and the second column is intercept
##D coef(mod12,"lambda")
##D # --- Higher order DINA model ---#
##D mod22 <- GDINA(dat = dat, Q = Q, model = "DINA", att.dist="higher.order",
##D                higher.order=list(model = "2PL",Prior=TRUE))
##D 
##D ####################################
##D #           Example 3b.            #
##D #        Model estimations         #
##D #   With log-linear att structure  #
##D ####################################
##D 
##D # --- DINA model with loglinear smoothed attribute space ---#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod23 <- GDINA(dat = dat, Q = Q, model = "DINA",att.dist="loglinear",loglinear=1)
##D coef(mod23,"lambda") # intercept and three main effects
##D 
##D ####################################
##D #           Example 3c.            #
##D #        Model estimations         #
##D #  With independent att structure  #
##D ####################################
##D 
##D # --- GDINA model with independent attribute space ---#
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod33 <- GDINA(dat = dat, Q = Q, att.dist="independent")
##D coef(mod33,"lambda") # mastery probability for each attribute
##D 
##D ####################################
##D #          Example 4.              #
##D #        Model estimations         #
##D #    With fixed att structure      #
##D ####################################
##D 
##D # --- User-specified attribute priors ----#
##D # prior distribution is fixed during calibration
##D # Assume each of 000,100,010 and 001 has probability of 0.1
##D # and each of 110, 101,011 and 111 has probability of 0.15
##D # Note that the sum is equal to 1
##D #
##D prior <- c(0.1,0.1,0.1,0.1,0.15,0.15,0.15,0.15)
##D # fit GDINA model  with fixed prior dist.
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D modp1 <- GDINA(dat = dat, Q = Q, att.prior = prior, att.dist = "fixed")
##D extract(modp1, what = "att.prior")
##D 
##D ####################################
##D #          Example 5a.             #
##D #             G-DINA               #
##D # with hierarchical att structure  #
##D ####################################
##D 
##D # --- User-specified attribute structure ----#
##D Q <- sim30GDINA$simQ
##D K <- ncol(Q)
##D # divergent structure A1->A2->A3;A1->A4->A5
##D diverg <- list(c(1,2),
##D                c(2,3),
##D                c(1,4),
##D                c(4,5))
##D struc <- att.structure(diverg,K)
##D set.seed(123)
##D # data simulation
##D N <- 1000
##D true.lc <- sample(c(1:2^K),N,replace=TRUE,prob=struc$att.prob)
##D table(true.lc) #check the sample
##D true.att <- attributepattern(K)[true.lc,]
##D  gs <- matrix(rep(0.1,2*nrow(Q)),ncol=2)
##D  # data simulation
##D  simD <- simGDINA(N,Q,gs.parm = gs, model = "GDINA",attribute = true.att)
##D  dat <- extract(simD,"dat")
##D 
##D modp1 <- GDINA(dat = dat, Q = Q, att.str = diverg, att.dist = "saturated")
##D modp1
##D coef(modp1,"lambda")
##D 
##D ####################################
##D #          Example 5b.             #
##D #   Reduced model (e.g.,ACDM)      #
##D # with hierarchical att structure  #
##D ####################################
##D 
##D # --- User-specified attribute structure ----#
##D Q <- sim30GDINA$simQ
##D K <- ncol(Q)
##D # linear structure A1->A2->A3->A4->A5
##D linear <- list(c(1,2),
##D                c(2,3),
##D                c(3,4),
##D                c(4,5))
##D struc <- att.structure(linear,K)
##D set.seed(123)
##D # data simulation
##D N <- 1000
##D true.lc <- sample(c(1:2^K),N,replace=TRUE,prob=struc$att.prob)
##D table(true.lc) #check the sample
##D true.att <- attributepattern(K)[true.lc,]
##D  gs <- matrix(rep(0.1,2*nrow(Q)),ncol=2)
##D  # data simulation
##D  simD <- simGDINA(N,Q,gs.parm = gs, model = "ACDM",attribute = true.att)
##D  dat <- extract(simD,"dat")
##D 
##D modp1 <- GDINA(dat = dat, Q = Q, model = "ACDM",
##D                att.str = linear, att.dist = "saturated")
##D coef(modp1)
##D coef(modp1,"lambda")
##D 
##D ####################################
##D #           Example 6.             #
##D # Fix item and structure parameters#
##D # Estimate person attribute profile#
##D ####################################
##D 
##D  # check initials to see the format for initial item parameters
##D  initials <- sim10GDINA$simItempar
##D  prior <- c(0.1,0.1,0.1,0.1,0.15,0.15,0.15,0.15)
##D  dat <- sim10GDINA$simdat
##D  Q <- sim10GDINA$simQ
##D  mod.ini <- GDINA(dat,Q,catprob.parm = initials,att.prior = prior,
##D                   att.dist = "fixed",control=list(maxitr = 0))
##D  personparm(mod.ini)
##D  # compare item parameters
##D  Map(rbind, initials,coef(mod.ini))
##D 
##D ####################################
##D #           Example 7.             #
##D #   Fix parameters for some items  #
##D # Estimate person attribute profile#
##D ####################################
##D 
##D  # check initials to see the format for initial item parameters
##D  initials <- sim10GDINA$simItempar
##D  prior <- c(0.1,0.1,0.1,0.1,0.15,0.15,0.15,0.15)
##D  dat <- sim10GDINA$simdat
##D  Q <- sim10GDINA$simQ
##D  # fix parameters of the first 5 items; do not fix mixing proportion parameters
##D  mod.ini <- GDINA(dat,Q,catprob.parm = initials,
##D                   att.dist = "saturated",control=list(maxitr = c(rep(0,5),rep(2000,5))))
##D  personparm(mod.ini)
##D  # compare item parameters
##D  Map(rbind, initials,coef(mod.ini))
##D 
##D ####################################
##D #           Example 8.             #
##D #        polytomous attribute      #
##D #          model estimation        #
##D #    see Chen, de la Torre 2013    #
##D ####################################
##D 
##D 
##D # --- polytomous attribute G-DINA model --- #
##D dat <- sim30pGDINA$simdat
##D Q <- sim30pGDINA$simQ
##D #polytomous G-DINA model
##D pout <- GDINA(dat,Q)
##D 
##D # ----- polymous DINA model --------#
##D pout2 <- GDINA(dat,Q,model="DINA")
##D anova(pout,pout2)
##D 
##D ####################################
##D #           Example 9.             #
##D #        Sequential G-DINA model   #
##D #    see Ma, & de la Torre 2016    #
##D ####################################
##D 
##D # --- polytomous attribute G-DINA model --- #
##D dat <- sim20seqGDINA$simdat
##D Q <- sim20seqGDINA$simQ
##D Q
##D #    Item Cat A1 A2 A3 A4 A5
##D #       1   1  1  0  0  0  0
##D #       1   2  0  1  0  0  0
##D #       2   1  0  0  1  0  0
##D #       2   2  0  0  0  1  0
##D #       3   1  0  0  0  0  1
##D #       3   2  1  0  0  0  0
##D #       4   1  0  0  0  0  1
##D #       ...
##D 
##D #sequential G-DINA model
##D sGDINA <- GDINA(dat,Q,sequential = TRUE)
##D sDINA <- GDINA(dat,Q,sequential = TRUE,model = "DINA")
##D anova(sGDINA,sDINA)
##D coef(sDINA) # processing function
##D coef(sDINA,"itemprob") # success probabilities for each item
##D coef(sDINA,"LCprob") # success probabilities for each category for all latent classes
##D 
##D ####################################
##D #           Example 10a.           #
##D #    Multiple-Group G-DINA model   #
##D ####################################
##D 
##D Q <- sim10GDINA$simQ
##D K <- ncol(Q)
##D # parameter simulation
##D # Group 1 - female
##D N1 <- 3000
##D gs1 <- matrix(rep(0.1,2*nrow(Q)),ncol=2)
##D # Group 2 - male
##D N2 <- 3000
##D gs2 <- matrix(rep(0.2,2*nrow(Q)),ncol=2)
##D 
##D # data simulation for each group
##D sim1 <- simGDINA(N1,Q,gs.parm = gs1,model = "DINA",att.dist = "higher.order",
##D                  higher.order.parm = list(theta = rnorm(N1),
##D                  lambda = data.frame(a=rep(1.5,K),b=seq(-1,1,length.out=K))))
##D sim2 <- simGDINA(N2,Q,gs.parm = gs2,model = "DINO",att.dist = "higher.order",
##D                  higher.order.parm = list(theta = rnorm(N2),
##D                  lambda = data.frame(a=rep(1,K),b=seq(-2,2,length.out=K))))
##D 
##D # combine data - all items have the same item parameters
##D dat <- rbind(extract(sim1,"dat"),extract(sim2,"dat"))
##D gr <- rep(c(1,2),c(3000,3000))
##D # Fit G-DINA model
##D mg.est <- GDINA(dat = dat,Q = Q,group = gr)
##D summary(mg.est)
##D extract(mg.est,"posterior.prob")
##D coef(mg.est,"lambda")
##D 
##D 
##D ####################################
##D #           Example 10b.           #
##D #    Multiple-Group G-DINA model   #
##D ####################################
##D 
##D Q <- sim30GDINA$simQ
##D K <- ncol(Q)
##D # parameter simulation
##D N1 <- 3000
##D gs1 <- matrix(rep(0.1,2*nrow(Q)),ncol=2)
##D N2 <- 3000
##D gs2 <- matrix(rep(0.2,2*nrow(Q)),ncol=2)
##D 
##D # data simulation for each group
##D # two groups have different theta distributions
##D sim1 <- simGDINA(N1,Q,gs.parm = gs1,model = "DINA",att.dist = "higher.order",
##D                  higher.order.parm = list(theta = rnorm(N1),
##D                  lambda = data.frame(a=rep(1,K),b=seq(-2,2,length.out=K))))
##D sim2 <- simGDINA(N2,Q,gs.parm = gs2,model = "DINO",att.dist = "higher.order",
##D                  higher.order.parm = list(theta = rnorm(N2,1,1),
##D                  lambda = data.frame(a=rep(1,K),b=seq(-2,2,length.out=K))))
##D 
##D # combine data - different groups have distinct item parameters
##D # see ?bdiagMatrix
##D dat <- bdiagMatrix(list(extract(sim1,"dat"),extract(sim2,"dat")),fill=NA)
##D Q <- rbind(Q,Q)
##D gr <- rep(c(1,2),c(3000,3000))
##D mg.est <- GDINA(dat = dat,Q = Q,group = gr)
##D # Fit G-DINA model
##D mg.est <- GDINA(dat = dat,Q = Q,group = gr,att.dist="higher.order",
##D higher.order=list(model = "Rasch"))
##D summary(mg.est)
##D coef(mg.est,"lambda")
##D personparm(mg.est)
##D personparm(mg.est,"HO")
##D extract(mg.est,"posterior.prob")
##D 
##D 
##D ####################################
##D #           Example 11.            #
##D #           Bug DINO model         #
##D ####################################
##D 
##D set.seed(123)
##D Q <- sim10GDINA$simQ # 1 represents misconceptions/bugs
##D ip <- list(
##D c(0.8,0.2),
##D c(0.7,0.1),
##D c(0.9,0.2),
##D c(0.9,0.1,0.1,0.1),
##D c(0.9,0.1,0.1,0.1),
##D c(0.9,0.1,0.1,0.1),
##D c(0.9,0.1,0.1,0.1),
##D c(0.9,0.1,0.1,0.1),
##D c(0.9,0.1,0.1,0.1),
##D c(0.9,0.1,0.1,0.1,0.1,0.1,0.1,0.1))
##D sim <- simGDINA(N=1000,Q=Q,catprob.parm = ip,model = "DINO")
##D dat <- extract(sim,"dat")
##D # use latent.var to specify a bug model
##D est <- GDINA(dat=dat,Q=Q,latent.var="bugs",model="DINO")
##D coef(est)
##D 
##D ####################################
##D #           Example 12.            #
##D #           Bug DINA model         #
##D ####################################
##D 
##D set.seed(123)
##D Q <- sim10GDINA$simQ # 1 represents misconceptions/bugs
##D ip <- list(
##D c(0.8,0.2),
##D c(0.7,0.1),
##D c(0.9,0.2),
##D c(0.9,0.9,0.9,0.1),
##D c(0.9,0.9,0.9,0.1),
##D c(0.9,0.9,0.9,0.1),
##D c(0.9,0.9,0.9,0.1),
##D c(0.9,0.9,0.9,0.1),
##D c(0.9,0.9,0.9,0.1),
##D c(0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.1))
##D sim <- simGDINA(N=1000,Q=Q,catprob.parm = ip,model="DINA")
##D dat <- extract(sim,"dat")
##D # use latent.var to specify a bug model
##D est <- GDINA(dat=dat,Q=Q,latent.var="bugs",model="DINA")
##D coef(est)
##D 
##D ####################################
##D #           Example 13a.           #
##D #     user specified design matrix #
##D #        LCDM (logit G-DINA)       #
##D ####################################
##D 
##D dat <- sim30GDINA$simdat
##D Q <- sim30GDINA$simQ
##D 
##D # LCDM
##D lcdm <- GDINA(dat = dat, Q = Q, model = "logitGDINA", control=list(conv.type="neg2LL"))
##D 
##D #Another way is to find design matrix for each item first => must be a list
##D D <- lapply(rowSums(Q),designmatrix,model="GDINA")
##D # for comparison, use change in -2LL as convergence criterion
##D # LCDM
##D lcdm2 <- GDINA(dat = dat, Q = Q, model = "UDF", design.matrix = D,
##D linkfunc = "logit", control=list(conv.type="neg2LL"),solver="slsqp")
##D 
##D # identity link GDINA
##D iGDINA <- GDINA(dat = dat, Q = Q, model = "GDINA",
##D control=list(conv.type="neg2LL"),solver="slsqp")
##D 
##D # compare all three models => identical
##D anova(lcdm,lcdm2,iGDINA)
##D 
##D ####################################
##D #           Example 13b.           #
##D #     user specified design matrix #
##D #            RRUM                  #
##D ####################################
##D 
##D dat <- sim30GDINA$simdat
##D Q <- sim30GDINA$simQ
##D 
##D # specify design matrix for each item => must be a list
##D # D can be defined by the user
##D D <- lapply(rowSums(Q),designmatrix,model="ACDM")
##D # for comparison, use change in -2LL as convergence criterion
##D # RRUM
##D logACDM <- GDINA(dat = dat, Q = Q, model = "UDF", design.matrix = D,
##D linkfunc = "log", control=list(conv.type="neg2LL"),solver="slsqp")
##D 
##D # identity link GDINA
##D RRUM <- GDINA(dat = dat, Q = Q, model = "RRUM",
##D               control=list(conv.type="neg2LL"),solver="slsqp")
##D 
##D # compare two models => identical
##D anova(logACDM,RRUM)
##D 
##D ####################################
##D #           Example 14.            #
##D #     Multiple-strategy DINA model #
##D ####################################
##D 
##D Q <- matrix(c(1,1,1,1,0,
##D 1,2,0,1,1,
##D 2,1,1,0,0,
##D 3,1,0,1,0,
##D 4,1,0,0,1,
##D 5,1,1,0,0,
##D 5,2,0,0,1),ncol = 5,byrow = TRUE)
##D d <- list(
##D   item1=c(0.2,0.7),
##D   item2=c(0.1,0.6),
##D   item3=c(0.2,0.6),
##D   item4=c(0.2,0.7),
##D   item5=c(0.1,0.8))
##D 
##D   set.seed(12345)
##D sim <- simGDINA(N=1000,Q = Q, delta.parm = d,
##D                model = c("MSDINA","MSDINA","DINA",
##D                          "DINA","DINA","MSDINA","MSDINA"))
##D 
##D # simulated data
##D dat <- extract(sim,what = "dat")
##D # estimation
##D # MSDINA need to be specified for each strategy
##D est <- GDINA(dat,Q,model = c("MSDINA","MSDINA","DINA",
##D                              "DINA","DINA","MSDINA","MSDINA"))
##D coef(est,"delta")
## End(Not run)




