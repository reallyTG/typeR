library(leanpubr)


### Name: lp_job_status
### Title: Leanpub Job Status
### Aliases: lp_job_status

### ** Examples

if (lp_have_api_key()) {
stat = lp_job_status(slug = "neuroimagingforstatisticians",
nonstop = TRUE, error = FALSE)
}



