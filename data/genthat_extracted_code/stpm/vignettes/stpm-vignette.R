## ---- message=FALSE, echo=FALSE------------------------------------------
library(knitcitations)
cleanbib()
options("citation_format" = "pandoc")
r<-citep("10.1016/0040-5809(77)90005-3") 
r<-citep("10.1016/j.mbs.2006.11.006")
r<-citep("10.1080/08898480590932296")
r<-citep("10.1007/s10522-006-9073-3")
r<-citep("10.1016/j.jtbi.2009.01.023")
r<-citep("10.3389/fpubh.2014.00228")
r<-citep("10.1002/gepi.22058")
r<-citep("10.3389/fpubh.2016.00003")
write.bibtex(file="references.bib")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("stpm")

## ----eval=FALSE----------------------------------------------------------
#  require(devtools)
#  devtools::install_github("izhbannikov/stpm")

## ----results='hide',warning=FALSE,echo=FALSE,message=FALSE---------------
library(stpm)
# Reading longitude data:
longdat <- read.csv(system.file("extdata","longdat.csv",package="stpm"))

## ----echo=FALSE----------------------------------------------------------
head(longdat)

## ---- echo=FALSE, message=FALSE------------------------------------------
data <- simdata_discr(N=1000, format="short")

## ---- echo=FALSE---------------------------------------------------------
head(data)

## ---- echo=FALSE, message=FALSE------------------------------------------
data <- simdata_discr(N=1000, format="long")

## ---- echo=FALSE---------------------------------------------------------
head(data)

## ------------------------------------------------------------------------
library(stpm)
data <- simdata_discr(N=10) # simulate data for 10 individuals, "long" format (default)
head(data)

## ------------------------------------------------------------------------
library(stpm)
data <- simdata_cont(N=5, format="short") # simulate data for 5 individuals, "short" format
head(data)

## ------------------------------------------------------------------------
library(stpm)
#Data simulation (200 individuals)
data <- simdata_discr(N=100)
#Estimation of parameters
pars <- spm_discrete(data)
pars

## ------------------------------------------------------------------------
library(stpm)
#Simulate some data for 50 individuals
data <- simdata_cont(N=50)
head(data)
#Estimate parameters
# a=-0.05, f1=80, Q=2e-8, f=80, b=5, mu0=2e-5, theta=0.08 are starting values for estimation procedure
pars <- spm_continuous(dat=data,a=-0.05, f1=80, Q=2e-8, f=80, b=5, mu0=2e-5, theta=0.08)
pars

## ------------------------------------------------------------------------
library(stpm)
#Data preparation:
n <- 10
data <- simdata_time_dep(N=n)
# Estimation:
opt.par <- spm_time_dep(data, 
                        start = list(a = -0.05, f1 = 80, Q = 2e-08, f = 80, b = 5, mu0 = 0.001), 
                        frm = list(at = "a", f1t = "f1", Qt = "Q", ft = "f", bt = "b", mu0t= "mu0"))
opt.par

## ------------------------------------------------------------------------
library(stpm)
data <- simdata_cont(N=10, ystart = 80, a = -0.1, Q = 1e-06, mu0 = 1e-5, theta = 0.08, f1 = 80, f=80, b=1, dt=1, sd0=5)
ans <- spm_continuous(dat=data,
                      a = -0.1,
                      f1 = 82, 
                      Q = 1.4e-6,
                      f = 77,
                      b = 1,
                      mu0 = 1.6e-5,
                      theta = 0.1,
                      stopifbound = FALSE,
                      lb=c(-0.2, 60, 0.1e-6, 60, 0.1, 0.1e-5, 0.01), 
                      ub=c(0, 140, 5e-06, 140, 3, 5e-5, 0.20))
ans

## ------------------------------------------------------------------------
library(stpm)

data <- simdata_cont(N=10, 
                     a=matrix(c(-0.1,  0.001, 0.001, -0.1), nrow = 2, ncol = 2, byrow = T),
                     f1=t(matrix(c(100, 200), nrow = 2, ncol = 1, byrow = F)),
                     Q=matrix(c(1e-06, 1e-7, 1e-7,  1e-06), nrow = 2, ncol = 2, byrow = T),
                     f=t(matrix(c(100, 200), nrow = 2, ncol = 1, byrow = F)),
                     b=matrix(c(1, 2), nrow = 2, ncol = 1, byrow = F),
                     mu0=1e-4,
                     theta=0.08,
                     ystart = c(100,200), sd0=c(5, 10), dt=1)

