library(lavaan)


### Name: InformativeTesting methods
### Title: Methods for output InformativeTesting()
### Aliases: print.InformativeTesting plot.InformativeTesting

### ** Examples

## Not run: 
##D #########################
##D ### real data example ###
##D #########################
##D # Multiple group path model for facial burns example.
##D 
##D # model syntax with starting values.
##D   burns.model <- 'Selfesteem ~ Age + c(m1, f1)*TBSA + HADS +
##D                              start(-.10, -.20)*TBSA  
##D                  HADS ~ Age + c(m2, f2)*TBSA + RUM +
##D                         start(.10, .20)*TBSA '
##D  
##D  
##D # constraints syntax
##D  burns.constraints <- 'f2 > 0  ; m1 < 0
##D                        m2 > 0  ; f1 < 0
##D                        f2 > m2 ; f1 < m1'
##D  
##D # we only generate 2 bootstrap samples in this example; in practice
##D # you may wish to use a much higher number. 
##D # the double bootstrap was switched off; in practice you probably 
##D # want to set it to "standard".
##D example1 <- InformativeTesting(model = burns.model, data = FacialBurns,
##D                                R = 2, constraints = burns.constraints,
##D                                double.bootstrap = "no", group = "Sex")
##D example1
##D plot(example1)
##D 
##D ##########################
##D ### artificial example ###
##D ##########################
##D # Simple ANOVA model with 3 groups (N = 20 per group)
##D set.seed(1234)
##D Y <- cbind(c(rnorm(20,0,1), rnorm(20,0.5,1), rnorm(20,1,1)))
##D grp <- c(rep("1", 20), rep("2", 20), rep("3", 20))
##D Data <- data.frame(Y, grp)
##D 
##D #create model matrix
##D fit.lm <- lm(Y ~ grp, data = Data)
##D mfit <- fit.lm$model
##D mm <- model.matrix(mfit)
##D 
##D Y <- model.response(mfit)
##D X <- data.frame(mm[,2:3])
##D names(X) <- c("d1", "d2")
##D Data.new <- data.frame(Y, X)
##D 
##D # model
##D model <- 'Y ~ 1 + a1*d1 + a2*d2'
##D 
##D # fit without constraints
##D fit <- sem(model, data = Data.new)
##D 
##D # constraints syntax: mu1 < mu2 < mu3
##D constraints <- ' a1 > 0
##D                  a1 < a2 '
##D 
##D # we only generate 10 bootstrap samples in this example; in practice
##D # you may wish to use a much higher number, say > 1000. The double 
##D # bootstrap is not necessary in case of an univariate ANOVA model.
##D example2 <- InformativeTesting(model = model, data = Data.new, 
##D                                start = parTable(fit),
##D                                R = 10L, double.bootstrap = "no",
##D                                constraints = constraints)
##D example2
##D # plot(example2)
## End(Not run)



