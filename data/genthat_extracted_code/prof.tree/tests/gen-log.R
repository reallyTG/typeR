setwd("tests/testthat/")

Rprof("Rprof.out", interval = 0.001)
for (i in 1:100) {
    clotting <- data.frame(
        u = c(5,10,15,20,30,40,60,80,100),
        lot1 = c(118,58,42,35,27,25,21,19,18),
        lot2 = c(69,35,26,21,18,16,13,12,12))
    summary(glm(lot1 ~ log(u), data = clotting, family = Gamma))
    summary(glm(lot2 ~ log(u), data = clotting, family = Gamma))
}
Rprof(NULL)

Rprof("Rprof-line.out", interval = 0.001, line.profiling = TRUE)
for (i in 1:100) {
    clotting <- data.frame(
        u = c(5,10,15,20,30,40,60,80,100),
        lot1 = c(118,58,42,35,27,25,21,19,18),
        lot2 = c(69,35,26,21,18,16,13,12,12))
    summary(glm(lot1 ~ log(u), data = clotting, family = Gamma))
    summary(glm(lot2 ~ log(u), data = clotting, family = Gamma))
}
Rprof(NULL)

Rprof("Rprof-gc.out", interval = 0.001, line.profiling = TRUE, gc.profiling = TRUE)
for (i in 1:100) {
    clotting <- data.frame(
        u = c(5,10,15,20,30,40,60,80,100),
        lot1 = c(118,58,42,35,27,25,21,19,18),
        lot2 = c(69,35,26,21,18,16,13,12,12))
    summary(glm(lot1 ~ log(u), data = clotting, family = Gamma))
    summary(glm(lot2 ~ log(u), data = clotting, family = Gamma))
}
Rprof(NULL)

Rprof("Rprof-source.out", interval = 0.001, line.profiling = TRUE)
source("script.R")
Rprof(NULL)
