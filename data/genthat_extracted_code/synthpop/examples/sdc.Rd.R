library(synthpop)


### Name: sdc
### Title: Tools for statistical disclosure control (sdc)
### Aliases: sdc
### Keywords: manip

### ** Examples

ods <- SD2011[1:1000,c("sex","age","edu","marital","income")]
s1 <- syn(ods, m = 2)
s1.sdc <- sdc(s1, ods, label="false_data", rm.replicated.uniques = TRUE,
recode.vars = c("age","income"),
bottom.top.coding = list(c(20,80),c(NA,2000)),
recode.exclude = list(NA,c(NA,-8)))



