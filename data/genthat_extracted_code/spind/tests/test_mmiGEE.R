context('mmiGEE')

test_that('mmiGEE outputs are correct',{
  skip_on_cran()
  library(MASS)
  data(birthwt)
  x<-rep(1:14,14)
  y<-as.integer(gl(14,14))
  coords<-cbind(x[-(190:196)],y[-(190:196)])

  formula<-formula(low ~ race + smoke +  bwt)

  mgee<-GEE(formula, family = "gaussian", data = birthwt,
            coord=coords, corstr="fixed",scale.fix=TRUE)

  mmi<-mmiGEE(mgee,birthwt)

  expect_equal(as.vector(mmi$rvi), c(.489, .464, 1),
               tolerance = 1e-3)
  expect_equal(as.vector(mmi$result[ ,9]), c(.275, .261, .236, .228,
                                             0, 0, 0, 0),
               tolerance = 1e-4)
  expect_match(class(mmi), 'list')

  mgee <- GEE(formula, family = "gaussian", data = birthwt,
              coord=coords, corstr="fixed",scale.fix=F)
  expect_message(mmiGEE(mgee,birthwt),
                 'Scale parameter is now fixed')

  mgee <- GEE(formula, family = 'gaussian', data = birthwt,
              coord = coords, corstr = 'exchangeable', cluster = 3,
              scale.fix = TRUE)

  mmi <- mmiGEE(mgee, birthwt)
  expect_equal(as.vector(mmi$rvi), c(0.519, 0.524, 1.001),
               tolerance = 1e-3)
  expect_equal(as.vector(mmi$result[ ,9]), c(0.269, 0.255, 0.250, 0.227,
                                             0, 0, 0, 0),
               tolerance = 1e-4)

})

test_that('mmiGEE fails properly', {
  skip_on_cran()
  library(MASS)
  data(birthwt)
  x<-rep(1:14,14)
  y<-as.integer(gl(14,14))
  coords<-cbind(x[-(190:196)],y[-(190:196)])

  formula<-formula(low ~ race + smoke +  bwt)

  mglm <- glm(formula, family = 'gaussian', data = birthwt)

  expect_error(mmiGEE(mglm, birthwt), "Input model is not of class 'GEE'")

})


