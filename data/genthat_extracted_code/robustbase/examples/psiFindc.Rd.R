library(robustbase)


### Name: psi.findc
### Title: Find Tuning Constant(s) for "lqq" and "ggw" Psi Functions
### Aliases: .psi.ggw.findc .psi.lqq.findc .psi.const
### Keywords: utilities

### ** Examples

(c.ge95 <- .psi.ggw.findc(ms = -0.5, b = 1.5, eff = 0.95))
(c.ge90 <- .psi.ggw.findc(ms = -0.5, b = 1.5, eff = 0.90))
(c.gb50 <- .psi.ggw.findc(ms = -0.5, b = 1.5,  bp = 0.50))
stopifnot(all.equal(c.ge95, c(0, 1.386362,   1.5, 1.0628199,  4.7773893), tol = 1e-5),
          all.equal(c.ge90, c(0, 1.0282811,  1.5, 0.87086259, 3.2075233), tol = 1e-5),
          all.equal(c.gb50, c(0, 0.20367394, 1.5, 0.29591308, 0.37033962),tol = 1e-5))

(cl.e.95 <- .psi.lqq.findc(ms = -0.5, b.c = 1.5, eff = .95))
(cl.b.50 <- .psi.lqq.findc(ms = -0.5, b.c = 1.5,  bp = .50))
stopifnot(all.equal(cl.e.95, c(1.4734061,  0.98227073, 1.5), tol = 1e-5),
          all.equal(cl.b.50, c(0.40154568, 0.26769712, 1.5), tol = 1e-5))



