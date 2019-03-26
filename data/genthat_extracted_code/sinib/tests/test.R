library(sinib)

# Small size, small probability:
size=as.integer(c(12, 14, 4, 2, 20, 17, 11, 1, 8, 11))
prob=c(0.074, 0.039, 0.095, 0.039, 0.053, 0.043, 0.067, 0.018, 0.099, 0.045)

x=as.integer(seq(1,19,2))
true=c(0.0164, 0.0994, 0.1716, 0.1346, 0.0587, 0.0160, 0.002913, 0.0003752, 0.00003544, 0.000002525)
stopifnot(all(((dsinib(x,size,prob)-true))/true<0.001))

true=c(0.9972, 0.9308, 0.6847, 0.3481, 0.1187, 0.0276, 0.004546, 0.0005435, 0.00004855, 0.000003313)
q=as.integer(seq(0,18,2))
stopifnot(all((psinib(q,size,prob,lower.tail=FALSE)-true)/true<0.01))

p=psinib(q,size,prob)
stopifnot(all(qsinib(p,size,prob)==q))


# Large size, large probability:
size=as.integer(c(120, 140, 40, 20, 200, 170, 110, 10, 80, 110))
prob=c(0.74, 0.39, 0.95, 0.39, 0.53, 0.43, 0.67, 0.18, 0.99, 0.45)

x=as.integer(seq(510,640,10))
true=c(0.000002363, 0.00003730, 0.0003638, 0.002195, 0.008202, 0.0190, 0.0272, 0.0242, 0.0133, 0.004501, 0.0009419, 0.0001213, 0.000009581, 0.0000004630)
stopifnot(all(((dsinib(x,size,prob)-true))/true<0.001))

true=c(0.99993616, 0.9998791, 0.998549, 0.9889, 0.9444, 0.8161, 0.5825, 0.3140, 0.1194, 0.0306, 0.005133, 0.0005522, 0.00003757, 0.000001599)
q=as.integer(seq(509,639,10))
stopifnot(all((psinib(q,size,prob,lower.tail=FALSE)-true)/true<0.01))

p=psinib(q,size,prob)
stopifnot(all(qsinib(p,size,prob)==q))
