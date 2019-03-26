library(leanpubr)


### Name: lp_download
### Title: Leanpub Download Latest Version
### Aliases: lp_download

### ** Examples

if (lp_have_api_key()) {
slug = "biostatmethods"
res = lp_download(slug, verbose = FALSE, nonstop = TRUE, error = FALSE,
format = "mobi")
file.exists(res)
}



