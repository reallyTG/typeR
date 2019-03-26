library(CDM)


### Name: din
### Title: Parameter Estimation for Mixed DINA/DINO Model
### Aliases: din print.din
### Keywords: Cognitive Diagnosis Models DINA DINO print

### ** Examples

#############################################################################
# EXAMPLE 1: Examples based on dataset fractions.subtraction.data
#############################################################################

## dataset fractions.subtraction.data and corresponding Q-Matrix
head(fraction.subtraction.data)
fraction.subtraction.qmatrix

## Misspecification in parameter specification for method CDM::din()
## leads to warnings and terminates estimation procedure. E.g.,

# See Q-Matrix specification
fractions.dina.warning1 <- CDM::din(data=fraction.subtraction.data,
  q.matrix=t(fraction.subtraction.qmatrix))

# See guess.init specification
fractions.dina.warning2 <- CDM::din(data=fraction.subtraction.data,
  q.matrix=fraction.subtraction.qmatrix, guess.init=rep(1.2,
  ncol(fraction.subtraction.data)))

# See rule specification
fractions.dina.warning3 <- CDM::din(data=fraction.subtraction.data,
  q.matrix=fraction.subtraction.qmatrix, rule=c(rep("DINA",
  10), rep("DINO", 9)))

## Parameter estimation of DINA model
# rule="DINA" is default
fractions.dina <- CDM::din(data=fraction.subtraction.data,
  q.matrix=fraction.subtraction.qmatrix, rule="DINA")
attributes(fractions.dina)
str(fractions.dina)

## For instance assessing the guessing parameters through
## assignment
fractions.dina$guess

## corresponding summaries, including IDI,
## most frequent skill classes and information
## criteria AIC and BIC
summary(fractions.dina)

## In particular, assessing detailed summary through assignment
detailed.summary.fs <- summary(fractions.dina)
str(detailed.summary.fs)

## Item discrimination index of item 8 is too low. This is also
## visualized in the first plot
plot(fractions.dina)

## The reason therefore is a high guessing parameter
round(fractions.dina$guess[,1], 2)

## Estimate DINA model with different random initial parameters using seed=1345
fractions.dina1 <- CDM::din(data=fraction.subtraction.data,
  q.matrix=fraction.subtraction.qmatrix, rule="DINA", seed=1345)

## Fix the guessing parameters of items 5, 8 and 9 equal to .20
# define a constraint.guess matrix
constraint.guess <-  matrix(c(5,8,9, rep(0.2, 3)), ncol=2)
fractions.dina.fixed <- CDM::din(data=fraction.subtraction.data,
  q.matrix=fraction.subtraction.qmatrix,
  constraint.guess=constraint.guess)

## The second plot shows the expected (MAP) and observed skill
## probabilities. The third plot visualizes the skill class
## occurrence probabilities; Only the 'top.n.skill.classes' most frequent
## skill classes are labeled; it is obvious that the skill class '11111111'
## (all skills are mastered) is the most probable in this population.
## The fourth plot shows the skill probabilities conditional on response
## patterns; in this population the skills 3 and 6 seem to be
## mastered easier than the others. The fourth plot shows the
## skill probabilities conditional on a specified response
## pattern; it is shown whether a skill is mastered (above
## .5+'uncertainty') unclassifiable (within the boundaries) or
## not mastered (below .5-'uncertainty'). In this case, the
## 527th respondent was chosen; if no response pattern is
## specified, the plot will not be shown (of course)
pattern <- paste(fraction.subtraction.data[527, ], collapse="")
plot(fractions.dina, pattern=pattern, display.nr=4)

#uncertainty=0.1, top.n.skill.classes=6 are default
plot(fractions.dina.fixed, uncertainty=0.1, top.n.skill.classes=6,
  pattern=pattern)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Examples based on dataset sim.dina
