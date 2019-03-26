context("Models")

n <- 100
m <- 10
p <- 5
k <- 2

X <- matrix(runif(n*p), n, p)
for (i in 1:n) for (j in 1:p) {
    if (runif(1) < 0.05) {
        X[i,j] <- NA
    }
}
X <- data.frame(X, as.factor(sample.int(k, n, replace=TRUE)))
colnames(X) <- c(paste0("x", 1:p), "g")

Y <- matrix(runif(n*m), n, m)
for (i in 1:n) for (j in 1:m) {
    if (runif(1) < 0.05) {
        Y[i,j] <- NA
    }
}

test_that("mlmer functions as expected", {
    require(lme4)

    ref.formula <- sprintf("Y[,1] ~ (1 | g) + %s",
                           paste(paste0("x", 1:p), collapse=" + "))
    ref <- lmer(as.formula(ref.formula), data=X, REML=FALSE,
                na.action=na.exclude)
    ref.coef <- coef(summary(ref))

    test.formula <- sprintf("Y ~ (1 | g) + %s",
                            paste(paste0("x", 1:p), collapse=" + "))
    test <- mlmer(as.formula(test.formula), data=X, save.residuals=TRUE,
                  save.ranks=TRUE)

    expect_is(test, "list")

    expect_named(test, c("nobs", "coefficients", "residuals", "ranef.ranks"),
                 ignore.order=TRUE)

    expect_equivalent(nobs(test)[1], nobs(ref))

    expect_equivalent(coef(test)[1,,"coef"], ref.coef[-1,"Estimate"])
    expect_equivalent(coef(test)[1,,"coef.se"], ref.coef[-1,"Std. Error"])
    for (i in 1:p) {
        ref0.formula <- update(as.formula(ref.formula), sprintf(". ~ . - x%s", i))
        idx <- !(1:n %in% attr(ref@frame, "na.action"))
        ref0 <- lmer(as.formula(ref0.formula), data=X, REML=FALSE, subset=idx)
        chisq <- 2 * max(0, logLik(ref) - logLik(ref0))
        df <- attr(logLik(ref), "df") - attr(logLik(ref0), "df")
        expect_equivalent(
            coef(test)[1,i,"pval"],
            pchisq(chisq, df, lower.tail=FALSE)
        )
    }

    expect_equivalent(resid(test)[,1], resid(ref))
})

