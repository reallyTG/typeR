library(leanpubr)


### Name: lp_get_wrapper
### Title: Leanpub Wrapper for GET/POST statements
### Aliases: lp_get_wrapper lp_post_wrapper

### ** Examples

if (lp_have_api_key()) {
stat = lp_get_wrapper(slug = "neuroimagingforstatisticians",
    endpoint = "/job_status", nonstop = TRUE, error = FALSE)
}



