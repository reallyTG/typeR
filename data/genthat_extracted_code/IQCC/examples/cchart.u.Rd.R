library(IQCC)


### Name: cchart.u
### Title: u-chart
### Aliases: cchart.u

### ** Examples


data(moonroof)
attach(moonroof)
cchart.u(x1 = yi[1:17], n1 = ni[1:17])
cchart.u(x1 = yi[1:17], n1 = ni[1:17], type = "CF", x2 = yi[18:34], n2 = ni[18:34])
cchart.u(type = "std", u2 = ui[18:34], n2 = ni[18:34], lambda = 1.4)




