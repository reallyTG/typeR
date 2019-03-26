library(RcppArmadillo)


### Name: fastLm
### Title: Bare-bones linear model fitting function
### Aliases: fastLm fastLmPure fastLm.default fastLm.formula
### Keywords: regression

### ** Examples

  data(trees, package="datasets")

  ## bare-bones direct interface
  flm <- fastLmPure( cbind(1, log(trees$Girth)), log(trees$Volume) )
  print(flm)

  ## standard R interface for formula or data returning object of class fastLm
  flmmod <- fastLm( log(Volume) ~ log(Girth), data=trees)
  summary(flmmod)

  ## case where fastLm breaks down
  dd <- data.frame(f1 = gl(4, 6, labels = LETTERS[1:4]),
                   f2 = gl(3, 2, labels = letters[1:3]))[-(7:8), ]
  xtabs(~ f2 + f1, dd)     # one missing cell
  mm <- model.matrix(~ f1 * f2, dd)
  kappa(mm)                # large, indicating rank deficiency
  set.seed(1)
  dd$y <- mm %*% seq_len(ncol(mm)) + rnorm(nrow(mm), sd = 0.1)
  summary(lm(y ~ f1 * f2, dd))     # detects rank deficiency
  summary(fastLm(y ~ f1 * f2, dd)) # some huge coefficients



