library(arsenal)


### Name: freqlist
### Title: freqlist
### Aliases: freqlist freqlist.table freqlist.formula

### ** Examples

# load mockstudy data
data(mockstudy)
tab.ex <- table(mockstudy[c("arm", "sex", "mdquality.s")], useNA = "ifany")
noby <- freqlist(tab.ex, na.options = "include")
summary(noby)
withby <- freqlist(tab.ex, strata = c("arm","sex"), na.options = "showexclude")
summary(withby)



