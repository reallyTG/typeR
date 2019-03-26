## ----chunk-options, include=FALSE----------------------------------------
library("knitr")
opts_chunk$set(eval = FALSE)

## ----wflow-publish-theme-------------------------------------------------
#  wflow_publish("analysis/_site.yml", "Change the theme", republish = TRUE)

## ----wflow-publish-navbar------------------------------------------------
#  wflow_publish("analysis/_site.yml", "Add main result page to navbar",
#                republish = TRUE)

## ----https-to-ssh--------------------------------------------------------
#  wflow_git_remote(remote = "origin", user = "myname", repo = "myproject",
#                protocol = "ssh", action = "set_url")

