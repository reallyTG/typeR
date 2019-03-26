## ---- eval = FALSE-------------------------------------------------------
#  Sys.getenv("GLASSDOOR_PID")
#  Sys.getenv("GLASSDOOR_PAT")

## ------------------------------------------------------------------------
library(glassdoor)
if (have_gd_tokens()) {
res = gd_api(
  action = "employers",
  other = NULL,
  version = 1,
  format = "json",
  q = "pharmaceuticals")
}

## ------------------------------------------------------------------------
agent = gd_user_agent()

## ------------------------------------------------------------------------
if (have_gd_tokens()) {
  res = gd_job_stats(
    job_title = "sales associate",
    returnJobTitles = TRUE)
    head(res$content$response$jobTitles, 3)
}

## ------------------------------------------------------------------------
job_name = "sales associate"
if (have_gd_tokens()) {
  res = gd_job_prog(
    jobTitle = job_name)
  head(res$content$response$results, 2)
}

## ------------------------------------------------------------------------
if (have_gd_tokens()) {
  res = gd_company(
    q = "dropbox")
  print(res$content$response$employers[[1]]$ceo)
}

