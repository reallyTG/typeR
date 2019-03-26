library(pubh)


### Name: gen_bst_df
### Title: Generate a data frame with estimate and bootstrap CIs.
### Aliases: gen_bst_df

### ** Examples

data(kfm, package = "ISwR")
gen_bst_df(dl.milk ~ sex, data = kfm)
bar_error(dl.milk ~ sex, data = kfm, ylim = c(0,9), ylab  = "Breast-milk intake (dl/day)")

data(birthwt, package = "MASS")
birthwt$smoke <- factor(birthwt$smoke, labels=c("Non-smoker", "Smoker"))
birthwt$Race <- 0
birthwt$Race[birthwt$race>1] <- 1
birthwt$Race <- factor(birthwt$Race, labels=c("White", "Non-white"))
gen_bst_df(bwt ~ smoke|Race, data = birthwt)
bar_error(bwt ~ smoke|Race, data = birthwt, ylim = c(0, 3800), ylab  = "Birth weight (g)")



