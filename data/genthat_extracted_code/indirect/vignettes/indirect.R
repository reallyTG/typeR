### R code from vignette source 'indirect.Rnw'

###################################################
### code chunk number 1: setup
###################################################
options(prompt = "R> ", continue = "+   ")


###################################################
### code chunk number 2: balanced
###################################################
X <- matrix(c(rep(1, 3), c(0, 1, 0), c(0, 0, 1)), nrow = 3,
            dimnames = list(designPt = 1:3,paste0("covar", 1:3)))
X
indirect::CNdiag(X)


###################################################
### code chunk number 3: unbalanced
###################################################
X <- matrix(c(rep(1, 3), c(0, 0.1, 0.9), c(0, 0, 1)), nrow = 3,
            dimnames = list(designPt = 1:3, paste0("covar", 1:3)))
X
indirect::CNdiag(X)


###################################################
### code chunk number 4: r
###################################################

set.seed(100)

# number of covariates
p <- 5

# mean  beta
mu <- rnorm(p)

# simulate covariance matrix from inverse Wishart
# diagonal scale matrix and p + 5 d.f. nu
alpha <- MASS::mvrnorm(p + 5, mu = rep(0, p), Sigma = diag(p)*50)
initial.icov <- t(alpha[1, , drop = FALSE])%*%alpha[1, , drop = FALSE]
for (i in 2:ncol(alpha)) {
  initial.icov <- initial.icov + 
    + t(alpha[i, , drop = FALSE])%*%alpha[i, , drop = FALSE]
}
Sigma <- chol2inv(chol(initial.icov))

# Design with independence priors:
# the following choice of design matrix produces
# independent conditional mean priors.
# Of course, in a real elicitation session the prior
# for beta is unknown and so this example is only for illustration.
# This implements an Independent Conditional Mean prior as
# defined by Bedrick et al. (1996), p. 1458.
P <- diag(p) # identity matrix used (could use any orthogonal transformation)
X <- P%*%solve(t(chol(Sigma)))
D <- diag(1/rnorm(p, -X%*%mu, 0.5)) # arbitrary diagonal matrix
X <- round(D%*%X, digits = 6)
rownames(X) <- paste("DesignPt", 1:nrow(X))
colnames(X) <- paste("Covariate", 1:ncol(X))
X

# elicited moments and quartiles
g.m <- X%*%mu
g.V <- X%*%Sigma%*%t(X)
g.theta.median <- qnorm(0.5, g.m, sqrt(diag(g.V)))
g.theta.lower <- qnorm(0.25, g.m, sqrt(diag(g.V)))
g.theta.upper <- qnorm(0.75, g.m, sqrt(diag(g.V)))

# The "perfect" elicitations are stored in the following matrix
# perfect expert has cloglog link function
perfect.elicitations <- 1 - exp(-exp(cbind(g.theta.lower, 
                                           g.theta.median, g.theta.upper)))
colnames(perfect.elicitations) <- c("lower", "median", "upper")
perfect.elicitations


###################################################
### code chunk number 5: initial
###################################################
# Initialise list with elicitation session information.
# Here design is the same as X but not usually the case, that is,
# the covariates presented to the expert may differ from
# the model design due to transformations, contrasts and coding.
# Setting CI.prob = 1/2 specifies that 0.5 probability is allocated to the
# central credible interval; the upper and lower bounds 
# of the central CI are then the upper and lower quartiles.
Z <- indirect::designLink(design = X, link = "cloglog", 
  target = "Target", CI.prob = 1/2,
  intro.comments = "This is a record of the elicitation session.",
  expertID = "Expert", facilitator = "Facilitator", 
  rapporteur = "none")
Z


###################################################
### code chunk number 6: r1
###################################################
# elicitations
# design point 1
indirect::plotDesignPoint(Z, design.pt = 1)


###################################################
### code chunk number 7: r1m
###################################################
# Example elicited fractiles are stored in perfect.elicitations
# In a real application, median would be entered as a numeric scalar that was
# contributed by the expert.
# CI.prob was initially set by designLink
Z <- indirect::elicitPt(Z, design.pt = 1, 
                        lower.CI.bound = NA,
                        median = perfect.elicitations[1, "median"],
                        upper.CI.bound = NA,
                        CI.prob = NULL)
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1))


###################################################
### code chunk number 8: r1l
###################################################
Z <- indirect::elicitPt(Z, design.pt = 1, 
                        lower.CI.bound = perfect.elicitations[1, "lower"],
                        median = perfect.elicitations[1, "median"],
                        upper.CI.bound = NA)
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1))


