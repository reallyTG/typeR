library(sarima)

## Wilson (1969) algorithm and examples
context("Wilson (1969) algorithm and examples")

## example (a)
wa_acvf <- c(8004, 2491, 622, 85)
wa_coef <- c(85, 27, 7, 1)

wa_c <- factorizeMA(wa_acvf)
wa_coef == wa_c$par
expect_lt(max(abs(wa_coef - wa_c$par)), 1e-12)

## example (b)
z <- polynom(c(0,1))
Wilson1969_b <- (1 + 1.7*z + 0.99*z^2) * (1 + 1.6*z + 0.98*z^2) * (1 - 0.3*z + 0.95*z^2) *
                (1 - 0.96*z) * (1 + 0.97*z)
wb_coef <- coef(Wilson1969_b)
wb_acvf <- MAacvf0(wb_coef)
wb_c <- factorizeMA(wb_acvf)
wb_c20 <- factorizeMA(wb_acvf, tol = 1e-20)
expect_lt(max(abs(wb_coef - wb_c$par)), 1e-6)
expect_lt(max(abs(wb_coef - wb_c20$par)), 1e-9)
