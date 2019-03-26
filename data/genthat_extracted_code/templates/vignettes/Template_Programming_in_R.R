## ----results='asis', echo=FALSE------------------------------------------
cat(gsub("\\n   ", "", packageDescription("templates", fields = "Description")))

## ----eval = FALSE--------------------------------------------------------
#  devtools::install_github("wahani/templates")

## ----eval = FALSE--------------------------------------------------------
#  install.packages("templates")

## ------------------------------------------------------------------------
library("templates")
library("magrittr")

sqlTemplate <- tmpl(
  ~ `SELECT *
   FROM someTable
   WHERE something IN {{ collapseInParan(ids) }};`
)

collapseInParan <- function(x) {
  # just a helper function
  paste("(", paste(x, collapse = ", "), ")")
}

tmplUpdate(
  sqlTemplate,
  ids = 1:10
)

## ------------------------------------------------------------------------
tFun <- function() {
  s <- "great idea!!!"
  cat({{ toupper(begin) }}, s, "\n")
  invisible(NULL)
}

tmpl(tFun, begin ~ "This is a")

## ------------------------------------------------------------------------
tExpr <- tmpl( ~ {
  cat({{ toupper(begin) }}, "\n")
})

tmpl(tExpr, begin ~ "hi")
tmplAsFun(tExpr, begin ~ "hi")()
tmplEval(tExpr, begin ~ "hi")

## ------------------------------------------------------------------------
tChar <- tmpl('{
  cat({{ toupper(begin) }}, "\n")
}')

tChar %>%
  tmpl(begin ~ "hi") %>%
  tmplEval

