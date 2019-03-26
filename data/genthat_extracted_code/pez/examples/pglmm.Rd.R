library(pez)


### Name: pglmm
### Title: Phylogenetic Generalised Linear Mixed Model for Community Data
### Aliases: communityPGLMM communityPGLMM.binary communityPGLMM.binary.LRT
###   communityPGLMM.gaussian communityPGLMM.matrix.structure
###   communityPGLMM.predicted.values pglmm plot.communityPGLMM
###   summary.communityPGLMM

### ** Examples

## Structure of examples:
# First, a (brief) description of model types, and how they are specified
# - these are *not* to be run 'as-is'; they show how models should be organised
# Second, a run-through of how to simulate, and then analyse, data
# - these *are* to be run 'as-is'; they show how to format and work with data

## Not run: 
##D #########################################################
##D #First section; brief summary of models and their use####
##D #########################################################
##D ## Model structures from Ives & Helmus (2011)
##D # dat = data set for regression (note: *not* an comparative.comm object)
##D # nspp = number of species
##D # nsite = number of sites
##D # Vphy = phylogenetic covariance matrix for species
##D # Vrepul = inverse of Vphy representing phylogenetic repulsion
##D 
##D # Model 1 (Eq. 1)
##D re.site <- list(1, site = dat$site, covar = diag(nsite))
##D re.sp.site <- list(1, sp = dat$sp, covar = Vphy, site = dat$site) # note: nested
##D z <- communityPGLMM(freq ~ sp, data = dat, family = "binomial", sp
##D = dat$sp, site = dat$site, random.effects = list(re.site,
##D re.sp.site), REML = TRUE, verbose = TRUE, s2.init=.1)
##D 
##D 
##D # Model 2 (Eq. 2)
##D re.site <- list(1, site = dat$site, covar = diag(nsite))
##D re.slope <- list(X, sp = dat$sp, covar = diag(nspp))
##D re.slopephy <- list(X, sp = dat$sp, covar = Vphy)
##D z <- communityPGLMM(freq ~ sp + X, data = dat, family = "binomial",
##D sp = dat$sp, site = dat$site, random.effects = list(re.site,
##D re.slope, re.slopephy), REML = TRUE, verbose = TRUE, s2.init=.1)
##D 
##D # Model 3 (Eq. 3)
##D re.site <- list(1, site = dat$site, covar = diag(nsite))
##D re.sp.site <- list(1, sp = dat$sp, covar = Vrepul, site = dat$site) # note: nested
##D z <- communityPGLMM(freq ~ sp*X, data = dat, family = "binomial",
##D sp = dat$sp, site = dat$site, random.effects = list(re.site,
##D re.sp.site), REML = TRUE, verbose = TRUE, s2.init=.1)
##D 
##D ## Model structure from Rafferty & Ives (2013) (Eq. 3)
##D # dat = data set
##D # npp = number of pollinators (sp)
##D # nsite = number of plants (site)
##D # VphyPol = phylogenetic covariance matrix for pollinators
##D # VphyPlt = phylogenetic covariance matrix for plants
##D 
##D re.a <- list(1, sp = dat$sp, covar = diag(nspp))
##D re.b <- list(1, sp = dat$sp, covar = VphyPol)
##D re.c <- list(1, sp = dat$sp, covar = VphyPol, dat$site)
##D re.d <- list(1, site = dat$site, covar = diag(nsite))
##D re.f <- list(1, site = dat$site, covar = VphyPlt)
##D re.g <- list(1, site = dat$site, covar = VphyPlt, dat$sp)
##D #term h isn't possible in this implementation, but can be done with
##D available matlab code
##D 
##D z <- communityPGLMM(freq ~ sp*X, data = dat, family = "binomial",
##D sp = dat$sp, site = dat$site, random.effects = list(re.a, re.b,
##D re.c, re.d, re.f, re.g), REML = TRUE, verbose = TRUE, s2.init=.1)
## End(Not run)

#########################################################
#Second section; detailed simulation and analysis #######
#NOTE: this section is explained and annotated in #######
#      detail in the vignette 'pez-pglmm-overview'#######
#      run 'vignette('pez-pglmm-overview') to read#######
#########################################################
# Generate simulated data for nspp species and nsite sites
nspp <- 15
nsite <- 10

# residual variance (set to zero for binary data)
sd.resid <- 0

# fixed effects
beta0 <- 0
beta1 <- 0

# magnitude of random effects
sd.B0 <- 1
sd.B1 <- 1

# whether or not to include phylogenetic signal in B0 and B1
signal.B0 <- TRUE
signal.B1 <- TRUE

# simulate a phylogenetic tree
phy <- rtree(n = nspp)
phy <- compute.brlen(phy, method = "Grafen", power = 0.5)

# standardize the phylogenetic covariance matrix to have determinant 1
Vphy <- vcv(phy)
Vphy <- Vphy/(det(Vphy)^(1/nspp))

# Generate environmental site variable
X <- matrix(1:nsite, nrow = 1, ncol = nsite)
X <- (X - mean(X))/sd(X)

# Perform a Cholesky decomposition of Vphy. This is used to
# generate phylogenetic signal: a vector of independent normal random
# variables, when multiplied by the transpose of the Cholesky
# deposition of Vphy will have covariance matrix equal to Vphy.

iD <- t(chol(Vphy))

