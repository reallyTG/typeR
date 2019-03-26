library(IQCC)


### Name: cchart.p
### Title: p-chart
### Aliases: cchart.p

### ** Examples


data(binomdata)
attach(binomdata)
cchart.p(x1 = Di[1:12], n1 = ni[1:12])
cchart.p(x1 = Di[1:12], n1 = ni[1:12], type = "CF", x2 = Di[13:25], n2 = ni[13:25])
cchart.p(type = "std", p2 = Di[13:25], n2 = ni[13:25], phat = 0.1115833)




