library(staRdom)


### Name: ggeem
### Title: EEM spectra plotted with ggplot2
### Aliases: ggeem ggeem.default ggeem.eemlist ggeem.eem ggeem.parafac
###   ggeem.data.frame

### ** Examples

## plotting one distinct sample
data(eem_list)
eem <- eem_extract(eem_list,c("sample6","sample7"),keep=TRUE)
ggeem(eem)



