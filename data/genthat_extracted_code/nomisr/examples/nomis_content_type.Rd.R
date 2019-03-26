library(nomisr)


### Name: nomis_content_type
### Title: Nomis dataset content types
### Aliases: nomis_content_type

### ** Examples

## No test: 
a <- nomis_content_type("sources")

tibble::glimpse(a)

b <- nomis_content_type("sources", id = "census")

tibble::glimpse(b)
## End(No test)



