context("Utilities: predict")

## run the example from predict.gMAP
suppressMessages(example("predict.gMAP", package="RBesT", echo=FALSE, ask=FALSE, verbose=FALSE))

## check that we got for each input data item a prediction
test_that("correct # of predictions are generated", expect_equal(nrow(map$data), ncol(samp)))

## check that the predictive distribution has a variance which is
## larger in accordance to the betwee-trial heterogeniety (needs to be
## done on the link scale)

test_that("variances have correct ordering", {
              pred_cov_link <- predict(map, type="link")
              within_var <- (summary(pred_cov_link)[,"sd"])^2

              pred_cov_link_pred <- predict(map, trans_cov, type="link")
              pred_var_pred <- summary(pred_cov_link_pred)[,"sd"]
              tau_est <- summary(map)$tau[,"mean"]

              ## the predictive must include between and within; as such it is
              ## larger than within
              expect_true(all(pred_var_pred > tau_est))
              
              ## ensure that predictive has larger variance than the model estimate
              expect_true(all(summary(pred_cov_link_pred)[,"sd"] > summary(pred_cov_link)[,"sd"]))
          })


## new prediction was done for a single data item
test_that("correct # of new predictions are generated", expect_equal(ncol(pred_new), 1))

## must have larger sd than between-trial alone (on link scale)
test_that("predictive variances have correct ordering",{
              pred_new_link <- predict(map, data.frame(country="CH", study=11), type="link")
              tau_est <- summary(map)$tau[,"mean"]
              summary(pred_new_link)[,"sd"] > tau_est
          })


context("Utilities: (auto)mixfit")

test_that("automixfit attempts K=4 different models and returns best fitting", {
              auto_map <- automixfit(map, Nc=1:4, k=6)
              models <- attr(auto_map, "models")
              expect_equal(length(models), 4)
              perf <- sapply(models, AIC, k=6)
              ## ensure that performance is decreasing
              expect_true(all(diff(perf) > 0))
              expect_true("betaMix" %in% class(auto_map))
          })


test_that("mixfit for prediction handles response and link scale", {
              pred_map <- mixfit(pred_new, Nc=2)
              
              expect_true(is.list(pred_map))
              expect_true("betaMix" %in% class(pred_map[[1]]))
              expect_equal(ncol(pred_map[[1]]), 2)

              pred_new_link <- predict(map, data.frame(country="CH", study=11), type="link")
              pred_map_link <- mixfit(pred_new_link, Nc=2)

              expect_true(is.list(pred_map_link))
              expect_true("normMix" %in% class(pred_map_link[[1]]))
              expect_equal(ncol(pred_map_link[[1]]), 2)
          })


context("Utilities: mixcombine")

example("mixcombine", package="RBesT", echo=FALSE, ask=FALSE, verbose=FALSE)

test_that("combination of mixtures", {
              m1 <- mixcombine(bm, unif, weight=c(9, 1))
              m2 <- mixcombine(bm, unif, unif, weight=c(8, 1, 1))
              expect_equivalent(m1[1,], c(bm[1,] - 0.1/2, 0.1))
              expect_equivalent(m1[2:3,1:2], bm[2:3,1:2])
              expect_equivalent(m2[2:3,1:2], bm[2:3,1:2])
          })

test_that("throws an error if more weights than mixtures given", {
              ## giving 3 weights but only 2 mixtures must not work
              expect_error(mixcombine(bm, unif, weight=c(8, 1, 1)), "length(weight) not equal to length(comp)", fixed=TRUE)
          })

test_that("combination of normal mixtures without default sigma works", {
              norm_ui <- mixnorm(c(1, 0, 2))
              norm_ui_mix <- mixcombine(norm_ui, norm_ui, weight=c(0.5,0.5))
              expect_true(ncol(norm_ui_mix) == 2)
          })

context("Utilities: robustify")

example("robustify", package="RBesT", echo=FALSE, ask=FALSE, verbose=FALSE)

test_that("beta mixture is robustified with Beta(1,1)", {
              expect_equal(ncol(bmix)+1, ncol(rbmix))
              expect_equivalent(rbmix[,ncol(rbmix)], c(0.1, 1, 1))
          })

test_that("beta mixture is robustified with Beta(0.5,0.5)", {
              rbmix2 <- robustify(bmix, w=0.1, n=0)
              expect_equal(ncol(bmix)+1, ncol(rbmix2))
              expect_equivalent(rbmix2[,ncol(rbmix2)], c(0.1, 0.5, 0.5))
          })