###################################################
### code chunk number 9: r1u
###################################################
Z <- indirect::elicitPt(Z, design.pt = 1, 
                        lower.CI.bound = perfect.elicitations[1, "lower"],
                        median = perfect.elicitations[1, "median"],
                        upper.CI.bound = perfect.elicitations[1, "upper"],
                        comment = "No major comments.")
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1))


###################################################
### code chunk number 10: r1a
###################################################
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = TRUE, fitted.curve = TRUE)


###################################################
### code chunk number 11: r1f
###################################################
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = c(1/10, 1/4, 1/2, 3/4, 9/10), fitted.curve = TRUE)


###################################################
### code chunk number 12: r1p
###################################################
indirect::plotDesignPoint(Z, design.pt = 1,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = c(1/10, 1/4, 1/2, 3/4, 9/10), fitted.curve = TRUE,
  estimated.probs = c(1/3, 0.5))


###################################################
### code chunk number 13: d2
###################################################
# Pefect elicitations now moving to tertiles for the second design point
g.tertiles.d2 <- qnorm(c(1/3, 2/3), g.m[2], sqrt(g.V[2, 2]))
# inverse link function
theta.tertiles.d2 <- 1 - exp(-exp(c(g.tertiles.d2)))

# tertiles only elicited without median
Z <- indirect::elicitPt(Z, design.pt = 2, CI.prob = 1/3,
                        lower.CI.bound = theta.tertiles.d2[1],
                        upper.CI.bound = theta.tertiles.d2[2],
     comment = "Switched to tertile method without median.")
indirect::plotDesignPoint(Z, design.pt = 2,   
  elicited.fractiles = TRUE, theta.bounds = c(0, 1),
  fitted.fractiles = c(1/10, 1/3, 1/2, 2/3, 9/10), fitted.curve = TRUE)


###################################################
### code chunk number 14: d2n
###################################################
Z$theta


###################################################
### code chunk number 15: all
###################################################
# All remaining elicitations are entered into the record 
# for this artificial elicitation example
Z$theta[3:nrow(perfect.elicitations), 1:3] <- 
  perfect.elicitations[3:nrow(perfect.elicitations), ]


###################################################
### code chunk number 16: muSig
###################################################
prior <- indirect::muSigma(Z, X = Z$design)
prior
# compare with original prior parameters defined above
all.equal(as.numeric(prior$mu), mu)
all.equal(prior$Sigma, Sigma, check.attributes = FALSE) # a small number


###################################################
### code chunk number 17: dln
###################################################
# perfect elicitions for design point 5
perfect.elicitations[5, ]
# jittered elicitations
d5.jittered <- c(0.2, 0.3, 0.35)

# plot jittered elicitation
Z <- indirect::elicitPt(Z, design.pt = 5, 
                        lower.CI.bound = d5.jittered[1],
                        median = d5.jittered[2],
                        upper.CI.bound = d5.jittered[3],
                        comment = "Jittered elicitation.")
indirect::plotDesignPoint(Z, design.pt = 5,   
  elicited.fractiles = TRUE, theta.bounds = NULL, 
  cumul.prob.bounds = c(0.05, 0.95),
  fitted.fractiles = c(1/10, 1/4, 1/2, 3/4, 9/10), 
  fitted.curve = TRUE
)


###################################################
### code chunk number 18: save (eval = FALSE)
###################################################
## # Not run:
## # for this example, create a temporary directory to store record
## tmp.rds <- tempfile(pattern = "record", fileext =".rds")
## # save record to this directory
## indirect::saveRecord(Z, 
##   conclusion.comments = "This concludes the elicitation record.",
##   file = tmp.rds)


###################################################
### code chunk number 19: share (eval = FALSE)
###################################################
## # Not run:
## tmpReport <- tempfile(pattern = "SessionSummary")
## indirect::makeSweave(filename.rds = tmp.rds, 
##            reportname = tmpReport,
##            title = "Elicitation session record", 
##            contact.details = "contact at email address",
##            fitted.fractiles = c(1/10, 1/4, 1/2, 3/4, 9/10))
## # change working directory to where the record RDS object was stored
## setwd(tempdir())
## utils::Sweave(paste0(tmpReport, ".Rnw"))
## tools::texi2pdf(paste0(tmpReport, ".tex"))