a.d <- matrix(c(-0.15,  0.002, 0.002, -0.15), nrow = 2, ncol = 2, byrow = T)
f1.d <- t(matrix(c(95, 195), nrow = 2, ncol = 1, byrow = F))
Q.d <- matrix(c(1.2e-06, 1.2e-7, 1.2e-7,  1.2e-06), nrow = 2, ncol = 2, byrow = T)
f.d <- t(matrix(c(105, 205), nrow = 2, ncol = 1, byrow = F))
b.d <- matrix(c(1, 2), nrow = 2, ncol = 1, byrow = F)
mu0.d <- 1.1e-4
theta.d <- 0.07

ans <- spm_continuous(dat=data,
                      a = a.d, 
                      f1 = f1.d,
                      Q = Q.d,
                      f = f.d,
                      b = b.d,
                      mu0 = mu0.d,
                      theta = theta.d,
                      lb=c(-0.5, ifelse(a.d[2,1] > 0, a.d[2,1]-0.5*a.d[2,1], a.d[2,1]+0.5*a.d[2,1]), ifelse(a.d[1,2] > 0, a.d[1,2]-0.5*a.d[1,2], a.d[1,2]+0.5*a.d[1,2]), -0.5,  
                           80, 100, 
                           Q.d[1,1]-0.5*Q.d[1,1], ifelse(Q.d[2,1] > 0, Q.d[2,1]-0.5*Q.d[2,1], Q.d[2,1]+0.5*Q.d[2,1]), ifelse(Q.d[1,2] > 0, Q.d[1,2]-0.5*Q.d[1,2], Q.d[1,2]+0.5*Q.d[1,2]), Q.d[2,2]-0.5*Q.d[2,2],
                           80, 100,
                           0.1, 0.5,
                           0.1e-4,
                           0.01),
                      ub=c(-0.08,  0.002,  0.002, -0.08,  
                           110, 220, 
                           Q.d[1,1]+0.1*Q.d[1,1], ifelse(Q.d[2,1] > 0, Q.d[2,1]+0.1*Q.d[2,1], Q.d[2,1]-0.1*Q.d[2,1]), ifelse(Q.d[1,2] > 0, Q.d[1,2]+0.1*Q.d[1,2], Q.d[1,2]-0.1*Q.d[1,2]), Q.d[2,2]+0.1*Q.d[2,2],
                           110, 220,
                           1.5, 2.5,
                           1.2e-4,
                           0.10))
ans


## ------------------------------------------------------------------------
n <- 10
data <- simdata_time_dep(N=n)
# Estimation:
opt.par <- spm_time_dep(data, start=list(a=-0.05, f1=80, Q=2e-08, f=80, b=5, mu0=0.001), 
                        lb=c(-1, 30, 1e-8, 30, 1, 1e-6), ub=c(0, 120, 5e-8, 130, 10, 1e-2))
opt.par



## ------------------------------------------------------------------------
library(stpm)
n <- 10
data <- simdata_time_dep(N=n)
# Estimation:
opt.par <- spm_time_dep(data, frm = list(at="a", f1t="f1", Qt="Q", ft="0", bt="b", mu0t="mu0"))
opt.par

## ------------------------------------------------------------------------

n <- 10
data <- simdata_time_dep(N=n)
# Temporarily commented below
# Estimation:
opt.par <- spm_time_dep(data, frm = list(at="a", f1t="f1", Qt="Q", ft="0", bt="b", mu0t="mu0"), 
                        start=list(a=-0.05, f1=80, Q=2e-08, b=5, mu0=0.001), 
                        lb=c(-1, 30, 1e-8, 1, 1e-6), ub=c(0, 120, 5e-8, 10, 1e-2))
opt.par