test_that("gamma mixture is robustified with n=1 equivalent prior", {
              m <- summary(gmnMix)["mean"]
              nr <- ncol(rgmnMix)
              expect_equivalent(rgmnMix[[nr, rescale=TRUE]], mixgamma(c(1, m, 1), param="mn"))
              expect_equal(rgmnMix[1,nr], 0.1)
          })

test_that("gamma mixture is robustified with n=5 equivalent prior", {
              m <- summary(gmnMix)["mean"]
              rgmnMix2 <- robustify(gmnMix, w=0.1, n=5)
              nr <- ncol(rgmnMix2)
              expect_equivalent(rgmnMix2[[nr, rescale=TRUE]], mixgamma(c(1, m, 5), param="mn"))
              expect_equal(rgmnMix2[1,nr], 0.1)
          })

test_that("normal mixture is robustified with n=1 equivalent prior", {
              nr <- ncol(rnMix)
              expect_equivalent(rnMix[[nr, rescale=TRUE]], mixnorm(c(1, 0, 1), param="mn", sigma=sigma(nm)))
              expect_equal(rnMix[1,nr], 0.1)
          })

test_that("normal mixture is robustified with n=5 equivalent prior", {
              rnMix2 <- robustify(nm, w=0.1, mean=0, n=5, sigma=sigma(nm))
              nr <- ncol(rnMix2)
              expect_equivalent(rnMix2[[nr, rescale=TRUE]], mixnorm(c(1, 0, 5), param="mn", sigma=sigma(nm)))
              expect_equal(rnMix2[1,nr], 0.1)
          })

context("Utilities: Plotting of Mixtures")
test_that("plotting of normal mixtures without default sigma works", {
              norm_ui <- mixnorm(c(1, 0, 2))
              norm_mix_ui <- mixcombine(norm_ui, norm_ui, weight=c(0.5,0.5))
              pl <- plot(norm_mix_ui)
              expect_true(inherits(pl, "ggplot"))
          })

context("Utilities: Mixture Effective Sample Size")

example("ess", package="RBesT", echo=FALSE, ask=FALSE, verbose=FALSE)

test_that("conjugate beta case matches canonical formula", {
              expect_equal(a+b, ess(prior, "moment"))
              expect_equal(a+b, ess(prior, "morita"))
          })

test_that("moment matching for beta mixtures is correct", {
              expect_equal(ess(bmix, method="moment"), round(sum(ab_matched)))
          })

test_that("normal mixtures have reference scale used correctly", {
              nmix_sigma_small <- nmix
              sigma_large <- RBesT::sigma(nmix)
              sigma(nmix_sigma_small) <- sigma_large/sqrt(2)
              suppressMessages(e1m <- ess(nmix, "moment"))
              suppressMessages(e2m <- ess(nmix_sigma_small, "moment"))
              expect_gt(e1m, e2m)
              expect_equal(floor(abs(e2m - e1m/2)), 0)
              suppressMessages(e1b <- ess(nmix, "morita"))
              suppressMessages(e2b <- ess(nmix_sigma_small, "morita"))
              expect_gt(e1b, e2b)
              expect_equal(floor(abs(e2b - e1b/2)), 0)
          })

test_that("gamma mixtures have likelihood property respected", {
              gmix1 <- gmix
              likelihood(gmix1) <- "poisson"
              gmix2 <- gmix
              likelihood(gmix2) <- "exp"
              e1m <- ess(gmix1, "moment")
              e2m <- ess(gmix2, "moment")
              expect_true(e1m != e2m)
              e1b <- ess(gmix1, "morita")
              e2b <- ess(gmix2, "morita")
              expect_true(e1b != e2b)
          })


test_that("gamma 1-component density gives canonical results", {
              guni1 <- gmix[[1, rescale=TRUE]]
              likelihood(guni1) <- "poisson"
              guni2 <- gmix[[1, rescale=TRUE]]
              likelihood(guni2) <- "exp"
              e1m <- ess(guni1, "moment")
              expect_true(guni1[3,1] == e1m)
              e2m <- ess(guni2, "moment")
              expect_true(guni2[2,1] == e2m)
              e1b <- ess(guni1, "morita")
              e2b <- ess(guni2, "morita")
              expect_true(e1b != e2b)
              expect_true(guni1[3,1] == e1b)
              expect_true(guni2[2,1] == e2b)
          })
