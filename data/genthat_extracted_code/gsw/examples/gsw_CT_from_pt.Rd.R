library(gsw)


### Name: gsw_CT_from_pt
### Title: Conservative Temperature from Potential Temperature
### Aliases: gsw_CT_from_pt

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
pt <- c(28.7832, 28.4209, 22.7850, 10.2305,  6.8292,  4.3245)
CT <- gsw_CT_from_pt(SA, pt)
expect_equal(CT, c(28.809923015982083, 28.439144260767169, 22.786246608464264,
                   10.226165605435785, 6.827183417643142,  4.323565182322069))



