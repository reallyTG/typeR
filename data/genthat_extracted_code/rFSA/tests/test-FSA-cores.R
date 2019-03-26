context("FSA-cores")

## TODO: Rename context
## TODO: Add more tests

###************************************************************
### test cases created at the first phase of development
###************************************************************

set.seed(1000)
numrs <- 10 #number of start point
N <- 100 #number of obs
P <- 100 #number of variables
data <- data.frame(matrix(rnorm(N*(P+1)), nrow = N, ncol = P+1))

for (cores in c(1, min(2,parallel::detectCores()))) {
  test_that(paste0("random data, fixvar=NULL, cores=", cores), {
    skip_on_cran()

    set.seed(1000)
    if (.Platform$OS.type == "windows" & cores > 1) {
      expect_warning(
        res <- FSA(
          formula = "X101~1", data = data, cores = cores, m = 2,
          interactions = F, criterion = AIC, minmax = "min",
          numrs = numrs, return.models=FALSE)
      )
    } else {
      res <- FSA(
        formula = "X101~1", data = data, cores = cores, m = 2,
        interactions = F, criterion = AIC, minmax = "min",
        numrs = numrs, return.models=FALSE)
    }
    ## res <- FSA(
    ##   formula = "X101~1", data = data, cores = cores, m = 2,
    ##   interactions = F, criterion = AIC, minmax = "min",
    ##   numrs = numrs, return.models=FALSE)

    expect_equivalent(as.formula(res$table$formula), as.formula("X101~X7+X83"))
    expect_equal(res$table$criterion,266.028,
                 tolerance=1e-2,check.attributes=F)
    expect_false("swapped.to.model" %in% names(res$solutions))
    expect_false("checked.model" %in% names(res$solutions))

    set.seed(1000)
    if (.Platform$OS.type == "windows" & cores > 1) {
      expect_warning(
        res <- FSA(
          formula = "X101~1", data = data, cores = cores, m = 2,
          interactions = F, criterion = AIC, minmax = "min",
          numrs = numrs, return.models=TRUE)
      )
    } else {
      res <- FSA(
        formula = "X101~1", data = data, cores = cores, m = 2,
        interactions = F, criterion = AIC, minmax = "min",
        numrs = numrs, return.models=TRUE)
    }

    expect_equivalent(as.formula(res$table$formula), as.formula("X101~X7+X83"))
    expect_equal(res$table$criterion,266.028,
                 tolerance=1e-2,check.attributes=F)
    expect_true("swapped.to.model" %in% names(res$solutions))
    expect_true("checked.model" %in% names(res$solutions))
  })
}

for (cores in c(1, min(2,parallel::detectCores()))) {
  test_that(paste0("mtcars data, fixvar=hp, cores=", cores),{
    skip_on_cran()
    
    set.seed(1000)

    if (.Platform$OS.type == "windows" & cores > 1) {
      expect_warning(
        res <- FSA(fitfunc=lm,formula="mpg~hp+wt", data=mtcars, fixvar="hp",
                   quad=F, m=2, numrs=10, cores=cores, criterion = r.squared, minmax="max",
                   return.models=FALSE)
      )
    } else {
      res <- FSA(fitfunc=lm,formula="mpg~hp+wt", data=mtcars, fixvar="hp",
                 quad=F, m=2, numrs=10, cores=cores, criterion = r.squared, minmax="max",
                 return.models=FALSE)
    }
    
    expect_equivalent(as.formula(res$table$formula), as.formula("mpg~hp+hp*wt"))
    expect_equal(res$table$criterion, 0.8847637, tolerance=1e-3,check.attributes=F)
    expect_false("swapped.to.model" %in% names(res$solutions))
    expect_false("checked.model" %in% names(res$solutions))

    set.seed(1000)
    if (.Platform$OS.type == "windows" & cores > 1) {
      expect_warning(
        res <- FSA(fitfunc=lm,formula="mpg~hp+wt", data=mtcars, fixvar="hp",
                   quad=F, m=2, numrs=10, cores=cores, criterion = r.squared, minmax="max",
                   return.models=TRUE)
      )
    } else {
      res <- FSA(fitfunc=lm,formula="mpg~hp+wt", data=mtcars, fixvar="hp",
                 quad=F, m=2, numrs=10, cores=cores, criterion = r.squared, minmax="max",
                 return.models=TRUE)
    }
    expect_equivalent(as.formula(res$table$formula), as.formula("mpg~hp+hp*wt"))
    expect_equal(res$table$criterion, 0.8847637, tolerance=1e-3,check.attributes=FALSE)
    expect_true("swapped.to.model" %in% names(res$solutions))
    expect_true("checked.model" %in% names(res$solutions))
  })
}

for (cores in c(1, min(2,parallel::detectCores()))) {
  test_that("two fix variables", {
    skip_on_cran()
    set.seed(123)
    n=100
    p=100
    x <- matrix(runif(n=n*p,min=0,max=1),nrow=n,ncol=p)
    y <- 0.5*x[,1]+0.25*x[,2]+0.5*x[,1]*x[,2]+rnorm(n=n)
    FSA.data <- data.frame(x,y)

    set.seed(1000)
    if (.Platform$OS.type == "windows" & cores > 1) {
      expect_warning(
        res <- FSA(
          y~1,data=FSA.data,fixvar=c('X1','X3'), numrs=10, cores=cores,
          m=2, criterion=r.squared, minmax='max')
      )
    } else {
      res <- FSA(
        y~1,data=FSA.data,fixvar=c('X1','X3'), numrs=10, cores=cores,
        m=2, criterion=r.squared, minmax='max')
    }
    expect_equivalent(as.formula(res$table$formula[1]), as.formula("y~X1+X3+X35*X82"))
    expect_equivalent(as.formula(res$table$formula[2]), as.formula("y~X1+X3+X8*X47"))
    expect_equivalent(as.formula(res$table$formula[3]), as.formula("y~X1+X3+X9*X86"))
    expect_equal(res$table$criterion, c(0.1768123,0.2089683,0.1420302), tolerance=1e-5, check.attributes=FALSE)
  })
}

for (cores in c(1, min(2,parallel::detectCores()))) {
  test_that("glm",{
    set.seed(1000)
    if (.Platform$OS.type == "windows" & cores > 1) {
      expect_warning(
        res <- FSA(fitfunc=glm, formula="vs~disp+mpg", data=mtcars,
                   cores=cores,numrs=10, criterion=AIC, minmax="min")
      )
    } else {
      res <- FSA(fitfunc=glm, formula="vs~disp+mpg", data=mtcars,
                 cores=cores,numrs=10, criterion=AIC, minmax="min")
    }
    
    expect_equivalent(as.formula(res$table$formula[1]), as.formula("vs~cyl*qsec"))
    expect_equal(res$table$criterion, 9.425098, tolerance=1e-5)
  })
}
