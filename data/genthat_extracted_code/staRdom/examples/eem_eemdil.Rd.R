library(staRdom)


### Name: eem_eemdil
### Title: Correct names of EEM samples to match undiluted absorbance data.
### Aliases: eem_eemdil

### ** Examples

data(eem_list)
data(abs_data)

dilution <- data.frame(dilution = c(rep(1,10),rep(5,10),rep(10,10)))
rownames(dilution) <- eem_names(eem_list)

eem_list2 <- eem_eemdil(eem_list,abs_data,dilution)




