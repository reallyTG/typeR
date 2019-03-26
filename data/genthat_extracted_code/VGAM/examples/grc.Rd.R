library(VGAM)


### Name: grc
### Title: Row-Column Interaction Models including Goodman's RC Association
###   Model and Unconstrained Quadratic Ordination
### Aliases: grc rcim uqo
### Keywords: models regression

### ** Examples

# Example 1: Undergraduate enrolments at Auckland University in 1990
fitted(grc1 <- grc(auuc))
summary(grc1)

grc2 <- grc(auuc, Rank = 2, Index.corner = c(2, 5))
fitted(grc2)
summary(grc2)

model3 <- rcim(auuc, Rank = 1, fam = multinomial,
               M = ncol(auuc)-1, cindex = 2:(ncol(auuc)-1), trace = TRUE)
fitted(model3)
summary(model3)

# Median polish but not 100 percent reliable. Maybe call alaplace2()...
## Not run: 
##D rcim0 <- rcim(auuc, fam = alaplace1(tau = 0.5), trace=FALSE, maxit = 500)
##D round(fitted(rcim0), digits = 0)
##D round(100 * (fitted(rcim0) - auuc) / auuc, digits = 0)  # Discrepancy
##D depvar(rcim0)
##D round(coef(rcim0, matrix = TRUE), digits = 2)
##D Coef(rcim0, matrix = TRUE)
##D # constraints(rcim0)
##D names(constraints(rcim0))
##D 
##D # Compare with medpolish():
##D (med.a <- medpolish(auuc))
##D fv <- med.a$overall + outer(med.a$row, med.a$col, "+")
##D round(100 * (fitted(rcim0) - fv) / fv)  # Hopefully should be all 0s
## End(Not run)


# Example 2: 2012 Summer Olympic Games in London
## Not run: 
##D  top10 <- head(olym12, 10)
##D grc1.oly12 <- with(top10, grc(cbind(gold, silver, bronze)))
##D round(fitted(grc1.oly12))
##D round(resid(grc1.oly12, type = "response"), digits = 1)  # Resp. resids
##D summary(grc1.oly12)
##D Coef(grc1.oly12)
## End(Not run)


# Example 3: UQO; see Yee and Hadi (2014)
## Not run: 
##D n <- 100; p <- 5; S <- 10
##D pdata <- rcqo(n, p, S, es.opt = FALSE, eq.max = FALSE,
##D               eq.tol = TRUE, sd.latvar = 0.75)  # Poisson counts
##D true.nu <- attr(pdata, "latvar")  # The 'truth'; site scores
##D attr(pdata, "tolerances")  # The 'truth'; tolerances
##D 
##D Y <- Select(pdata, "y", sort = FALSE)  # Y matrix (n x S); the "y" vars
##D uqo.rcim1 <- rcim(Y, Rank = 1,
##D                   str0 = NULL,  # Delta covers entire n x M matrix
##D                   iindex = 1:nrow(Y),  # RRR covers the entire Y
##D                   has.intercept = FALSE)  # Suppress the intercept
##D 
##D # Plot 1
##D par(mfrow = c(2, 2))
##D plot(attr(pdata, "optimums"), Coef(uqo.rcim1)@A,
##D      col = "blue", type = "p", main = "(a) UQO optimums",
##D      xlab = "True optimums", ylab = "Estimated (UQO) optimums")
##D mylm <- lm(Coef(uqo.rcim1)@A ~ attr(pdata, "optimums"))
##D abline(coef = coef(mylm), col = "orange", lty = "dashed")
##D 
##D # Plot 2
##D fill.val <- NULL  # Choose this for the new parameterization
##D plot(attr(pdata, "latvar"), c(fill.val, concoef(uqo.rcim1)),
##D      las = 1, col = "blue", type = "p", main = "(b) UQO site scores",
##D      xlab = "True site scores", ylab = "Estimated (UQO) site scores" )
##D mylm <- lm(c(fill.val, concoef(uqo.rcim1)) ~ attr(pdata, "latvar"))
##D abline(coef = coef(mylm), col = "orange", lty = "dashed")
##D 
##D # Plots 3 and 4
##D myform <- attr(pdata, "formula")
##D p1ut <- cqo(myform, family = poissonff,
##D             eq.tol = FALSE, trace = FALSE, data = pdata)
##D c1ut <- cqo(Select(pdata, "y", sort = FALSE) ~ scale(latvar(uqo.rcim1)),
##D         family = poissonff, eq.tol = FALSE, trace = FALSE, data = pdata)
##D lvplot(p1ut, lcol = 1:S, y = TRUE, pcol = 1:S, pch = 1:S, pcex = 0.5,
##D        main = "(c) CQO fitted to the original data",
##D        xlab = "Estimated (CQO) site scores")
##D lvplot(c1ut, lcol = 1:S, y = TRUE, pcol = 1:S, pch = 1:S, pcex = 0.5,
##D        main = "(d) CQO fitted to the scaled UQO site scores",
##D        xlab = "Estimated (UQO) site scores")
## End(Not run)



