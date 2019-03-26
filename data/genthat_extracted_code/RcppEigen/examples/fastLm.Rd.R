library(RcppEigen)


### Name: fastLm
### Title: Bare-bones linear model fitting function
### Aliases: fastLm fastLm.default fastLm.formula fastLmPure
### Keywords: regression

### ** Examples

  data(trees, package="datasets")
  mm <- cbind(1, log(trees$Girth))   # model matrix
  y  <- log(trees$Volume)            # response

  ## bare-bones direct interface
  flm <- fastLmPure(mm, y)
  print(flm)

  ## standard R interface for formula or data returning object of class fastLm
  flmmod <- fastLm( log(Volume) ~ log(Girth), data=trees)
  summary(flmmod)

  ## case where non-rank-revealing methods break down
  dd <- data.frame(f1 = gl(4, 6, labels = LETTERS[1:4]),
                   f2 = gl(3, 2, labels = letters[1:3]))[-(7:8), ]
  xtabs(~ f2 + f1, dd)     # one missing cell
  mm <- model.matrix(~ f1 * f2, dd)
  kappa(mm)                # large, indicating rank deficiency
  set.seed(1)
  dd$y <- mm %*% seq_len(ncol(mm)) + rnorm(nrow(mm), sd = 0.1)
  summary(lm(y ~ f1 * f2, dd))     # detects rank deficiency
  try(summary(fastLm(y ~ f1 * f2, dd))) # also detects rank deficiency



