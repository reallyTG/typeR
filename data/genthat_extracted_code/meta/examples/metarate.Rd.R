library(meta)


### Name: metarate
### Title: Meta-analysis of single incidence rates
### Aliases: metarate
### Keywords: htest

### ** Examples

#
# Apply various meta-analysis methods to estimate incidence rates
#
m1 <- metarate(4:1, c(10, 20, 30, 40))
m2 <- update(m1, sm="IR")
m3 <- update(m1, sm="IRS")
m4 <- update(m1, sm="IRFT")
#
m1
m2
m3
m4
#
forest(m1)
forest(m1, irscale=100)
forest(m1, irscale=100, irunit="person-days")
forest(m1, backtransf = FALSE)
# forest(m2)
# forest(m3)
# forest(m4)
#
m5 <- metarate(40:37, c(100, 200, 300, 400), sm="IRFT")
m5



