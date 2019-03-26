context("man file example tests")

# From envcpt.Rd & plot.fit.envcpt.Rd (same examples)
if(identical(Sys.getenv("NOT_CRAN"), "true")) {
  set.seed(1)
  x=c(rnorm(100,0,1),rnorm(100,5,1))
  out=envcpt(x) # run all models with default values
  test_that('envcpt1',expect_equal_to_reference(out[[1]],file='envcpt1.rds'))
  
  test_that("envcpt2",expect_equal_to_reference(AIC(out),file="envcpt2.rds"))
  
  test_that("envcpt3",expect_equivalent(which.min(AIC(out)),2))
  
  test_that("envcpt4",expect_is(out$meancpt,"cpt"))
  test_that("envcpt5",expect_equivalent(cpts(out$meancpt),100))
  
  test_that("envcpt5AICweights",expect_equal_to_reference(AICweights(out),file='envcpt5AICweights.rds'))
  
  test_that("envcpt5BIC",expect_equal_to_reference(BIC(out),file='envcpt5BIC.rds'))
  test_that("envcpt5BICmin",expect_equivalent(which.min(BIC(out)),2))

  test_that("envcpt5plot",expect_silent(plot(out,type='fit')))
  test_that("envcpt5aicplot",expect_silent(plot(out,type="aic")))
  test_that("envcpt5aicplot",expect_silent(plot(out,type="bic")))
  
  
  test_that("messages1",expect_message(envcpt(x),"Fitting 12 models"))
}





if (identical(Sys.getenv("NOT_CRAN"), "true")) {
  set.seed(10)
  x=c(0.01*(1:100),1.5-0.02*((101:250)-101))+rnorm(250,0,0.2)
  out=envcpt(x,minseglen=10) # run all models with a minimum of 10 observations between changes
test_that("envcpt6",expect_equal_to_reference(AIC(out),file='envcpt6.rds'))

test_that("envcpt7",expect_equivalent(which.min(AIC(out)),8))

test_that("envcpt8",expect_is(out$trendcpt,"cpt.reg"))
test_that("envcpt9",expect_equivalent(cpts(out$trendcpt),100))

test_that("envcpt9AICweights",expect_equal_to_reference(AICweights(out),file='envcpt9AICweights.rds'))

test_that("envcpt9BIC",expect_equal_to_reference(BIC(out),file='envcpt9BIC.rds'))
test_that("envcpt9BICmin",expect_equivalent(which.min(BIC(out)),8))

test_that("envcpt9plot",expect_silent(plot(out,type='fit')))
test_that("envcpt9aicplot",expect_silent(plot(out,type="aic")))
test_that("envcpt9bicplot",expect_silent(plot(out,type="bic")))

test_that("messages2",expect_message(envcpt(x),"Fitting 12 models"))
}







if (identical(Sys.getenv("NOT_CRAN"), "true")) {
  set.seed(100)
  x=arima.sim(model=list(ar=c(0.7,0.2)),n=500)+0.01*(1:500)
  out=envcpt(x,models=c(3:6,9:12)) # runs a subset of models (those with AR components) 
test_that("envcpt10",expect_equal_to_reference(AIC(out),file='envcpt10.rds'))

test_that("envcpt11",expect_equivalent(which.min(AIC(out)),10))

test_that("envcpt12",expect_is(out$trendar2,"lm"))
test_that("envcpt13",expect_equivalent(out$trendar2$coefficients,c(-0.069418907,     0.001702804,     0.661336574,     0.186613360)))

test_that("envcpt13AICweights",expect_equal_to_reference(AICweights(out),file='envcpt13AICweights.rds'))

test_that("envcpt13BIC",expect_equal_to_reference(BIC(out),file='envcpt13BIC.rds'))
test_that("envcpt13BICmin",expect_equivalent(which.min(BIC(out)),10))

test_that("envcpt13plot",expect_silent(plot(out,type='fit')))
test_that("envcpt13aicplot",expect_silent(plot(out,type="aic")))
test_that("envcpt13bicplot",expect_silent(plot(out,type="bic")))

test_that("messages3",expect_message(envcpt(x,models=c(3:6,9:12)),"Fitting 8 models"))
}




