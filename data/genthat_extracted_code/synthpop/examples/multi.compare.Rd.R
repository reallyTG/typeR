library(synthpop)


### Name: multi.compare
### Title: Multivariate comparison of synthesised and observed data
### Aliases: multi.compare

### ** Examples

### default synthesis of selected variables
vars <- c("sex", "age", "edu", "smoke")
ods  <- na.omit(SD2011[1:1000, vars])
s1 <- syn(ods)

### categorical var
multi.compare(s1, ods, var = "smoke", by = c("sex","edu"))

### numeric var
multi.compare(s1, ods, var = "age", by = c("sex"), y.hist = "density", binwidth = 5)
multi.compare(s1, ods, var = "age", by = c("sex", "edu"), cont.type = "boxplot")



