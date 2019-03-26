library(copBasic)


### Name: GHcop
### Title: The Gumbel-Hougaard Extreme Value Copula
### Aliases: GHcop
### Keywords: Gumbel--Hougaard copula copula (formulas) copula Joe (2014)
###   Examples and Exercises Asymmetric Gumbel--Hougaard copula literature
###   errors and inconsistencies API to the copula package package copula
###   (comparison to) copula (extreme value) extreme value copula

### ** Examples

Theta <- 2.2 # Lets see if the numerical and analytical tail deps are the same.
del.lamU <- abs(taildepCOP(cop=GHcop, para=Theta)$lambdaU - (2-2^(1/Theta)))
as.logical(del.lamU < 1E-6) # TRUE
## Not run: 
##D # The simulations match Joe (2014, p. 72) for Gumbel-Hougaard
##D n <- 600; nsim <- 1000; set.seed(946) # see for reproducibility
##D SM <- sapply(1:nsim, function(i) { rs <- semicorCOP(cop=GHcop, para=1.35, n=n)
##D                                    c(rs$minus.semicor, rs$plus.semicor) })
##D RhoM     <- round(mean(SM[1,]),        digits=3)
##D RhoP     <- round(mean(SM[2,]),        digits=3)
##D SE.RhoM  <- round(sd(SM[1,]),          digits=3)
##D SE.RhoP  <- round(sd(SM[2,]),          digits=3)
##D SE.RhoMP <- round(sd(SM[2,] - SM[1,]), digits=3)
##D # Semi-correlations (sRho) and standard errors (SEs)
##D message("# sRho[-]=", RhoM, " (SE[-]=", SE.RhoM, ") Joe's=0.132 (SE[-]=0.08)")
##D message("# sRho[+]=", RhoP, " (SE[+]=", SE.RhoP, ") Joe's=0.415 (SE[+]=0.07)")
##D message("# SE(sRho[-] - sRho[+])=", SE.RhoMP, " Joe's SE=0.10")
##D # sRho[-]=0.134 (SE[-]=0.076) Joe's=0.132 (SE[-]=0.08)
##D # sRho[+]=0.407 (SE[+]=0.074) Joe's=0.415 (SE[+]=0.07)
##D # SE(sRho[-] - sRho[+])=0.107 Joe's SE=0.10
##D # Joe (2014, p. 72) reports the values 0.132, 0.415, 0.08, 0.07, 0.10, respectively.
## End(Not run)

## Not run: 
##D file <- "Lcomom_study_of_GHcopPLACKETTcop.txt"
##D x <- data.frame(tau=NA, trho=NA, srho=NA, PLtheta=NA, PLT2=NA, PLT3=NA, PLT4=NA,
##D                                           GHtheta=NA, GHT2=NA, GHT3=NA, GHT4=NA )
##D write.table(x, file=file, row.names=FALSE, quote=FALSE)
##D n <- 250 # Make a large number for very long CPU run but seems stable
##D for(tau in seq(0,0.98, by=0.005)) {
##D    thetag <- GHcop(u=NULL, v=NULL, tau=tau)$para
##D    trho <- rhoCOP(cop=GHcop, para=thetag)
##D    GH <- simCOP(n=n, cop=GHcop, para=thetag, points=FALSE, ploton=FALSE)
##D    srho <- cor(GH$U, GH$V, method="spearman")
##D    thetap <- PLACKETTpar(rho=trho)
##D    PL <- simCOP(n=n, cop=PLACKETTcop, para=thetap, points=FALSE, ploton=FALSE)
##D    GHl <- lmomco::lcomoms2(GH, nmom=4); PLl <- lmomco::lcomoms2(PL, nmom=4)
##D    x <- data.frame(tau=tau, trho=trho, srho=srho,
##D                    GHtheta=thetag, PLtheta=thetap,
##D                    GHT2=mean(c(GHl$T2[1,2], GHl$T2[2,1])),
##D                    GHT3=mean(c(GHl$T3[1,2], GHl$T3[2,1])),
##D                    GHT4=mean(c(GHl$T4[1,2], GHl$T4[2,1])),
##D                    PLT2=mean(c(PLl$T2[1,2], PLl$T2[2,1])),
##D                    PLT3=mean(c(PLl$T3[1,2], PLl$T3[2,1])),
##D                    PLT4=mean(c(PLl$T4[1,2], PLl$T4[2,1])) )
##D    write.table(x, file=file, row.names=FALSE, col.names=FALSE, append=TRUE)
##D }
##D 
##D # After a processing run with very large "n", then meaningful results exist.
##D D <- read.table(file, header=TRUE); D <- D[complete.cases(D),]
##D plot(D$tau, D$GHT3, ylim=c(-0.08,0.08), type="n",
##D      xlab="KENDALL TAU", ylab="L-COSKEW OR NEGATED L-COKURTOSIS")
##D points(D$tau,  D$GHT3, col=2);             points(D$tau,  D$PLT3, col=1)
##D points(D$tau, -D$GHT4, col=4, pch=2);      points(D$tau, -D$PLT4, col=1, pch=2)
##D LM3 <- lm(D$GHT3~I(D$tau^1)+I(D$tau^2)+I(D$tau^4)-1)
##D LM4 <- lm(D$GHT4~I(D$tau^1)+I(D$tau^2)+I(D$tau^4)-1)
##D LM3c <- LM3$coe; LM4c <- LM4$coe
##D Tau <- seq(0,1, by=.01); abline(0,0, lty=2, col=3)
##D lines(Tau,   0 + LM3c[1]*Tau^1 + LM3c[2]*Tau^2 + LM3c[3]*Tau^4,  col=4, lwd=3)
##D lines(Tau, -(0 + LM4c[1]*Tau^1 + LM4c[2]*Tau^2 + LM4c[3]*Tau^4), col=2, lwd=3) #
## End(Not run)

