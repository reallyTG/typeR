library(robustvarComp)


### Name: varComprob
### Title: Fitting variance component models using robust procedures
### Aliases: varComprob varComprob.fit
### Keywords: robust multivariate regression

### ** Examples

  if (!require(nlme))
    stop()
  data(Orthodont)

  z1 <- rep(1, 4)
  z2 <- c(8,10,12,14)
  K <- list()
  K[[1]] <- tcrossprod(z1,z1) ## Int
  K[[2]] <- tcrossprod(z1,z2) + tcrossprod(z2,z1) ## Int:age
  K[[3]] <- tcrossprod(z2,z2) ## age
  names(K) <- c("Int", "Int:age", "age")
  p <- 4
  n <- 27
  groups <- cbind(rep(1:p, each=n), rep((1:n), p))

  ## Not run: 
##D 
##D   ## Composite S
##D   OrthodontCompositeS <- varComprob(distance ~ age*Sex, groups = groups,
##D       data = Orthodont, varcov = K,
##D       control=varComprob.control(method="compositeS", lower=c(0,-Inf,0)))
##D   
## End(Not run)

  ## Composite Tau
  OrthodontCompositeTau <- varComprob(distance ~ age*Sex, groups = groups,
      data = Orthodont, varcov = K,
      control=varComprob.control(lower=c(0,-Inf,0)))

  ## Not run: 
##D 
##D   summary(OrthodontCompositeTau)
##D 
##D   ## Classic S
##D   OrthodontS <- varComprob(distance ~ age*Sex, groups = groups,
##D       data = Orthodont, varcov = K,
##D       control=varComprob.control(lower=c(0,-Inf,0),
##D       method="S", psi="rocke"))
##D 
##D   summary(OrthodontS)
##D   
## End(Not run)
  ## Not run: 
##D 
##D   if (!require(WWGbook))
##D     stop()
##D   if (!require(nlme))
##D     stop()
##D   data(autism)
##D   autism <- autism[complete.cases(autism),]
##D   completi <- table(autism$childid)==5
##D   completi <- names(completi[completi])
##D   indici <- as.vector(unlist(sapply(completi,
##D               function(x) which(autism$childid==x))))
##D   ind <- rep(FALSE, nrow(autism))
##D   ind[indici] <- TRUE
##D   autism <- subset(autism, subset=ind) ## complete cases 41
##D   attach(autism)
##D   sicdegp.f <- factor(sicdegp)
##D   age.f <- factor(age)
##D   age.2 <- age - 2
##D   sicdegp2 <- sicdegp
##D   sicdegp2[sicdegp == 3] <- 0
##D   sicdegp2[sicdegp == 2] <- 2 
##D   sicdegp2[sicdegp == 1] <- 1
##D   sicdegp2.f <- factor(sicdegp2)
##D   autism.updated <- subset(data.frame(autism, 
##D                     sicdegp2.f, age.2), !is.na(vsae))
##D   autism.grouped <- groupedData(vsae ~ age.2 | childid, 
##D                     data=autism.updated, order.groups = FALSE)
##D   p <- 5
##D   n <- 41
##D   z1 <- rep(1, p)
##D   z2 <- c(0, 1, 3, 7, 11)
##D   z3 <- z2^2
##D   K <- list()
##D   K[[1]] <- tcrossprod(z1,z1)
##D   K[[2]] <- tcrossprod(z2,z2)
##D   K[[3]] <- tcrossprod(z3,z3)
##D   K[[4]] <- tcrossprod(z1,z2) + tcrossprod(z2,z1)
##D   K[[5]] <- tcrossprod(z1,z3) + tcrossprod(z3,z1)
##D   K[[6]] <- tcrossprod(z3,z2) + tcrossprod(z2,z3)
##D   names(K) <- c("Int", "age", "age2", "Int:age", "Int:age2", "age:age2")
##D 
##D   groups <- cbind(rep(1:p, each=n), rep((1:n), p))
##D 
##D   ## Composite Tau
##D   AutismCompositeTau <- varComprob(vsae ~ age.2 + I(age.2^2)
##D     + sicdegp2.f + age.2:sicdegp2.f + I(age.2^2):sicdegp2.f, 
##D     groups = groups,
##D     data = autism.grouped, varcov = K,
##D     control=varComprob.control(
##D     lower=c(0.01,0.01,0.01,-Inf,-Inf,-Inf)))
##D 
##D   summary(AutismCompositeTau)
##D 
##D   ## Classic S
##D   AutismS <- varComprob(vsae ~ age.2 + I(age.2^2)
##D     + sicdegp2.f + age.2:sicdegp2.f + I(age.2^2):sicdegp2.f, 
##D     groups = groups,
##D     data = autism.grouped, varcov = K,
##D     control=varComprob.control(
##D     method="S", psi="rocke", cov.init="covOGK",
##D     lower=c(0.01,0.01,0.01,-Inf,-Inf,-Inf)))
##D   summary(AutismS)
##D   
## End(Not run)



