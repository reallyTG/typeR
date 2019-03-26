## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
CONFIGURED <- !is.null(getOption("dw.auth_token"))
knitr::opts_chunk$set(
  collapse = FALSE,
  comment = "##",
  purl = NOT_CRAN && CONFIGURED,
  eval = NOT_CRAN && CONFIGURED
)

