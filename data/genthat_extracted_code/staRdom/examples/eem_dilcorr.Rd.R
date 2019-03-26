library(staRdom)


### Name: eem_dilcorr
### Title: Create table how samples should be corrected because of dilution
### Aliases: eem_dilcorr

### ** Examples

data(eem_list)
data(abs_data)

abs_data <- abs_data[1:31]

dilution <- data.frame(dilution = c(rep(1,10),rep(5,10),rep(10,10)))
rownames(dilution) <- eem_names(eem_list)

dilcorr <- eem_dilcorr(eem_list,abs_data,dilution, auto = TRUE, verbose = FALSE)



