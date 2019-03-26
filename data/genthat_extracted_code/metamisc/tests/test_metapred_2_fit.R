context("metapred 2. Stratified fitting")

### Some stuff necessary for testing
# The data
set.seed(8092017)
n <- 100
n.cov <- 3
td <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))
td.ig <- td + 1 # For inverse gaussian and Gamma.

# Arguments
f <- X1 ~ X2 + X3
gl <- glm(f, family = binomial, data = td)
st.i <- td[["X4"]]
st.u <- sort(unique(st.i))
folds <- metamisc:::l1o(st.u)

# Ideally these would be separated into 3 tests, but they use each other's objects, which are cleaned up by test_that.
test_that("Stratified models can be estimated and MA.", {
  # Stratified estimation
  expect_is(stratum.fit <- mp.stratum.fit(gl), "mp.stratum.fit")
  expect_is(stratified.fit <- mp.stratified.fit(formula = f, data = td, 
                                                st.i = st.i, st.u = st.u, estFUN = glm, 
                                                family = binomial)  , "mp.stratified.fit")
  
  # MA 
  # Note: this essentially yields the global model
  expect_is(meta.fit <- mp.meta.fit(stratified.fit, urma), "mp.meta.fit")
  expect_length(coef(meta.fit), 3)
  expect_is(cv.meta.fit <- mp.cv.meta.fit(stratified.fit = stratified.fit, folds = folds, metaFUN = urma), "mp.cv.meta.fit")
  expect_equal(dim(coef(cv.meta.fit)), c(length(unique(td[["X4"]])), ncol(td) - 1) )
  
  # Recal of MA
  expect_is(recal.meta.fit <- mp.recal.meta.fit(meta.fit = meta.fit, formula = f, newdata = td, estFUN = glm), "mp.meta.fit")
  expect_gt(coef(recal.meta.fit)[1], coef(meta.fit)[1])
  expect_identical(coef(recal.meta.fit)[-1], coef(meta.fit)[-1])
})

# test_that("Stratified models can be cross-validated", {
#   # CV: development
#   expect_is(cv.dev <- metamisc:::mp.cv.dev(formula = f, data = td, st.i = st.i, st.u = st.u, folds = folds, 
#                                            estFUN = glm, metaFUN = metamisc:::urma, meta.method = "DL", family = binomial)
#             , "mp.cv.dev")
#   expect_equal(family(cv.dev), binomial())
#   expect_equal(getPredictMethod(fit = cv.dev, two.stage = TRUE), metamisc:::predictGLM)
#   
#   # CV: recalibration
#   # Note: double recalibration sadly removes the previous original coefs and should not be done.
#   expect_is(cv.recal  <- metamisc:::mp.cv.recal(cv.dev = cv.dev, newdata = td, folds = folds, estFUN = glm), "mp.cv.dev")
#   expect_is(cv.recal2 <- metamisc:::mp.cv.recal(cv.recal, td, folds, glm), "mp.cv.dev")
#   
#   # CV: validation
#   expect_is(cv.val <- metamisc:::mp.cv.val(cv.dev = cv.dev, data = td, st.i = st.i, folds = folds), "mp.cv.dev")
#   expect_is(cv.val, "mp.cv.val")
#   
#   # CV: validation with recalibration
#   # Note: with recalibration, gen and perf should always appear to be smaller (=better)
#   expect_is(cv.val.recal <- mp.cv.val(cv.dev = cv.dev, data = td, st.i = st.i, folds = folds, 
#                                       recal.int = TRUE, estFUN = glm), "mp.cv.dev")
#   expect_gt(cv.val$gen, cv.val.recal$gen)
#   expect_true(all(cv.val$perf$perf > cv.val.recal$perf$perf))
#   
#   # Whole sequence
#   expect_is(cv <- mp.cv(formula = f, data = td, st.i = st.i, st.u = st.u, folds = folds, family = binomial), "mp.cv")
#   expect_true(all(class(cv) == c("mp.cv", "mp.cv.val", "mp.cv.dev")))
#   
#   # Global model
#   expect_is(global <- mp.global.2st(cv.val, urma), "mp.global")
#   expect_is(global <- mp.global.2st(cv, urma), "mp.global")
#   expect_is(global <- mp.global.2st(cv.val.recal, urma), "mp.global")
# })
# 
# test_that("A stepwise stratified model can be fitted", {
#   # No stepwise
#   expect_is(step0 <- metamisc:::mp.step(formula = f, data = td, remaining.changes = c(""), st.i = st.i, 
#                                         st.u = st.u, folds = folds, family = binomial), "mp.step")
#   expect_length(step0$cv, 1)
#   expect_is(mp.step.get.best(step0), "mp.cv")
#   
#   # Main effects
#   change.main <- c("X2", "X3")
#   expect_is(step <- metamisc:::mp.step(formula = f, data = td, remaining.changes = change.main, st.i = st.i, 
#                                        st.u = st.u, folds = folds, family = binomial), "mp.step")
#   expect_is(mp.step.get.best(step), "mp.cv")
#   
#   # Interaction effect
#   change.interaction <- c("X2:X3")
#   expect_is(step2 <- mp.step(formula = f, data = td, remaining.changes = change.interaction, st.i = st.i, 
#                              st.u = st.u, folds = folds, family = binomial), "mp.step")
#   expect_is(mp.step.get.best(step2), "mp.cv")
#   
#   # Entire fit
#   expect_is(fit <- mp.fit(formula = f, data = td, remaining.changes = change.main, st.i = st.i, 
#                           st.u = st.u, folds = folds, family = binomial, max.steps = 3), "mp.fit")
#   expect_equal(fit$best.step, "s1") # for this data and seed
# })