library(leanpubr)


### Name: lp_publish
### Title: Leanpub Publish
### Aliases: lp_publish

### ** Examples

## No test: 
if (lp_have_api_key()) {
slug = "neuroimagingforstatisticians"
res = lp_publish(slug, nonstop = TRUE, error = FALSE)
}
## End(No test)



