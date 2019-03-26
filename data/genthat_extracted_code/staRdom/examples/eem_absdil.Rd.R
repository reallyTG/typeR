library(staRdom)


### Name: eem_absdil
### Title: Multiply absorbance data according to the dilution and remove
###   absorbance from samples where undiluted data is used.
### Aliases: eem_absdil

### ** Examples

data(eem_list)
data(abs_data)

abs_data <- abs_data[1:31]

dilution <- data.frame(dilution = c(rep(1,10),rep(5,10),rep(10,10)))
rownames(dilution) <- eem_names(eem_list)

abs_data2 <- eem_absdil(abs_data,eem_list,dilution)




