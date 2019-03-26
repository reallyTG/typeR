## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE, screenshot.force = FALSE)
get_dt <- function(item) {
  Name <- names(item)
  Description <- unname(unlist(lapply(item, function(x){
    if (is.na(x["description"])) return("")
    return(x["description"])}))
  )
  Publication <- unname(unlist(lapply(item, function(x){
    if (is.na(x["publication"])) return("")
    return(x["publication"])}))
  )
  data.frame(Name, Description)
}

## ------------------------------------------------------------------------
library(BioInstaller)
meta_info <- get.meta(read.config.params = list(rcmd.parse = TRUE))
unname(unlist(meta_info[1:4]))

## ----echo = FALSE--------------------------------------------------------
DT::datatable(get_dt(meta_info$github$item), escape = FALSE)

## ----echo = FALSE--------------------------------------------------------
DT::datatable(get_dt(meta_info$nongithub$item), escape = FALSE)

## ----echo = FALSE--------------------------------------------------------
DT::datatable(get_dt(meta_info$db$item), escape = FALSE)

