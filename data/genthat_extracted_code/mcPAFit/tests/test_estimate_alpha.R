
library("mcPAFit")

net <- simple_net(time_step = 1000, p = 0.5)

alpha <- estimate_alpha(net)
