context("migpdCoefs")

test_that("migpdCoefs behaves as it should", {
  skip_on_cran()
  library("MASS")
  liver <- liver
  liver$ndose <- as.numeric(liver$dose)
  
  ralt <- resid(rlm(log(ALT.M) ~ log(ALT.B) + ndose, data=liver))
  rast <- resid(rlm(log(AST.M) ~ log(AST.B) + ndose, data=liver))
  ralp <- resid(rlm(log(ALP.M) ~ log(ALP.B) + ndose, data=liver))
  rtbl <- resid(rlm(log(TBL.M) ~ log(TBL.B) + ndose, data=liver))
  
  rliver <- data.frame(alt=ralt, ast=rast, alp=ralp, tbl=rtbl, ndose=liver$ndose)
  
  Dmod <- migpd(rliver[rliver$ndose == 4, 1:4], mqu=.7) # Model for dose D
  
  oldALTco <- coef(Dmod)[3:4, 1]
  
  altgpd <- evm(alt, qu=.7, xi = ~ ndose, data=rliver)
  astgpd <- evm(ast, qu=.7, xi = ~ ndose, data=rliver)
  
  altco <- c(coef(altgpd)[1], coef(altgpd)[2] + 4 * coef(altgpd)[3])
  astco <- c(coef(astgpd)[1], coef(astgpd)[2] + 4 * coef(astgpd)[3])
  
  # Change one set of coefficients
  lmod <- migpdCoefs(Dmod, which="alt", list(altco))
  
  newALTco <- coef(lmod)[3:4, 1]
  newALTco[1] <- log(newALTco[1]) # For comparison with altco
  oldALTco[1] <- log(oldALTco[1])
  
  expect_equivalent(altco, newALTco,
                    label="migpdCoefs: change one set of coefficients")
  expect_true(all(newALTco!=oldALTco),
              label="migpdCoefs: change one set of coefficients")
  
  # Change 2 sets of coefficients at once
  
  lmod <- migpdCoefs(Dmod, which=c("alt", "ast"), coefs=list(altco, astco))
  
  newCo <- coef(lmod)[3:4, 1:2]
  oldCo <- coef(Dmod)[3:4, 1:2]
  
  newCo[1,] <- log(newCo[1,])
  oldCo[1,] <- log(oldCo[1,])
  
  expect_equal(c(cbind(altco, astco)), c(newCo),
               label="migpdCoefs: change two sets of coefficients at once")
  expect_true(all(newCo!=oldCo),
              label="migpdCoefs: change two set of  coefficients at once")
}
)
