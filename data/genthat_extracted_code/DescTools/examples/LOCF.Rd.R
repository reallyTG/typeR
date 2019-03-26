library(DescTools)


### Name: LOCF
### Title: Last Observation Carried Forward
### Aliases: LOCF LOCF.default LOCF.matrix LOCF.data.frame
### Keywords: univar

### ** Examples

d.frm <- data.frame(
  tag=rep(c("mo", "di", "mi", "do", "fr", "sa", "so"), 4)
, val=rep(c(runif(5), rep(NA,2)), 4) )

d.frm$locf <- LOCF( d.frm$val )
d.frm



