library(VGAM)


### Name: cqo
### Title: Fitting Constrained Quadratic Ordination (CQO)
### Aliases: cqo
### Keywords: models regression

### ** Examples

## Not run: 
##D # Example 1; Fit an unequal tolerances model to the hunting spiders data
##D hspider[,1:6] <- scale(hspider[,1:6])  # Standardized environmental variables
##D set.seed(1234)  # For reproducibility of the results
##D p1ut <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                   Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                   Trocterr, Zoraspin) ~
##D             WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D             fam = poissonff, data = hspider, Crow1positive = FALSE,
##D             eq.tol = FALSE)
##D sort(deviance(p1ut, history = TRUE))  # A history of all the iterations
##D if (deviance(p1ut) > 1177) warning("suboptimal fit obtained")
##D 
##D S <- ncol(depvar(p1ut))  # Number of species
##D clr <- (1:(S+1))[-7]  # Omits yellow
##D lvplot(p1ut, y = TRUE, lcol = clr, pch = 1:S, pcol = clr,
##D        las = 1)  # Ordination diagram
##D legend("topright", leg = colnames(depvar(p1ut)), col = clr,
##D        pch = 1:S, merge = TRUE, bty = "n", lty = 1:S, lwd = 2)
##D (cp <- Coef(p1ut))
##D 
##D (a <- latvar(cp)[cp@latvar.order])  # Ordered site scores along the gradient
##D # Names of the ordered sites along the gradient:
##D rownames(latvar(cp))[cp@latvar.order]
##D (aa <- Opt(cp)[, cp@Optimum.order])  # Ordered optimums along the gradient
##D aa <- aa[!is.na(aa)]  # Delete the species that is not unimodal
##D names(aa)  # Names of the ordered optimums along the gradient
##D 
##D trplot(p1ut, which.species = 1:3, log = "xy", type = "b", lty = 1, lwd = 2,
##D        col = c("blue","red","green"), label = TRUE) -> ii  # Trajectory plot
##D legend(0.00005, 0.3, paste(ii$species[, 1], ii$species[, 2], sep = " and "),
##D        lwd = 2, lty = 1, col = c("blue", "red", "green"))
##D abline(a = 0, b = 1, lty = "dashed")
##D 
##D S <- ncol(depvar(p1ut))  # Number of species
##D clr <- (1:(S+1))[-7]  # Omits yellow
##D persp(p1ut, col = clr, label = TRUE, las = 1)  # Perspective plot
##D 
##D 
##D # Example 2; Fit an equal tolerances model. Less numerically fraught.
##D set.seed(1234)
##D p1et <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                   Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                   Trocterr, Zoraspin) ~
##D             WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D             poissonff, data = hspider, Crow1positive = FALSE)
##D sort(deviance(p1et, history = TRUE))  # A history of all the iterations
##D if (deviance(p1et) > 1586) warning("suboptimal fit obtained")
##D S <- ncol(depvar(p1et))  # Number of species
##D clr <- (1:(S+1))[-7]  # Omits yellow
##D persp(p1et, col = clr, label = TRUE, las = 1)
##D 
##D 
##D # Example 3: A rank-2 equal tolerances CQO model with Poisson data
##D # This example is numerically fraught... need I.toler = TRUE too.
##D set.seed(555)
##D p2 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                 Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                 Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, Crow1positive = FALSE,
##D           I.toler = TRUE, Rank = 2, Bestof = 3, isd.latvar = c(2.1, 0.9))
##D sort(deviance(p2, history = TRUE))  # A history of all the iterations
##D if (deviance(p2) > 1127) warning("suboptimal fit obtained")
##D lvplot(p2, ellips = FALSE, label = TRUE, xlim = c(-3,4),
##D        C = TRUE, Ccol = "brown", sites = TRUE, scol = "grey",
##D        pcol = "blue", pch = "+", chull = TRUE, ccol = "grey")
##D 
##D 
##D # Example 4: species packing model with presence/absence data
##D set.seed(2345)
##D n <- 200; p <- 5; S <- 5
##D mydata <- rcqo(n, p, S, fam = "binomial", hi.abundance = 4,
##D                eq.tol = TRUE, es.opt = TRUE, eq.max = TRUE)
##D myform <- attr(mydata, "formula")
##D set.seed(1234)
##D b1et <- cqo(myform, binomialff(multiple.responses = TRUE, link = "cloglog"),
##D             data = mydata)
##D sort(deviance(b1et, history = TRUE))  # A history of all the iterations
##D lvplot(b1et, y = TRUE, lcol = 1:S, pch = 1:S, pcol = 1:S, las = 1)
##D Coef(b1et)
##D 
##D # Compare the fitted model with the 'truth'
##D cbind(truth = attr(mydata, "concoefficients"), fitted = concoef(b1et))
##D 
##D 
##D # Example 5: Plot the deviance residuals for diagnostic purposes
##D set.seed(1234)
##D p1et <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
##D                   Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
##D                   Trocterr, Zoraspin) ~
##D             WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D             poissonff, data = hspider, eq.tol = TRUE, trace = FALSE)
##D sort(deviance(p1et, history = TRUE))  # A history of all the iterations
##D if (deviance(p1et) > 1586) warning("suboptimal fit obtained")
##D S <- ncol(depvar(p1et))
##D par(mfrow = c(3, 4))
##D for (ii in 1:S) {
##D   tempdata <- data.frame(latvar1 = c(latvar(p1et)),
##D                          sppCounts = depvar(p1et)[, ii])
##D   tempdata <- transform(tempdata, myOffset = -0.5 * latvar1^2)
##D 
##D # For species ii, refit the model to get the deviance residuals
##D   fit1 <- vglm(sppCounts ~ offset(myOffset) + latvar1, poissonff,
##D                data = tempdata, trace = FALSE)
##D 
##D # For checking: this should be 0
##D # print("max(abs(c(Coef(p1et)@B1[1,ii],Coef(p1et)@A[ii,1])-coef(fit1)))")
##D # print( max(abs(c(Coef(p1et)@B1[1,ii],Coef(p1et)@A[ii,1])-coef(fit1))) )
##D 
##D # Plot the deviance residuals
##D   devresid <- resid(fit1, type = "deviance")
##D   predvalues <- predict(fit1) + fit1@offset
##D   ooo <- with(tempdata, order(latvar1))
##D   plot(predvalues + devresid ~ latvar1, data = tempdata, col = "red",
##D        xlab = "latvar1", ylab = "", main = colnames(depvar(p1et))[ii])
##D   with(tempdata, lines(latvar1[ooo], predvalues[ooo], col = "blue"))
##D }
## End(Not run)



