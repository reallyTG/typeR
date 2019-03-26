context("Models")

n <- 100
m <- 10
p <- 5
k <- 2

X <- as.data.frame(matrix(runif(n*p), n, p))
colnames(X) <- paste0("x", 1:p)
for (i in 1:n) for (j in 1:p) {
    if (runif(1) < 0.05) {
        X[i,j] <- NA
    }
}

g <- as.factor(sample.int(k, n, replace=TRUE))

Y <- matrix(runif(n*m), n, m)
colnames(Y) <- paste0("y", 1:m)
for (i in 1:n) for (j in 1:m) {
    if (runif(1) < 0.05) {
        Y[i,j] <- NA
    }
}

ref.nobs <- structure(rep(NA, ncol(Y)), names=colnames(Y))

ref.coef <- matrix(NA, m, 3,
                   dimnames=list(colnames(Y), c("coef", "coef.se", "pval")))
ref.coef <- as.data.frame(ref.coef)

ref.resid <- matrix(NA, n, m, dimnames=dimnames(Y))

for (i in 1:m) {
    y <- Y[,i]
    model <- lm(y ~ ., data=X, na.action=na.exclude)
    coefs <- coef(summary(model))

    ref.nobs[i] <- nobs(model)

    ref.coef[i,"coef"] <- coefs["x1","Estimate"]
    ref.coef[i,"coef.se"] <- coefs["x1","Std. Error"]
    ref.coef[i,"pval"] <- coefs["x1","Pr(>|t|)"]

    ref.resid[,i] <- resid(model, type="response")
}

test_that("mlm functions as expected", {
    test.formula <- sprintf("Y ~ %s", paste(paste0("x", 1:p), collapse=" + "))
    test <- mlm(as.formula(test.formula), data=X, save.residuals=TRUE)

    expect_is(test, "list")

    expect_named(test, c("nobs", "coefficients", "residuals"),
                 ignore.order=TRUE)

    expect_equivalent(nobs(test)[1], ref.nobs[1])

    expect_equivalent(coef(test)[,1,"coef"], ref.coef[,"coef"])
    expect_equivalent(coef(test)[,1,"coef.se"], ref.coef[,"coef.se"])
    expect_equivalent(coef(test)[,1,"pval"], ref.coef[,"pval"])

    expect_equivalent(resid(test), ref.resid)
})

test_that("mlm accepts `.` in formulae", {
    test <- mlm(Y ~ ., data=X, vars="x1")
    expect_is(test, "list")
    expect_named(test, c("nobs", "coefficients"), ignore.order=TRUE)
    expect_equivalent(nobs(test), ref.nobs)
    expect_equivalent(coef(test), ref.coef)
})

test_that("mlm accepts `.` in formulae ", {
    test <- mlm(Y ~ ., data=X, vars="", save.residuals=TRUE)
    expect_is(test, "list")
    expect_named(test, c("nobs", "residuals"), ignore.order=TRUE)
    expect_equivalent(nobs(test), ref.nobs)
    expect_equivalent(resid(test), ref.resid)
})

