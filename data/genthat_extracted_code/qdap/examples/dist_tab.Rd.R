library(qdap)


### Name: dist_tab
### Title: SPSS Style Frequency Tables
### Aliases: dist_tab
### Keywords: distribution, frequency

### ** Examples

## Not run: 
##D dist_tab(rnorm(10000), 10)
##D dist_tab(sample(c("red", "blue", "gray"), 100, T), right = FALSE)
##D dist_tab(CO2, 4)
##D 
##D out1 <- dist_tab(mtcars[, 1:3])
##D ltruncdf(out1, 4)
##D 
##D out2 <- dist_tab(mtcars[, 1:3], 4)
##D ltruncdf(out2, 4)
##D 
##D wdst <- with(mraja1spl, word_stats(dialogue, list(sex, fam.aff, died)))
##D out3 <- dist_tab(wdst$gts[1:4])
##D ltruncdf(out3, 4)
## End(Not run)



