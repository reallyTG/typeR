library(glassdoor)


### Name: gd_job_prog
### Title: Glassdoor Job Progression
### Aliases: gd_job_prog

### ** Examples

if (have_gd_tokens()) {

paste0("&countryId=1&jobTitle=cashier")
res = gd_job_prog(jobTitle = "cashier", countryId = 1)
}




