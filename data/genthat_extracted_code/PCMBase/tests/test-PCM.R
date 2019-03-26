library(PCMBase)

if(PCMBaseIsADevRelease()) {

  library(abind)

  # regimes

  # in regime 'a' the three traits evolve according to three independent OU processes
  a.X0 <- c(5, 2, 1)
  a.H <- rbind(
    c(0, 0, 0),
    c(0, 2, 0),
    c(0, 0, 3))
  a.Theta <- c(10, 6, 2)
  a.Sigma_x <- rbind(
    c(1.6, 0.0, 0.0),
    c(0.0, 2.4, 0.0),
    c(0.0, 0.0, 2.0))
  a.Sigmae_x <- rbind(
    c(0.0, 0.0, 0.0),
    c(0.0, 0.0, 0.0),
    c(0.0, 0.0, 0.0))

  # in regime 'b' there is correlation between the traits
  b.X0 <- c(12, 4, 3)
  b.H <- rbind(
    c(2.0, 0.1, 0.2),
    c(0.1, 0.6, 0.2),
    c(0.2, 0.2, 0.3))
  b.Theta <- c(10, 6, 2)
  b.Sigma_x <- rbind(
    c(1.6, 0.3, 0.3),
    c(0.0, 0.3, 0.4),
    c(0.0, 0.0, 2.0))
  b.Sigmae_x <- rbind(
    c(0.2, 0.0, 0.0),
    c(0.0, 0.3, 0.0),
    c(0.0, 0.0, 0.4))

  H <- abind(a.H, b.H, along=3, new.names=list(x=NULL, y=NULL, regime=c('a','b')))
  Theta <- abind(a.Theta, b.Theta, along=2, new.names=list(xy=NULL, regime=c('a','b')))
  Sigma_x <- abind(a.Sigma_x, b.Sigma_x, along=3, new.names=list(x=NULL, y=NULL, regime=c('a','b')))
  Sigmae_x <- abind(a.Sigmae_x, b.Sigmae_x, along=3, new.names=list(x=NULL, y=NULL, regime=c('a','b')))


  # regime 'a', trait 1
  model.a.1 <- PCM("OU", k = 1, regimes = "a",
                   params = list(
                     X0 = a.X0[1],
                     H = H[1,1,'a',drop=FALSE],
                     Theta = Theta[1,'a',drop=FALSE],
                     Sigma_x = Sigma_x[1,1,'a',drop=FALSE],
                     Sigmae_x = Sigmae_x[1,1,'a',drop=FALSE]))

  test_that(
    "Check properties of created model", {
      expect_identical(PCMParentClasses(model.a.1), c("GaussianPCM", "PCM"))
      expect_identical(PCMNumRegimes(model.a.1), 1L)
      expect_identical(PCMNumTraits(model.a.1), 1L)
      expect_identical(PCMParamCount(model.a.1), 5L)
      expect_identical(PCMRegimes(model.a.1), "a")
      expect_false(is.Transformable(model.a.1))
      expect_identical(PCMParamGetShortVector(model.a.1), c(5.0,  0.0, 10.0,  1.6,  0.0))
    })


  # regime 'a', trait 2
  model.a.2 <- PCM("OU", k = 1, regimes = "a",
                   params = list(
                     X0 = a.X0[2],
                     H = H[2,2,'a',drop=FALSE],
                     Theta = Theta[2,'a',drop=FALSE],
                     Sigma_x = Sigma_x[2,2,'a',drop=FALSE],
                     Sigmae_x = Sigmae_x[2,2,'a',drop=FALSE]))

  # regime 'a', trait 3
  model.a.3 <- PCM("OU", k = 1, regimes = "a",
                   params = list(
                     X0 = a.X0[3],
                     H = H[3,3,'a',drop=FALSE],
                     Theta = Theta[3,'a',drop=FALSE],
                     Sigma_x = Sigma_x[3,3,'a',drop=FALSE],
                     Sigmae_x = Sigmae_x[3,3,'a',drop=FALSE]))

  # regime 'a', traits 1, 2 and 3
  model.a.123 <- PCM("OU", k = 3, regimes = "a",
                     params = list(
                       X0 = a.X0,
                       H = H[,,'a',drop=FALSE],
                       Theta = Theta[,'a',drop=FALSE],
                       Sigma_x = Sigma_x[,,'a',drop=FALSE],
                       Sigmae_x = Sigmae_x[,,'a',drop=FALSE]))


  test_that(
    "Check properties of created model", {
      expect_identical(PCMParentClasses(model.a.123), c("GaussianPCM", "PCM"))
      expect_identical(PCMNumRegimes(model.a.123), 1L)
      expect_identical(PCMNumTraits(model.a.123), 3L)
      expect_identical(PCMParamCount(model.a.123), 27L)
      expect_identical(PCMRegimes(model.a.123), "a")
      expect_false(is.Transformable(model.a.123))
      expect_identical(PCMParamGetShortVector(model.a.123),
                       c(5.0, 2.0, 1.0,
                         0.0, 0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 3.0,
                         10.0,  6.0, 2.0,
                         1.6, 0.0, 2.4, 0.0, 0.0, 2.0,
                         0.0, 0.0, 0.0, 0.0, 0.0, 0.0))
    })


  # regime 'b', traits 1, 2 and 3
  model.b.123 <- PCM("OU", k = 3, regimes = "b",
                     params = list(
                       X0 = b.X0,
                       H = H[,,'b',drop=FALSE],
                       Theta = Theta[,'b',drop=FALSE],
                       Sigma_x = Sigma_x[,,'b',drop=FALSE],
                       Sigmae_x = Sigmae_x[,,'b',drop=FALSE]))

  # regimes 'a' and 'b', traits 1, 2 and 3
  model.ab.123 <- PCM("OU", k = 3, regimes = c("a", "b"),
                      params = list(
                        X0 = a.X0,
                        H = H[,,,drop=FALSE],
                        Theta = Theta[,,drop=FALSE],
                        Sigma_x = Sigma_x[,,,drop=FALSE],
                        Sigmae_x = Sigmae_x[,,,drop=FALSE]))

  test_that(
    "Check properties of created model", {
      expect_identical(PCMParentClasses(model.ab.123), c("GaussianPCM", "PCM"))
      expect_identical(PCMNumRegimes(model.ab.123), 2L)
      expect_identical(PCMNumTraits(model.ab.123), 3L)
      expect_identical(PCMParamCount(model.ab.123), 51L)
      expect_identical(PCMRegimes(model.ab.123), c("a", "b"))
      expect_false(is.Transformable(model.ab.123))
      expect_identical(PCMParamGetShortVector(model.ab.123),
                       c(5.0, 2.0, 1.0,
                         0.0, 0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 3.0,
                         2.0, 0.1, 0.2, 0.1, 0.6, 0.2, 0.2, 0.2, 0.3,
                         10.0, 6.0, 2.0,
                         10.0, 6.0, 2.0,
                         1.6, 0.0, 2.4, 0.0, 0.0, 2.0,
                         1.6, 0.3, 0.3, 0.3, 0.4, 2.0,
                         0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                         0.2, 0.0, 0.3, 0.0, 0.0, 0.4
                         ))
    })

}
