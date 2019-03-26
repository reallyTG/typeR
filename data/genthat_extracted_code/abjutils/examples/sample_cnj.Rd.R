library(abjutils)


### Name: sample_cnj
### Title: Generate sample Brazilian lawsuit identification numbers
### Aliases: sample_cnj

### ** Examples

{
#sampling the parameters
sample_cnj(3, foros = "0000",
anos = "2015", orgao = 8, tr = 26,
first_dig = "0",sample_pars = TRUE, return_df = FALSE)

sample_cnj(10, foros = c("0000","0001"),
anos = c("2014","2015"), orgao = 8, tr = 26,
first_dig = "0",sample_pars = TRUE, return_df = FALSE)

#not sampling the parameters

sample_cnj(3, foros = c("0000","0001","0002"),
anos = c("2014","2015","2016"), orgao = rep(8,3), tr = rep(26,3),
first_dig = "0",sample_pars = FALSE, return_df = FALSE)
}




