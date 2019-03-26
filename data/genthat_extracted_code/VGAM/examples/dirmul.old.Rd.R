library(VGAM)


### Name: dirmul.old
### Title: Fitting a Dirichlet-Multinomial Distribution
### Aliases: dirmul.old
### Keywords: models regression

### ** Examples

# Data from p.50 of Lange (2002)
alleleCounts <- c(2, 84, 59, 41, 53, 131, 2, 0,
       0, 50, 137, 78, 54, 51, 0, 0,
       0, 80, 128, 26, 55, 95, 0, 0,
       0, 16, 40, 8, 68, 14, 7, 1)
dim(alleleCounts) <- c(8, 4)
alleleCounts <- data.frame(t(alleleCounts))
dimnames(alleleCounts) <- list(c("White","Black","Chicano","Asian"),
                    paste("Allele", 5:12, sep = ""))

set.seed(123)  # @initialize uses random numbers
fit <- vglm(cbind(Allele5,Allele6,Allele7,Allele8,Allele9,
                  Allele10,Allele11,Allele12) ~ 1, dirmul.old,
             trace = TRUE, crit = "c", data = alleleCounts)

(sfit <- summary(fit))
vcov(sfit)
round(eta2theta(coef(fit), fit@misc$link, fit@misc$earg), digits = 2)  # not preferred
round(Coef(fit), digits = 2)  # preferred
round(t(fitted(fit)), digits = 4)  # 2nd row of Table 3.5 of Lange (2002)
coef(fit, matrix = TRUE)


pfit <- vglm(cbind(Allele5,Allele6,Allele7,Allele8,Allele9,
                   Allele10,Allele11,Allele12) ~ 1,
             dirmul.old(parallel = TRUE), trace = TRUE,
             data = alleleCounts)
round(eta2theta(coef(pfit, matrix = TRUE), pfit@misc$link,
                pfit@misc$earg), digits = 2)  # 'Right' answer
round(Coef(pfit), digits = 2)  # 'Wrong' answer due to parallelism constraint



