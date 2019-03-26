library(psych)


### Name: mssd
### Title: Find von Neuman's Mean Square of Successive Differences
### Aliases: mssd rmssd autoR
### Keywords: multivariate models

### ** Examples

t <- seq(-pi, pi, .1)
trial <- 1: length(t)
gr <- trial %% 8 
c <- cos(t)
ts <- sample(t,length(t))
cs <- cos(ts)
x.df <- data.frame(trial,gr,t,c,ts,cs)
rmssd(x.df)
rmssd(x.df,gr)
autoR(x.df,gr)
describe(x.df)
#pairs.panels(x.df)
#mlPlot(x.df,grp="gr",Time="t",items=c(4:6))



