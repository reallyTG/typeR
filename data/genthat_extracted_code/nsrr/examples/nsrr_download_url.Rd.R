library(nsrr)


### Name: nsrr_download_url
### Title: NSRR Download file
### Aliases: nsrr_download_url nsrr_download_file

### ** Examples

dataset = "shhs"
path = "datasets/shhs-data-dictionary-0.13.1-domains.csv"
nsrr_download_url(dataset, path, token = "")
if (nsrr_have_token()) {
res = nsrr_download_file(dataset, path)
testthat::expect_true(res$success)
path = "biostatistics-with-r/shhs1.txt"
res = nsrr_download_file(dataset, path)
}



