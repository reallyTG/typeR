library(idefix)


### Name: Datatrans
### Title: Data transformation.
### Aliases: Datatrans

### ** Examples

idefix.data <- aggregate_design 
des <- as.matrix(idefix.data[, 3:8], ncol = 6)
y <- idefix.data[, 9]
bayesm.data <- Datatrans(pkg = "bayesm", des = des, y = y, 
n.alts = 2, n.sets = 8, n.resp = 7, bin = TRUE)
Mix.pro.data <- Datatrans(pkg = "Mixed.Probit", des = des, y = y,
 n.alts = 2, n.sets = 8, n.resp = 7, bin = TRUE)
mlogit.data <- Datatrans(pkg = "mlogit", des = des, y = y,
 n.alts = 2, n.sets = 8, n.resp = 7, bin = TRUE)



