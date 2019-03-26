## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")

# loading stubthat
library(stubthat)

## ------------------------------------------------------------------------
jedi_or_sith <- function(x) return('No one')
jedi_or_sith_stub <- stub(jedi_or_sith)

## ------------------------------------------------------------------------
jedi_or_sith_stub$withArgs(x = 'Luke')$returns('Jedi')

## ------------------------------------------------------------------------
jedi_or_sith('Luke')
jedi_or_sith_stub$f('Luke')

## ----eval=FALSE----------------------------------------------------------
#  library(httr) # provides the GET and status_code functions
#  
#  url_downloader <- function(url) GET(url)
#  
#  check_api_endpoint_status <- function(url) {
#    response <- url_downloader(url)
#    response_status <- status_code(response)
#    ifelse(response_status == 200, 'up', 'down')
#  }

## ----eval=FALSE----------------------------------------------------------
#  url_downloader_stub <- stub(url_downloader)
#  url_downloader_stub$withArgs(url = 'good url')$returns(200)
#  url_downloader_stub$withArgs(url = 'bad url')$returns(404)
#  
#  # testthat package provides the expect_equal function
#  # mockr package provides the with_mock function
#  
#  check_api_endpoint_status_tester <- function(x) {
#    mockr::with_mock(url_downloader = url_downloader_stub$f,
#                     check_api_endpoint_status(x))
#  }
#  
#  (testthat::expect_equal(check_api_endpoint_status_tester('good url'), 'up'))
#  #> [1] "up"
#  (testthat::expect_equal(check_api_endpoint_status_tester('bad url'),  'down'))
#  #> [1] "down"

## ----eval=FALSE----------------------------------------------------------
#  f1 <- function(...) {
#  
#    {...some computation...}
#  
#    interim_val <- f2(...)
#  
#    {...more computation...}
#  
#    return(ans)
#  }

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$expects(a = 2)

stub_of_sum$f(2)
stub_of_sum$f(3)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$strictlyExpects(a = 2)
stub_of_sum$f(2)

## ----error=TRUE----------------------------------------------------------
stub_of_sum$strictlyExpects(a = 2, b = 1)
stub_of_sum$f(2)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(3)$expects(a = 2)

stub_of_sum$f(100)
stub_of_sum$f(100)
stub_of_sum$f(100)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(3)$strictlyExpects(a = 2, b = 2)

stub_of_sum$f(2)
stub_of_sum$f(2)
stub_of_sum$f(2)

## ------------------------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$returns(0)

stub_of_sum$f(2)

## ------------------------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(2)$returns(0)

stub_of_sum$f(2)
stub_of_sum$f(2)

## ------------------------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$withArgs(a = 2)$returns(0)

stub_of_sum$f(1)
stub_of_sum$f(2)

## ------------------------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$withExactArgs(a = 2)$returns(0) # won't work because value for b is not defined
stub_of_sum$withExactArgs(a = 2, b = 1)$returns(1)

stub_of_sum$f(1)
stub_of_sum$f(2)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$throws('some err msg')

stub_of_sum$f(2)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(2)$throws('some err msg')

stub_of_sum$f(0)
stub_of_sum$f(0)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$withArgs(a = 2)$throws('some err msg')

stub_of_sum$f(1)
stub_of_sum$f(2)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$withExactArgs(a = 2)$throws('good') # won't work because value for b is not defined
stub_of_sum$withExactArgs(a = 2, b = 1)$throws('nice')

stub_of_sum$f(1)
stub_of_sum$f(2)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

ans <- stub_of_sum$f(3)
ans <- stub_of_sum$f(3)
stub_of_sum$calledTimes()
ans <- stub_of_sum$f(3)
stub_of_sum$calledTimes()

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(1)$expects(a = 1)$returns('good')
stub_of_sum$onCall(3)$expects(a = 3)$returns('nice')

stub_of_sum$f(3)
stub_of_sum$f(3)
stub_of_sum$f(3)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(1)$expects(a = 1)
stub_of_sum$onCall(1)$returns('good')
stub_of_sum$onCall(3)$returns('nice')
stub_of_sum$onCall(3)$expects(a = 3)

stub_of_sum$f(3)
stub_of_sum$f(3)
stub_of_sum$f(3)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(1)$strictlyExpects(a = 3)$returns('good')
stub_of_sum$onCall(3)$strictlyExpects(a = 3, b = 1)$returns('nice')

stub_of_sum$f(3)
stub_of_sum$f(3)
stub_of_sum$f(3)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(1)$expects(a = 1)$throws('good')
stub_of_sum$onCall(3)$expects(a = 3)$throws('nice')

stub_of_sum$f(3)
stub_of_sum$f(3)
stub_of_sum$f(3)

## ----error=TRUE----------------------------------------------------------
sum <- function(a, b = 1) return(a + b)
stub_of_sum <- stub(sum)

stub_of_sum$onCall(1)$strictlyExpects(a = 3)$throws('good')
stub_of_sum$onCall(3)$strictlyExpects(a = 3, b = 1)$throws('nice')

stub_of_sum$f(3)
stub_of_sum$f(3)
stub_of_sum$f(3)