# Set up species-specific regression coefficients as random effects
if (signal.B0 == TRUE) {
		b0 <- beta0 + iD %*% rnorm(nspp, sd = sd.B0)
} else {
		b0 <- beta0 + rnorm(nspp, sd = sd.B0)
}
if (signal.B1 == TRUE) {
		b1 <- beta1 + iD %*% rnorm(nspp, sd = sd.B1)
} else {
		b1 <- beta1 + rnorm(nspp, sd = sd.B1)
}

# Simulate species abundances among sites to give matrix Y that
# contains species in rows and sites in columns
y <- rep(b0, each=nsite)
y <- y + rep(b1, each=nsite) * rep(X, nspp)
y <- y + rnorm(nspp*nsite) #add some random 'error'
Y <- rbinom(length(y), size=1, prob=exp(y)/(1+exp(y)))
y <- matrix(outer(b0, array(1, dim = c(1, nsite))), nrow = nspp,
ncol = nsite) + matrix(outer(b1, X), nrow = nspp, ncol = nsite)
e <- rnorm(nspp * nsite, sd = sd.resid)
y <- y + matrix(e, nrow = nspp, ncol = nsite)
y <- matrix(y, nrow = nspp * nsite, ncol = 1)

Y <- rbinom(n = length(y), size = 1, prob = exp(y)/(1 + exp(y)))
Y <- matrix(Y, nrow = nspp, ncol = nsite)

# name the simulated species 1:nspp and sites 1:nsites
rownames(Y) <- 1:nspp
colnames(Y) <- 1:nsite

par(mfrow = c(3, 1), las = 1, mar = c(2, 4, 2, 2) - 0.1)
matplot(t(X), type = "l", ylab = "X", main = "X among sites")
hist(b0, xlab = "b0", main = "b0 among species")
hist(b1, xlab = "b1", main = "b1 among species")

#Plot out; you get essentially this from plot(your.pglmm.model)
image(t(Y), ylab = "species", xlab = "sites", main = "abundance",
col=c("black","white"))

# Transform data matrices into "long" form, and generate a data frame
YY <- matrix(Y, nrow = nspp * nsite, ncol = 1)

XX <- matrix(kronecker(X, matrix(1, nrow = nspp, ncol = 1)), nrow =
nspp * nsite, ncol = 1)

site <- matrix(kronecker(1:nsite, matrix(1, nrow = nspp, ncol =
1)), nrow = nspp * nsite, ncol = 1)
sp <- matrix(kronecker(matrix(1, nrow = nsite, ncol = 1), 1:nspp),
nrow = nspp * nsite, ncol = 1)

dat <- data.frame(Y = YY, X = XX, site = as.factor(site), sp = as.factor(sp))

# Format input and perform communityPGLMM()
# set up random effects

# random intercept with species independent
re.1 <- list(1, sp = dat$sp, covar = diag(nspp))

# random intercept with species showing phylogenetic covariances
re.2 <- list(1, sp = dat$sp, covar = Vphy)

# random slope with species independent
re.3 <- list(dat$X, sp = dat$sp, covar = diag(nspp))

# random slope with species showing phylogenetic covariances
re.4 <- list(dat$X, sp = dat$sp, covar = Vphy)

# random effect for site
re.site <- list(1, site = dat$site, covar = diag(nsite))

simple <- communityPGLMM(Y ~ X, data = dat, family = "binomial", sp
= dat$sp, site = dat$site, random.effects = list(re.site),
REML=TRUE, verbose=FALSE)

# The rest of these tests are not run to save CRAN server time;
# - please take a look at them because they're *very* useful!
## Not run: 
##D z.binary <- communityPGLMM(Y ~ X, data = dat, family = "binomial",
##D sp = dat$sp, site = dat$site, random.effects = list(re.1, re.2,
##D re.3, re.4), REML = TRUE, verbose = FALSE)
##D 
##D # output results
##D z.binary
##D plot(z.binary)
##D 
##D # test statistical significance of the phylogenetic random effect
##D # on species slopes using a likelihood ratio test
##D communityPGLMM.binary.LRT(z.binary, re.number = 4)$Pr
##D 
##D # extract the predicted values of Y
##D communityPGLMM.predicted.values(z.binary, show.plot = TRUE)
##D 
##D # examine the structure of the overall covariance matrix
##D communityPGLMM.matrix.structure(Y ~ X, data = dat, family =
##D "binomial", sp = dat$sp, site = dat$site, random.effects =
##D list(re.1, re.2, re.3, re.4))
##D 
##D # look at the structure of re.1
##D communityPGLMM.matrix.structure(Y ~ X, data = dat, family =
##D "binomial", sp = dat$sp, site = dat$site, random.effects =
##D list(re.1))
##D 
##D # compare results to glmer() when the model contains no
##D # phylogenetic covariance among species; the results should be
##D # similar.
##D communityPGLMM(Y ~ X, data = dat, family = "binomial", sp = dat$sp,
##D site = dat$site, random.effects = list(re.1, re.3), REML = FALSE,
##D verbose = FALSE)
##D 
##D # lmer
##D if(require(lme4)){
##D summary(glmer(Y ~ X + (1 | sp) + (0 + X | sp), data=dat, family =
##D "binomial"))
##D 
##D # compare results to lmer() when the model contains no phylogenetic
##D # covariance among species; the results should be similar.
##D communityPGLMM(Y ~ X, data = dat, family = "gaussian", sp = dat$sp,
##D site = dat$site, random.effects = list(re.1, re.3), REML = FALSE,
##D verbose = FALSE)
##D 
##D # lmer
##D summary(lmer(Y ~ X + (1 | sp) + (0 + X | sp), data=dat, REML = FALSE))
##D }
## End(Not run)