## Not run: 
##D # Let us compare the conditional simulation method of copBasic by numerics and by the
##D # above analytical solution for the Gumbel-Hougaard copula to two methods implemented
##D # by package gumbel, a presumed Archimedean technique by package acopula, and an
##D # Archimedean technique by package copula. Setting seeds by each "method" below does
##D # not appear diagnostic because of the differences in which the simulations are made.
##D nsim <- 10000; kn <- "kendall" #  The theoretical KENDALL TAU is (1.5-1)/1.5 = 1/3
##D # Simulate by conditional simulation using numerical derivative and then inversion
##D A <- cor(copBasic::simCOP(nsim, cop=GHcop, para=1.5, graphics=FALSE), method=kn)[1,2]
##D U <- runif(nsim) # GHcop.derCOPinv() comes from earlier in this documentation.
##D V <- sapply(1:nsim, function(i) { GHcop.derCOPinv(U[i], runif(1), para=1.5) })
##D # Simulate by conditional simulation using exact analytical solution
##D B <- cor(U, y=V, method=kn);  rm(U, V)
##D # Simulate by the "common frailty" technique
##D C <- cor(gumbel::rgumbel(nsim, 1.5, dim=2, method=1), method=kn)[1,2]
##D # Simulate by "K function" (Is the K function method, Archimedean?)
##D D <- cor(gumbel::rgumbel(nsim, 1.5, dim=2, method=2), method=kn)[1,2]
##D # Simulate by an Archimedean implementation (presumably)
##D E <- cor(acopula::rCopula(nsim, pars=1.5), method=kn)[1,2]
##D # Simulate by an Archimedean implementation
##D G <- cor(copula::rCopula(nsim, copula::gumbelCopula(1.5)), method=kn)[1,2]
##D K <- round(c(A, B, C, D, E, G), digits=5); rm(A, B, C, D, E, G, kn); tx <- ", "
##D message("Kendall's Tau: ", K[1], tx, K[2], tx, K[3], tx, K[4], tx, K[5], tx, K[6])
##D # Kendall's Tau: 0.32909, 0.32474, 0.33060, 0.32805, 0.32874, 0.33986 -- run 1
##D # Kendall's Tau: 0.33357, 0.32748, 0.33563, 0.32913, 0.32732, 0.32416 -- run 2
##D # Kendall's Tau: 0.34311, 0.33415, 0.33815, 0.33224, 0.32961, 0.33008 -- run 3
##D # Kendall's Tau: 0.32830, 0.33573, 0.32756, 0.33401, 0.33567, 0.33182 -- nsim=50000!
##D # All solutions are near 1/3 and it is unknown without further study which of the
##D # six methods would result in the least bias and (or) sampling variability.
## End(Not run)



