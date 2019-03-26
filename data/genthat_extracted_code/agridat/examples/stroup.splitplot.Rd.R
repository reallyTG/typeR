library(agridat)


### Name: stroup.splitplot
### Title: Simulated split-plot experiment
### Aliases: stroup.splitplot

### ** Examples


data(stroup.splitplot)
dat <- stroup.splitplot

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # ---- lme4 -----
##D   require(lme4)
##D   m0 <- lmer(y~ -1 + a + b + a:b + (1|rep) + (1|a:rep), data=dat)
##D   # No predict function
##D   
##D   # ----- nlme -----
##D   require(nlme)
##D   m0 <- lme(y ~ -1 + a + b + a:b, data=dat, random = ~ 1|rep/a)
##D   
##D   # ----- ASREML model -----
##D   require(asreml)
##D   m1 <- asreml(y~ -1 + a + b + a:b, random=~ rep + a:rep, data=dat)
##D   
##D   library(lucid)
##D   vc(m1) # Variance components match Stroup p. 41
##D   ##   effect component std.error z.ratio bound ##D 
##D   ##      rep    62.4      56.54      1.1     P   0
##D   ##    a:rep    15.38     11.79      1.3     P   0
##D   ## units(R)     9.361     4.413     2.1     P   0
##D   
##D   # Narrow space predictions
##D   predict(m1, data=dat, classify="a", average=list(rep=NULL))$predictions$pvals
##D   #  a Predicted Std Err    Status
##D   # a1     32.88   1.082 Estimable
##D   # a2     34.12   1.082 Estimable
##D   # a3     25.75   1.082 Estimable
##D 
##D   # Intermediate space predictions
##D   predict(m1, data=dat, classify="a", ignore=list("a:rep"),
##D           average=list(rep=NULL))$predictions$pvals
##D   #  a Predicted Std Err    Status
##D   # a1     32.88    2.24 Estimable
##D   # a2     34.12    2.24 Estimable
##D   # a3     25.75    2.24 Estimable
##D 
##D   # Broad space predictions
##D   predict(m1, data=dat, classify="a")$predictions$pvals
##D   #  a Predicted Std Err    Status
##D   # a1     32.88    4.54 Estimable
##D   # a2     34.12    4.54 Estimable
##D   # a3     25.75    4.54 Estimable
##D 
##D 
##D # ----- Mcmcglmm model -----
##D # Use the point estimates from REML with a prior distribution
##D require(MCMCglmm)
##D prior2 = list(
##D   G = list(G1=list(V=62.40, nu=1),  G2=list(V=15.38, nu=1)),
##D   R = list(V = 9.4, nu=1)
##D   )
##D m2 <- MCMCglmm(y~ -1 + a + b + a:b,
##D                random=~ rep + a:rep, data=dat,
##D                pr=TRUE, # save random effects as columns of 'Sol'
##D                nitt=23000, # double the default 13000
##D                prior=prior2, verbose=FALSE)
##D 
##D # Now create a matrix of coefficients for the prediction.
##D # Each column is for a different prediction.  For example,
##D # the values in the column called 'a1a2n' are multiplied times
##D # the model coefficients (identified at the right side) to create
##D # the linear contrast for the the narrow-space predictions
##D # (also called adjusted mean) for the a1:a2 interaction.
##D #              a1n   a1i  a1b a1a2n a1a2ib
##D cm <- matrix(c(  1,   1,   1,    1,    1,   # a1
##D                  0,   0,   0,   -1,   -1,   # a2
##D                  0,   0,   0,    0,    0,   # a3
##D                1/2, 1/2, 1/2,    0,    0,   # b2
##D                  0,   0,   0,  -1/2,  -1/2, # a2:b2
##D                  0,   0,   0,    0,    0,   # a3:b2
##D                1/4, 1/4,   0,    0,    0,   # r1
##D                1/4, 1/4,   0,    0,    0,   # r2
##D                1/4, 1/4,   0,    0,    0,   # r3
##D                1/4, 1/4,   0,    0,    0,   # r4
##D                1/4,   0,   0,  1/4,    0,   # a1r1
##D                  0,   0,   0, -1/4,    0,   # a2r1
##D                  0,   0,   0,    0,    0,   # a3r1
##D                1/4,   0,   0,  1/4,    0,   # a1r2
##D                  0,   0,   0, -1/4,    0,   # a2r2
##D                  0,   0,   0,    0,    0,   # a3r2
##D                1/4,   0,   0,  1/4,    0,   # a1r3
##D                  0,   0,   0, -1/4,    0,   # a2r3
##D                  0,   0,   0,    0,    0,   # a3r3
##D                1/4,   0,   0,  1/4,    0,   # a1r4
##D                  0,   0,   0, -1/4,    0,   # a2r4
##D                  0,   0,   0,    0,    0),  # a3r4
##D              ncol=5, byrow=TRUE)
##D rownames(cm) <-   c("a1", "a2", "a3", "b2", "a2:b2", "a3:b2",
##D                     "r1", "r2", "r3", "r4",
##D                     "a1r1", "a1r2", "a1r3", "a1r4", "a2r1", "a2r2",
##D                     "a2r3", "a2r4", "a3r1", "a3r2",  "a3r3", "a3r4")
##D colnames(cm) <- c("A1n","A1i","A1b", "A1-A2n", "A1-A2ib")
##D print(cm)
##D # post2 <- as.mcmc(m2$Sol ##D 
##D post2 <- as.mcmc(crossprod(t(m2$Sol), cm))
##D 
##D # Following table has columns for A1 estimate (narrow, intermediate, broad)
##D # A1-A2 estimate (narrow and intermediat/broad).
##D # The REML estimates are from Stroup 1989.
##D est <- rbind("REML est"=c(32.88, 32.88, 32.88, -1.25, -1.25),
##D              "REML stderr"=c(1.08, 2.24, 4.54, 1.53, 3.17),
##D              "MCMC mode"=posterior.mode(post2),
##D              "MCMC stderr"=apply(post2, 2, sd))
##D round(est,2)
##D #               A1n   A1i   A1b A1-A2n A1-A2ib
##D # REML est    32.88 32.88 32.88  -1.25   -1.25
##D # REML stderr  1.08  2.24  4.54   1.53    3.17
##D # MCMC mode   32.95 32.38 31.96  -1.07   -1.17
##D # MCMC stderr  1.23  2.64  5.93   1.72    3.73
##D 
##D post22 <- make.groups(Narrow=post2[,1], Intermediate=post2[,2],
##D                       Broad=post2[,3])
##D print(densityplot(~data|which, data=post22, groups=which,
##D       cex=.25, lty=1, layout=c(1,3),
##D       xlab="MCMC model value of predictable function for A1"))
## End(Not run)



