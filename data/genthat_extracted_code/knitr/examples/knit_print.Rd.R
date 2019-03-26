library(knitr)


### Name: knit_print
### Title: A custom printing function
### Aliases: knit_print normal_print

### ** Examples

library(knitr)
# write tables for data frames
knit_print.data.frame = function(x, ...) {
    res = paste(c("", "", kable(x, output = FALSE)), collapse = "\n")
    asis_output(res)
}
# register the method
registerS3method("knit_print", "data.frame", knit_print.data.frame)
# after you define and register the above method, data frames will be printed as
# tables in knitr, which is different with the default print() behavior



