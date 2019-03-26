library(ggdmc)


### Name: TableParameters
### Title: Table response and parameter
### Aliases: TableParameters

### ** Examples

m1 <- BuildModel(
  p.map     = list(a = "1", v = "F", z = "1", d = "1", sz = "1", sv = "F",
                   t0 = "1", st0 = "1"),
  match.map = list(M = list(s1 = "r1", s2 = "r2")),
  factors   = list(S = c("s1", "s2"), F = c("f1","f2")),
  constants = c(st0 = 0, d = 0),
  responses = c("r1","r2"),
  type      = "rd")

m2 <- BuildModel(
  p.map = list(A = "1", B = "1", mean_v = "M", sd_v = "1",
    t0 = "1", st0 = "1"),
  constants = c(st0 = 0, sd_v = 1),
  match.map = list(M = list(s1 = 1, s2 = 2)),
  factors   = list(S = c("s1", "s2")),
  responses = c("r1", "r2"),
  type      = "norm")

pvec1 <- c(a = 1.15, v.f1 = -0.10, v.f2 = 3, z = 0.74, sz = 1.23,
           sv.f1 = 0.11, sv.f2 = 0.21, t0 = 0.87)
pvec2 <- c(A = .75, B = .25, mean_v.true = 2.5, mean_v.false = 1.5,
           t0 = .2)

print(m1, pvec1)
print(m2, pvec2)

accMat1 <- TableParameters(pvec1, "s1.f1.r1", m1, FALSE)
accMat2 <- TableParameters(pvec2, "s1.r1",    m2, FALSE)

##    a    v   t0    z d   sz   sv st0
## 1.15 -0.1 0.87 0.26 0 1.23 0.11   0
## 1.15 -0.1 0.87 0.26 0 1.23 0.11   0

##    A b  t0 mean_v sd_v st0
## 0.75 1 0.2    2.5    1   0
## 0.75 1 0.2    1.5    1   0



