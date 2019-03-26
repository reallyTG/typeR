library(leanpubr)


### Name: lp_sales
### Title: Leanpub Sales Information
### Aliases: lp_sales lp_all_sales

### ** Examples

## No test: 
if (lp_have_api_key()) {
lp_all_sales(slug = "biostatmethods", query = list(page=2))
}
## End(No test)