## ------------------------------------------------------------------------
library(stpm) 
dat <- simdata_cont(N=500)
colnames(dat) <- c("id", "xi", "t1", "t2", "y", "y.next")
res <- spm_con_1d(as.data.frame(dat), a=-0.05, b=2, q=1e-8, f=80, f1=90, mu0=1e-3, theta=0.08)
res

## ------------------------------------------------------------------------
library(stpm)
data <- simdata_discr(N=10)
head(data)

## ---- eval=T-------------------------------------------------------------
library(stpm)
data <- simdata_cont(N=10)
head(data)

## ---- eval=T-------------------------------------------------------------
library(stpm)
data <- sim_pobs(N=10)
head(data)

## ---- eval=T-------------------------------------------------------------
library(stpm)
#Generating data:
data <- sim_pobs(N=10)
head(data)
#Parameters estimation:
pars <- spm_pobs(x=data)
pars

## ---- eval=T-------------------------------------------------------------
library(stpm)
data.genetic <- sim_pobs(N=5, mode='observed')
head(data.genetic)
data.nongenetic <- sim_pobs(N=10, mode='unobserved')
head(data.nongenetic)
#Parameters estimation:
pars <- spm_pobs(x=data.genetic, y = data.nongenetic, mode='combined')
pars

## ---- eval=T-------------------------------------------------------------
library(stpm) 
data(ex_spmcon1dg)
head(ex_data$spm_data)
head(ex_data$gene_data)
res <- spm_con_1d_g(spm_data=ex_data$spm_data, 
                    gene_data=ex_data$gene_data, 
                    a = -0.02, b=0.2, q=0.01, f=3, f1=3, mu0=0.01, theta=1e-05, 
                    upper=c(-0.01,3,0.1,10,10,0.1,1e-05), lower=c(-1,0.01,0.00001,1,1,0.001,1e-07), 
                    effect=c('q'), method = "tnewton")
res

## ---- eval=TRUE, message=FALSE-------------------------------------------
library(stpm)

#######################################################################
############## One dimensional case (one covariate) ###################
#######################################################################

## Data preparation (short format)#
data <- simdata_discr(N=1000, dt = 2, format="short")

miss.id <- sample(x=dim(data)[1], size=round(dim(data)[1]/4)) # ~25% missing data
incomplete.data <- data
incomplete.data[miss.id,4] <- NA
# End of data preparation #

##### Multiple imputation with SPM #####
imp.data <- spm.impute(x=incomplete.data, id=1, case="xi", t1=3, covariates="y1", minp=1, theta_range=seq(0.075, 0.09, by=0.001))$imputed

##### Look at the incomplete data with missings #####
head(incomplete.data)

##### Look at the imputed data #####
head(imp.data)

#########################################################
################ Two-dimensional case ###################
#########################################################

## Parameters for data simulation #
a <- matrix(c(-0.05, 0.01, 0.01, -0.05), nrow=2)
f1 <- matrix(c(90, 30), nrow=1, byrow=FALSE)
Q <- matrix(c(1e-7, 1e-8, 1e-8, 1e-7), nrow=2)
f0 <- matrix(c(80, 25), nrow=1, byrow=FALSE)
b <- matrix(c(5, 3), nrow=2, byrow=TRUE)
mu0 <- 1e-04
theta <- 0.07
ystart <- matrix(c(80, 25), nrow=2, byrow=TRUE)

## Data preparation #
data <- simdata_discr(N=1000, a=a, f1=f1, Q=Q, f=f0, b=b, ystart=ystart, mu0 = mu0, theta=theta, dt=2, format="short")

## Delete some observations in order to have approx. 25% missing data
incomplete.data <- data
miss.id <- sample(x=dim(data)[1], size=round(dim(data)[1]/4)) 
incomplete.data <- data
incomplete.data[miss.id,4] <- NA
miss.id <- sample(x=dim(data)[1], size=round(dim(data)[1]/4)) 
incomplete.data[miss.id,5] <- NA
## End of data preparation #

###### Multiple imputation with SPM #####
imp.data <- spm.impute(x=incomplete.data, id=1, case="xi", t1=3, covariates=c("y1", "y2"), minp=1, theta_range=seq(0.060, 0.07, by=0.001))$imputed