##D #############################################################################
##D 
##D # DINA Model
##D d1 <- CDM::din(sim.dina, q.matr=sim.qmatrix, rule="DINA",
##D   conv.crit=0.01, maxit=500, progress=TRUE)
##D summary(d1)
##D 
##D # DINA model with hierarchical skill classes (Hierarchical DINA model)
##D # 1st step:  estimate an initial full model to look at the indexing
##D #    of skill classes
##D d0 <- CDM::din(sim.dina, q.matr=sim.qmatrix, maxit=1)
##D d0$attribute.patt.splitted
##D #      [,1] [,2] [,3]
##D # [1,]    0    0    0
##D # [2,]    1    0    0
##D # [3,]    0    1    0
##D # [4,]    0    0    1
##D # [5,]    1    1    0
##D # [6,]    1    0    1
##D # [7,]    0    1    1
##D # [8,]    1    1    1
##D #
##D # In this example, following hierarchical skill classes are only allowed:
##D # 000, 001, 011, 111
##D # We define therefore a vector of indices for skill classes with
##D # zero probabilities (see entries in the rows of the matrix
##D # d0$attribute.patt.splitted above)
##D zeroprob.skillclasses <- c(2,3,5,6)     # classes 100, 010, 110, 101
##D # estimate the hierarchical DINA model
##D d1a <- CDM::din(sim.dina, q.matr=sim.qmatrix,
##D           zeroprob.skillclasses=zeroprob.skillclasses )
##D summary(d1a)
##D 
##D # Mixed DINA and DINO Model
##D d1b <- CDM::din(sim.dina, q.matr=sim.qmatrix, rule=
##D           c(rep("DINA", 7), rep("DINO", 2)), conv.crit=0.01,
##D           maxit=500, progress=FALSE)
##D summary(d1b)
##D 
##D # DINO Model
##D d2 <- CDM::din(sim.dina, q.matr=sim.qmatrix, rule="DINO",
##D   conv.crit=0.01, maxit=500, progress=FALSE)
##D summary(d2)
##D 
##D # Comparison of DINA and DINO estimates
##D lapply(list("guessing"=rbind("DINA"=d1$guess[,1],
##D   "DINO"=d2$guess[,1]), "slipping"=rbind("DINA"=
##D   d1$slip[,1], "DINO"=d2$slip[,1])), round, 2)
##D 
##D # Comparison of the information criteria
##D c("DINA"=d1$AIC, "MIXED"=d1b$AIC, "DINO"=d2$AIC)
##D 
##D # following estimates:
##D d1$coef            # guessing and slipping parameter
##D d1$guess           # guessing parameter
##D d1$slip            # slipping parameter
##D d1$skill.patt      # probabilities for skills
##D d1$attribute.patt  # skill classes with probabilities
##D d1$subj.pattern    # pattern per subject
##D 
##D # posterior probabilities for every response pattern
##D d1$posterior
##D 
##D # Equal guessing parameters
##D d2a <- CDM::din( data=sim.dina, q.matrix=sim.qmatrix,
##D             guess.equal=TRUE, slip.equal=FALSE )
##D d2a$coef
##D 
##D # Equal guessing and slipping parameters
##D d2b <- CDM::din( data=sim.dina, q.matrix=sim.qmatrix,
##D             guess.equal=TRUE, slip.equal=TRUE )
##D d2b$coef
##D 
##D #############################################################################
##D # EXAMPLE 3: Examples based on dataset sim.dino
##D #############################################################################
##D 
##D # DINO Estimation
##D d3 <- CDM::din(sim.dino, q.matr=sim.qmatrix, rule="DINO",
##D         conv.crit=0.005, progress=FALSE)
##D 
##D # Mixed DINA and DINO Model
##D d3b <- CDM::din(sim.dino, q.matr=sim.qmatrix,
##D           rule=c(rep("DINA", 4), rep("DINO", 5)), conv.crit=0.001,
##D           progress=FALSE)
##D 
##D # DINA Estimation
##D d4 <- CDM::din(sim.dino, q.matr=sim.qmatrix, rule="DINA",
##D   conv.crit=0.005, progress=FALSE)
##D 
##D # Comparison of DINA and DINO estimates
##D lapply(list("guessing"=rbind("DINO"=d3$guess[,1],  "DINA"=d4$guess[,1]),
##D        "slipping"=rbind("DINO"=d3$slip[,1], "DINA"=d4$slip[,1])), round, 2)
##D 
##D # Comparison of the information criteria
##D c("DINO"=d3$AIC, "MIXED"=d3b$AIC, "DINA"=d4$AIC)
##D 
##D #############################################################################
##D # EXAMPLE 4: Example estimation with weights based on dataset sim.dina
##D #############################################################################
##D 
##D # Here, a weighted maximum likelihood estimation is used
##D # This could be useful for survey data.
##D 
##D # i.e. first 200 persons have weight 2, the other have weight 1
##D (weights <- c(rep(2, 200), rep(1, 200)))
##D 
##D d5 <- CDM::din(sim.dina, sim.qmatrix, rule="DINA", conv.crit=
##D   0.005, weights=weights, progress=FALSE)
##D 
##D # Comparison of the information criteria
##D c("DINA"=d1$AIC, "WEIGHTS"=d5$AIC)
##D 
##D #############################################################################
##D # EXAMPLE 5: Example estimation within a balanced incomplete
##D ##           block (BIB) design generated on dataset sim.dina
##D #############################################################################
##D 
##D # generate BIB data
##D 
##D # The next example shows that the din function works for
##D # (relatively arbitrary) missing value pattern
##D 
##D # Here, a missing by design is generated in the dataset dinadat.bib
##D sim.dina.bib <- sim.dina
##D sim.dina.bib[1:100, 1:3] <- NA
##D sim.dina.bib[101:300, 4:8] <- NA
##D sim.dina.bib[301:400, c(1,2,9)] <- NA
##D 
##D d6 <- CDM::din(sim.dina.bib, sim.qmatrix, rule="DINA",
##D          conv.crit=0.0005, weights=weights, maxit=200)
##D 
##D d7 <- CDM::din(sim.dina.bib, sim.qmatrix, rule="DINO",
##D          conv.crit=0.005, weights=weights)
##D 
##D # Comparison of DINA and DINO estimates
##D lapply(list("guessing"=rbind("DINA"=d6$guess[,1],
##D   "DINO"=d7$guess[,1]), "slipping"=rbind("DINA"=
##D   d6$slip[,1], "DINO"=d7$slip[,1])), round, 2)
##D 
##D #############################################################################
##D # EXAMPLE 6: DINA model with attribute hierarchy
##D #############################################################################
##D 
##D set.seed(987)
##D # assumed skill distribution: P(000)=P(100)=P(110)=P(111)=.245 and
##D #     "deviant pattern": P(010)=.02
##D K <- 3 # number of skills
##D 
##D # define alpha
##D alpha <- scan()
##D     0 0 0
##D     1 0 0
##D     1 1 0
##D     1 1 1
##D     0 1 0
##D 
##D alpha <- matrix( alpha, length(alpha)/K, K, byrow=TRUE )
##D alpha <- alpha[ c( rep(1:4,each=245), rep(5,20) ),  ]
##D 
##D # define Q-matrix
##D q.matrix <- scan()
##D     1 0 0   1 0 0   1 0 0
##D     0 1 0   0 1 0   0 1 0
##D     0 0 1   0 1 0   0 0 1
##D     1 1 0   1 0 1   0 1 1
##D 
##D q.matrix <- matrix( q.matrix, nrow=length(q.matrix)/K, ncol=K, byrow=TRUE )
##D 
##D # simulate DINA data
##D dat <- CDM::sim.din( alpha=alpha, q.matrix=q.matrix )$dat
##D 
##D #*** Model 1: estimate DINA model | no skill space restriction
##D mod1 <- CDM::din( dat, q.matrix )
##D 
##D #*** Model 2: DINA model | hierarchy A2 > A3
##D B <- "A2 > A3"
##D skill.names <- paste0("A",1:3)
##D skillspace <- CDM::skillspace.hierarchy( B, skill.names )$skillspace.reduced
##D mod2 <- CDM::din( dat, q.matrix, skillclasses=skillspace )
##D 
##D #*** Model 3: DINA model | linear hierarchy A1 > A2 > A3
##D #   This is a misspecied model because due to P(010)=.02 the relation A1>A2
##D #   does not hold.
##D B <- "A1 > A2
##D       A2 > A3"
##D skill.names <- paste0("A",1:3)
##D skillspace <- CDM::skillspace.hierarchy( B, skill.names )$skillspace.reduced
##D mod3 <- CDM::din( dat, q.matrix, skillclasses=skillspace )
##D 
##D #*** Model 4: 2PL model in gdm
##D mod4 <- CDM::gdm( dat, theta.k=seq(-5,5,len=21),
##D            decrease.increments=TRUE, skillspace="normal" )
##D summary(mod4)
##D 
##D anova(mod1,mod2)
##D   ##       Model   loglike Deviance Npars      AIC      BIC  Chisq df       p
##D   ##   2 Model 2 -7052.460 14104.92    29 14162.92 14305.24 0.9174  2 0.63211
##D   ##   1 Model 1 -7052.001 14104.00    31 14166.00 14318.14     NA NA      NA
##D 
##D anova(mod2,mod3)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df       p
##D   ##   2 Model 2 -7059.058 14118.12    27 14172.12 14304.63 13.19618  2 0.00136
##D   ##   1 Model 1 -7052.460 14104.92    29 14162.92 14305.24       NA NA      NA
##D 
##D anova(mod2,mod4)
##D   ##       Model  loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -7220.05 14440.10    24 14488.10 14605.89 335.1805  5  0
##D   ##   1 Model 1 -7052.46 14104.92    29 14162.92 14305.24       NA NA NA
##D 
##D # compare fit statistics
##D summary( CDM::modelfit.cor.din( mod2 ) )
##D summary( CDM::modelfit.cor.din( mod4 ) )
##D 
##D #############################################################################
##D # EXAMPLE 7: Fitting the basic local independence model (BLIM) with din
##D #############################################################################
##D 
##D library(pks)
##D data(DoignonFalmagne7, package="pks")
##D   ##  str(DoignonFalmagne7)
##D   ##    $ K  : int [1:9, 1:5] 0 1 0 1 1 1 1 1 1 0 ...
##D   ##     ..- attr(*, "dimnames")=List of 2
##D   ##     .. ..$ : chr [1:9] "00000" "10000" "01000" "11000" ...
##D   ##     .. ..$ : chr [1:5] "a" "b" "c" "d" ...
##D   ##    $ N.R: Named int [1:32] 80 92 89 3 2 1 89 16 18 10 ...
##D   ##     ..- attr(*, "names")=chr [1:32] "00000" "10000" "01000" "00100" ...
##D 
##D # The idea is to fit the local independence model with the din function.
##D # This can be accomplished by specifying a DINO model with
##D # prespecified skill classes.
##D 
##D # extract dataset
##D dat <- as.numeric( unlist( sapply( names(DoignonFalmagne7$N.R),
##D     FUN=function( ll){ strsplit( ll, split="") } ) ) )
##D dat <- matrix( dat, ncol=5, byrow=TRUE )
##D colnames(dat) <- colnames(DoignonFalmagne7$K)
##D rownames(dat) <- names(DoignonFalmagne7$N.R)
##D 
##D # sample weights
##D weights <- DoignonFalmagne7$N.R
##D 
##D # define Q-matrix
##D q.matrix <- t(DoignonFalmagne7$K)
##D v1 <- colnames(q.matrix) <- paste0("S", colnames(q.matrix))
##D q.matrix <- q.matrix[, - 1] # remove S00000
##D 
##D # define skill classes
##D SC <- ncol(q.matrix)
##D skillclasses <- matrix( 0, nrow=SC+1, ncol=SC)
##D colnames(skillclasses) <- colnames(q.matrix)
##D rownames(skillclasses) <- v1
##D skillclasses[ cbind( 2:(SC+1), 1:SC ) ] <- 1
##D 
##D # estimate BLIM with din function
##D mod1 <- CDM::din(data=dat, q.matrix=q.matrix, skillclasses=skillclasses,
##D             rule="DINO", weights=weights   )
##D summary(mod1)
##D   ##   Item parameters
##D   ##     item guess  slip   IDI rmsea
##D   ##   a    a 0.158 0.162 0.680 0.011
##D   ##   b    b 0.145 0.159 0.696 0.009
##D   ##   c    c 0.008 0.181 0.811 0.001
##D   ##   d    d 0.012 0.129 0.859 0.001
##D   ##   e    e 0.025 0.146 0.828 0.007
##D 
##D # estimate basic local independence model with pks package
##D mod2 <- pks::blim(K, N.R, method="ML") # maximum likelihood estimation by EM algorithm
##D mod2
##D   ##   Error and guessing parameters
##D   ##         beta      eta
##D   ##   a 0.164871 0.103065
##D   ##   b 0.163113 0.095074
##D   ##   c 0.188839 0.000004
##D   ##   d 0.079835 0.000003
##D   ##   e 0.088648 0.019910
## End(Not run)



