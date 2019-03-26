## ----echo = FALSE--------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)
## this is nice during development = on github
## this is not so nice for preparing vignettes for CRAN
#options(knitr.table.format = 'markdown')

## ----avro-changes--------------------------------------------------------
library(aurelius)

# avro.int no longer in use
avro_int

# avro.enum no longer in use
avro_enum(list("one", "two"))

## ----pfa-changes---------------------------------------------------------
# pfa.expr no longer in use
pfa_expr(quote(2 + 2))

## ----model-import-export, eval=FALSE-------------------------------------
#  # convert the lm object to a list-of-lists PFA representation
#  lm_model_as_pfa <- pfa(lm(mpg ~ hp, data = mtcars))
#  
#  # save as plain-text JSON
#  write_pfa(lm_model_as_pfa, file = "my-model.pfa")
#  
#  my_model <- read_pfa("my-model.pfa")

## ----pfa-document--------------------------------------------------------
pfa_document(input = avro_double, 
             output = avro_double, 
             action = expression(input + 10), 
             validate = FALSE)

## ----multinomial-glmnet-example, eval=FALSE------------------------------
#  # generate data
#  x <- matrix(rnorm(100*3), 100, 3, dimnames = list(NULL, c('X1','X2', 'X3')))
#  g3 <- sample(LETTERS[1:3], 100, replace=TRUE)
#  
#  # fit multinomial model without an intercept
#  multinomial_model <- glmnet(x, g3, family="multinomial", intercept = FALSE)
#  
#  # convert to pfa, where the output is the predicted probability of each class
#  # the cutoffs specify that the predicted class should be the one
#  # which is the largest relative to its specified cutoff.
#  multinomial_model_as_pfa <- pfa(multinomial_model,
#                                  pred_type = 'response',
#                                  cutoffs = c(A = .1, B = .2, C = .7))

## ----extract-and-build-models, eval=FALSE--------------------------------
#  # generate data
#  set.seed(1)
#  dat <- data.frame(X1 = rnorm(100),
#                    X2 = runif(100))
#  dat$Y <- ((3 - 4 * dat$X1 + 3 * dat$X2 + rnorm(100, 0, 4)) > 0)
#  
#  # build the model
#  logit_model <- glm(Y ~ X1 + X2, data=dat, family = binomial(logit))
#  
#  # extract the parameters
#  extract_params(logit_model)

## ----testing-model-predictions, eval=FALSE-------------------------------
#  library(testthat)
#  
#  # generate data
#  set.seed(1)
#  dat <- data.frame(X1 = rnorm(100),
#                    X2 = runif(100))
#  dat$Y <- 3 - 5 * dat$X1 + 3 * dat$X2 + rnorm(100, 0, 3)
#  
#  # build the model
#  lm_model <- lm(Y ~ X1 + X2, data = dat)
#  
#  lm_model_as_pfa <- pfa(lm_model)
#  lm_engine <- pfa_engine(lm_model_as_pfa)
#  
#  # create the sample input vector
#  input <- list(X1=.5, X2=.5)
#  
#  # test equality
#  expect_equal(lm_engine$action(input),
#               unname(predict(lm_model,
#                              newdata = as.data.frame(input))),
#               tolerance = .0001)

## ----testing-read-pfa, eval=FALSE----------------------------------------
#  model_as_list <- list(input='double',
#                        output='double',
#                        action=list(list(`+`=list('input', 10))))
#  
#  # literal JSON string  (useful for small examples)
#  toy_model <- read_pfa(paste0('{"input": "double", ',
#                                '"output": "double", ',
#                                '"action": [{"+": ["input", 10]}]}'))
#  expect_identical(toy_model, model_as_list)
#  
#  # from a local path, must be wrapped in "file" command to create a connection
#  file_conn <- file(system.file("extdata", "my-model.pfa", package = "aurelius"))
#  local_model <- read_pfa(file_conn)
#  expect_identical(local_model, model_as_list)
#  
#  # from a url
#  url_conn <- url(paste0("https://raw.githubusercontent.com/ReportMort/hadrian",
#                         "/feature/add-r-package-structure",
#                         "/aurelius/inst/extdata/my-model.pfa"))
#  url_model <- read_pfa(url_conn)
#  expect_identical(url_model, model_as_list)