###### Look at the incomplete data with missings #####
head(incomplete.data)

###### Look at the imputed data #####
head(imp.data)

## ------------------------------------------------------------------------
#library(stpm)
#data <- simdata_discr(N=100, format="long")
#res <- spm_discrete(data)
#splitted <- split(data, data$id)
#df <- data.frame()
#lapply(1:100, function(i) {df<<-rbind(df,splitted[[i]][dim(splitted[[i]])[1],c("id", "xi", "t1", "y1")])})
#names(df) <- c("id", "xi", "t", "y")
#predicted <- predict(object=res, data=df, dt=3)
#head(predicted)

## ---- eval=FALSE---------------------------------------------------------
#  library(stpm)
#  n <- 1000
#  
#  # Data simulation:
#  data <- simdata_time_dep(N=n, format="long")
#  head(data)
#  
#  # Hypotheses testing
#  
#  ## H01
#  res <- spm_time_dep(data, verbose=F,
#                      frm = list(at="a", f1t="f1", Qt="Q", ft="f", bt="b", mu0t="mu0"),
#                      start=list(a=-0.05, f1=80, Q=1e-8, f=90, b=5, mu0=0.001),
#                      lb=c(a=-1, f1=30, Q=1e-9, f=10, b=1, mu0=1e-6),
#                      ub=c(a=0, f1=120, Q=1e-7, f=150, b=10, mu0=1e-2),
#                      opts = list(algorithm = "NLOPT_LN_NELDERMEAD",
#                      maxeval = 200, ftol_rel = 1e-12), lrtest="H01")
#  
#  res$alternative$lr.test.pval
#  
#  ## H02
#  res <- spm_time_dep(data, verbose=F,
#                      frm = list(at="a", f1t="f1", Qt="1e-6", ft="f", bt="b", mu0t="mu0"),
#                      start=list(a=-0.05, f1=80, Q=1e-8, f=90, b=5, mu0=0.001),
#                      lb=c(a=-1, f1=30, Q=1e-9, f=10, b=1, mu0=1e-6),
#                      ub=c(a=0, f1=120, Q=1e-7, f=150, b=10, mu0=1e-2),
#                      opts = list(algorithm = "NLOPT_LN_NELDERMEAD",
#                      maxeval = 200, ftol_rel = 1e-12), lrtest="H02")
#  
#  res$alternative$lr.test.pval
#  
#  ## H03
#  res <- spm_time_dep(data, verbose=F,
#                      frm = list(at="a", f1t="f1", Qt="Q", ft="f", bt="b", mu0t="mu0"),
#                      start=list(a=-0.05, f1=80, Q=1e-8, f=90, b=5, mu0=0.001),
#                      ub=c(a=0, f1=120, Q=1e-7, f=150, b=10, mu0=1e-2),
#                      opts = list(algorithm = "NLOPT_LN_NELDERMEAD",
#                      maxeval = 200, ftol_rel = 1e-12), lrtest="H03")
#  
#  res$alternative$lr.test.pval
#  
#  ## H04
#  res <- spm_time_dep(data, verbose=F,
#                      frm = list(at="a", f1t="120", Qt="Q", ft="f", bt="b", mu0t="mu0"),
#                      start=list(a=-0.05, f1=80, Q=1e-8, f=90, b=5, mu0=0.001),
#                      lb=list(a=-1, f1=30, Q=1e-9, f=10, b=1, mu0=1e-6),
#                      opts = list(algorithm = "NLOPT_LN_NELDERMEAD",
#                      maxeval = 200, ftol_rel = 1e-12), lrtest="H04")
#  
#  res$alternative$lr.test.pval
#  
#  ## H05
#  res <- spm_time_dep(data, verbose=F,
#                      frm = list(at="-0.1", f1t="f1", Qt="Q", ft="f", bt="b", mu0t="mu0"),
#                      start=list(a=-0.05, f1=80, Q=1e-8, f=90, b=5, mu0=0.001),
#                      opts = list(algorithm = "NLOPT_LN_NELDERMEAD",
#                      maxeval = 200, ftol_rel = 1e-12), lrtest="H05")
#  
#  res$alternative$lr.test.pval

