cat("\ntest spaMM_glm:")
# salamander

x <- c(43.6,46.5,21.7,18.6,17.3,16.7)
y <- c(2420,708,39.6,16.7,46.7,10.8)
res <-  spaMM_glm(y~ x,data=data.frame(x,y),family=Gamma())

testthat::expect_equal(logLik(res)[1],-37.41405,tolerance=1e-5)
