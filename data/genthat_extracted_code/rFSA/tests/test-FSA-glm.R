context("FSA-glm")

hepatitis <- read.csv("hepatitis.txt", header=FALSE, na.strings="?")
names(hepatitis) <- c("Class","AGE","SEX","STEROID","ANTIVIRALS","FATIGUE","MALAISE","ANOREXIA","LIVERBIG","LIVERFIRM","SPLEEN","SPIDERS","ASCITES","VARICES","BILIRUBIN","ALK","SGOT","ALBUMIN","PROTIME","HISTOLOGY")
hepatitis[,c(2,14,15,16,17,18,19)] <- lapply(X = hepatitis[,c(2,14,15,16,17,18,19)], as.numeric)
hepatitis$Class <- as.factor(hepatitis$Class)

test_that("quad=TRUE,interaction=TRUE", {
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=TRUE,interaction=TRUE,criterion=AIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN*PROTIME"))
  expect_equal(res$table$criterion,65.78795,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=TRUE,interaction=TRUE,criterion=BIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALK*PROTIME"))
  expect_equal(res$table$criterion,75.55602,tolerance=1e-5)
})

test_that("quad=TRUE,interaction=FALSE", {
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=TRUE,interaction=FALSE,criterion=AIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,63.83984,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=TRUE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)
})

test_that("quad=FALSE,interaction=TRUE", {
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=TRUE,criterion=AIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN*PROTIME"))
  expect_equal(res$table$criterion,65.78795,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=TRUE,criterion=BIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALK*PROTIME"))
  expect_equal(res$table$criterion,75.55602,tolerance=1e-5)
})

test_that("quad=FALSE,interaction=FALSE", {
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=AIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,63.83984,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=10,m=2,family="binomial")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)
})

test_that("checkfeas", {
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             checkfeas=c("ALBUMIN","PROTIME"))
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             checkfeas=c("ALBUMIN","SGOT"))
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             checkfeas=c("ALK","AGE"),return.models=TRUE)
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)
})

test_that("var4int", {
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             var4int="ALBUMIN")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             var4int="PROTIME")
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALBUMIN+PROTIME"))
  expect_equal(res$table$criterion,71.23756,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=hepatitis,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             var4int="ALK",return.models=TRUE)
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ALK+PROTIME"))
  expect_equal(res$table$criterion,76.28424,tolerance=1e-5)
})

test_that("min.nonmissing", {
  tmp <- hepatitis
  tmp$ALBUMIN[10:nrow(tmp)] <- NA
  set.seed(123)
  res <- FSA(formula="Class~AGE",data=tmp,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             min.nonmissing=10)
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~ASCITES+PROTIME"))
  expect_equal(res$table$criterion,71.73973,tolerance=1e-5)

  set.seed(123)
  res <- FSA(formula="Class~AGE",data=tmp,fitfunc=glm,
             quad=FALSE,interaction=FALSE,criterion=BIC,
             minmax="min",numrs=1,m=2,family="binomial",
             min.nonmissing=7)
  expect_equivalent(as.formula(res$table$formula[1]),as.formula("Class~MALAISE+ALBUMIN"))
  expect_equal(res$table$criterion,3.89182,tolerance=1e-5)
})
