library(staRdom)


### Name: eem_getextreme
### Title: Determines the the biggest range of EEM spectrum where data is
###   available from each sample.
### Aliases: eem_getextreme

### ** Examples

data(eem_list)
eem_getextreme(eem_list)

eem_list <- eem_range(eem_list,ex = c(250,Inf),em = c(280,500))
eem_getextreme(eem_list)



