# testing functions, aim to get 100% test coverage on exported code
# cpt.reg should ideally be tested when moved to changepoint package.

context("function tests")

# plot.envcpt
if (identical(Sys.getenv("NOT_CRAN"), "true")) {
  set.seed(98135)
  x=rnorm(50)
  out=envcpt(x)
test_that("plotAIC xlim main",expect_silent(plot(out,type='aic',xlim=c(0,10),main="AIC Test")))
test_that("plotAIC xlim main",expect_silent(plot(out,type='aic',main="AIC Test")))
test_that("plotAIC xlim main",expect_silent(plot(out,type='aic',xlim=c(0,10))))

# envcpt
test_that("no messages",expect_message(envcpt(x,verbose=FALSE),NA))

x[24]=NA
test_that("NA data",expect_error(envcpt(x),"data has missing values, this function cannot handle missing values"))

x=LETTERS
test_that("non-numeric",expect_error(envcpt(x),"data must be a numeric vector"))
}




# aic.envcpt
tmp=rnorm(100)
class(tmp)="envcpt"
test_that("AIC not list",expect_error(AIC(tmp),"object argument must be a list"))
tmp=list(summary=rnorm(100))
class(tmp)="envcpt"
test_that("AIC not matrix",expect_error(AIC(tmp),"first element in the object list must be a matrix."))
tmp=list(summary=matrix(LETTERS,nrow=2))
class(tmp)="envcpt"
test_that("AIC not numeric",expect_error(AIC(tmp),"First two rows in matrix in first element of object list must be numeric"))
