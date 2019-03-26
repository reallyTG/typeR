library(glassdoor)


### Name: results
### Title: Results of a Glassdoor object
### Aliases: results results.default results.gd_api results.gd_job_prog

### ** Examples

if (have_gd_tokens()) {
   gd = gd_job_prog(jobTitle = "cashier", countryId = 1)
   res = results(gd)
}



