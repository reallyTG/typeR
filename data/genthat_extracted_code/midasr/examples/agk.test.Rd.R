library(midasr)


### Name: agk.test
### Title: Andreou, Ghysels, Kourtellos LM test
### Aliases: agk.test

### ** Examples

##' ##Load data
data("USunempr")
data("USrealgdp")

y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
t <- 1:length(y)

mr <- midas_r(y~t+fmls(x,11,12,nealmon),start=list(x=c(0,0,0)))

agk.test(mr)




