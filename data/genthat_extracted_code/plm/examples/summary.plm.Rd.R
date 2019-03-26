library(plm)


### Name: summary.plm
### Title: Summary for plm objects
### Aliases: summary.plm print.summary.plm
### Keywords: regression

### ** Examples

data("Produc", package = "plm")
zz <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
          data = Produc, index = c("state","year"))
summary(zz)

# summary with a funished vcov, passed as matrix, as function, and
# as function with additional argument
data("Grunfeld", package = "plm")
wi <- plm(inv ~ value + capital,
          data = Grunfeld, model="within", effect = "individual")
summary(wi, vcov = vcovHC(wi))
summary(wi, vcov = vcovHC)
summary(wi, vcov = function(x) vcovHC(x, method = "white2"))

# extract F statistic
wi_summary <- summary(wi)
Fstat <- wi_summary[["fstatistic"]]

# extract estimates and p-values
est <- wi_summary[["coefficients"]][ , "Estimate"]
pval <- wi_summary[["coefficients"]][ , "Pr(>|t|)"]

# print summary only for coefficent "value"
print(wi_summary, subset = "value")



