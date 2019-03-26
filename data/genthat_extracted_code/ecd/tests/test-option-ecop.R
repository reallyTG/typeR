
suppressMessages(library(fOptions))

context("Test on Option Pricing")

eps <- 0.001 # default tolerance of error for real number

# two SPX options from 2015-03-19, a day before triple witching
C <- c(0.05, 1.8, 50, 140.2)
K <- c(2200, 2100, 2040, 1950)
S <- 2089.27
T <- 1/365
y <- 0.019
vol0 <- c(0.3710537, 0.128886, 0.294296, 0.7237632) 

# ------------------------------------------------------
test_that("test the BS implied volatility",{
    vol <- ecop.bs_implied_volatility(C, K, S, T, div_yield=y)
    expect_true(sum(abs(vol/vol0-1)) < eps)
})

test_that("test the BS implied volatility using MPFR",{
    vol <- ecop.bs_implied_volatility(C*ecd.mp1, K, S, T, div_yield=y)
    expect_true(sum(abs(vol/vol0-1)) < eps)
})

# ------------------------------------------------------
ki <- seq(-10, 10)

test_that("test k1 formula used in OGF star",{
    sigma = 0.001
    mu = 0.002

    k <- ki*sigma+mu
    
    sigma1 = 0.003
    mu_D1 = -sigma1^2/4
    
    ki1a <- sigma/sigma1*ki + (mu/sigma1+sigma1/4)
    ki1b <- (k-mu_D1)/sigma1
    
    expect_true(max(abs(ki1a-ki1b)) < eps)
})

test_that("test exact formula for lambda=1 OGF star",{
    ld1 <- ecld(lambda=1)

    L1 <- ecld.ogf_star(ld1, ki)
    L2 <- 1/2/sqrt(pi)*(exp(-ki^2) - sqrt(pi)*abs(ki)*Rmpfr::erfc(abs(ki)))
    
    expect_true(max(abs(L1/L2-1)) < eps)
})

# ------------------------------------------------------
test_that("test asymptotic formula for lambda=1 OGF star",{
    ki <- c(5, 8, 10)
    ld1 <- ecld(lambda=1)
    
    L1 <- ecld.ogf_star(ld1, ki)
    L2 <- ecld.ogf_star_exp(ld1, ki, order=4)
    
    expect_true(max(abs(L1/L2-1)) < eps)
})


# ------------------------------------------------------
x <- seq(4.7, 15, length.out=100)*ecd.mp1
erf2 <- function(x,sgn) 1/x*(1+sgn/2/x^2) # first two terms

test_that("test erfq(x,1) vs erfq_sum",{
    y1 <- ecd.erfq(x,1) -erf2(x,1)
    z1 <- ecd.erfq_sum(x,1) -erf2(x,1)
    p1 <- ecd.erfcx(x)*sqrt(pi) -erf2(x,1)
    err1 = max(abs((y1/z1-1)*1e8))
    err2 = max(abs((y1/p1-1)*1e8))
    expect_true(err1 < 1 & err2 < 1)
})
test_that("test erfq(x,-1) vs erfq_sum",{
    y2 <- ecd.erfq(x,-1) -erf2(x,-1)
    z2 <- ecd.erfq_sum(x,-1) -erf2(x,-1)
    p2 <- ecd.erfi(x)*exp(-x^2)*sqrt(pi) -erf2(x,-1)
    err1 = max(abs((y2/z2-1)*1e8))
    err2 = max(abs((y2/p2-1)*1e8))
    expect_true(err1 < 1 & err2 < 1)
})

test_that("test erfq(x,+/-1) vs erfi/c",{
    y1 <- ecd.erfq(x,-1)
    y2 <- sqrt(pi)*exp(-x^2)*ecd.erfi(x)
    z1 <- ecd.erfq(x,1)
    z2 <- sqrt(pi)*exp(x^2)*ecd.erfc(x)
    err1 = max(abs(y2/y1-1))
    err2 = max(abs(z2/z1-1))
    expect_true(err1 < eps & err2 < eps)
})

test_that("test quartic mu_D",{
    z = 5
    sigma <- (1/2/z)^2
    ld <- ecld(lambda=4, sigma=sigma)
    y1 <- ecld.mu_D_quartic(ld)
    y2 <- ecld.mu_D(ld)
    y3 <- -log(ecld.mgf_quartic(ld))
    y4 <- -log(ecld.mgf(ld))
    err2 = max(abs(y2/y1-1))
    err3 = max(abs(y3/y1-1))
    err4 = max(abs(y4/y1-1))
    expect_true(err2 < eps & err3 < eps & err4 < eps)
})
# ------------------------------------------------------
# small sigma limit for quartic model

ld <- ecld.quartic(sigma=0.001*ecd.mp1, rho=0, epsilon=0, mu_plus=0)
atm_ki <- ecld.quartic_Qp_atm_ki(ld)

test_that("test quartic ATM vol location at small sigma",{
    Qp <- ecld.quartic_Qp(ld,atm_ki)
    err1 = abs(-11.58/atm_ki-1)
    err2 = abs(sqrt(240)/Qp-1)
    expect_true(err1 < eps & err2 < eps)
})
test_that("test quartic ATM skew at small sigma",{
    S <- ecld.quartic_Qp_atm_skew(ld)
    S2 <- ecld.quartic_Qp_skew(ld, atm_ki)
    err1 = abs(-0.4465/S-1)
    err2 = abs(S2/S-1)
    expect_true(err1 < eps & err2 < eps)
})

test_that("test quartic ATM vol location at sigma=0",{
    atm_ki <- ecld.quartic_SN0_atm_ki()
    rho_stdev <- ecld.quartic_SN0_rho_stdev()
    err1 = abs(-11.48/atm_ki-1)
    err2 = abs(1.048/rho_stdev-1)
    expect_true(err1 < eps & err2 < eps)
})
test_that("test quartic ATM skew at small sigma",{
    S <- ecld.quartic_SN0_skew()
    err = abs(-0.4495/S-1)
    expect_true(err < eps)
})
test_that("test quartic max RNV at sigma=0",{
    S <- ecld.quartic_SN0_max_RNV()
    err = abs(0.2962/S-1)
    expect_true(err < eps)
})

# ------------------------------------------------------
# VIX
test_that("test ecld.from_sd at lambda=3",{
    sd = 0.5
    ld1 <- ecld.from_sd(3, sd)
    ld2 <- ecld.from_sd(3, sd, beta=0.5)
    err1 = abs(ecld.sd(ld1)/sd-1)
    err2 = abs(ecld.sd(ld2)/sd-1)
    expect_true(err1 < eps & err2 < eps)
})
test_that("test lambda/skew ratio at lambda=3",{

    lambda = 3
    
    # use a very small atm_imp_k to approximate small-sigma limit
    atm_imp_k = 0.001

    get_ld1 <- function(sd, lambda, beta=0) {
        lds <- ecop.get_ld_triple(lambda, sd, beta, 
                              mu_plus_ratio=0, 
                              epsilon_ratio=0, 
                              atm_imp_k=atm_imp_k)
        lds$ld1
    }
    sd <- ecop.find_fixed_point_sd_by_lambda(get_ld1, lambda, beta=0)
    ld1 <- get_ld1(sd, lambda, beta=0)
    atm_ki <- ecld.fixed_point_atm_ki(ld1)
    atm_skew <- ecld.op_Q_skew(ld1, atm_ki, atm_ki*0.001)
    ls_ratio_approx <- lambda/atm_skew
    
    # L_star implementation
    atm_ki <- ecld.fixed_point_SN0_atm_ki(lambda)
    atm_skew <- ecld.op_Q_skew(ld1, atm_ki, atm_ki*0.001)
    ls_ratio_star <- lambda/atm_skew

    ls_ratio_RN0 <- ecld.fixed_point_SN0_lambda_skew_ratio(lambda)
    ls_ratio_num <- 8.242
    err1 = abs(ls_ratio_approx/ls_ratio_num-1)
    err2 = abs(ls_ratio_star/ls_ratio_num-1)
    err3 = abs(ls_ratio_RN0/ls_ratio_num-1)
    
    expect_true(err1 < eps*2 & err2 < eps*2 & err3 < eps)
})

# -------------------------------------------------------
for (lambda in c(1,2,3,4)) {
    test_that(paste("test ecld.ogf shift at lambda=", lambda),{
        
        ld1 <- ecld(lambda, 0.01, rho=0.01)
        ld2 <- ecld(lambda, 0.01, mu=0.01)
        v1 <- ecld.ogf(ld1, -0.01-ld1@rho, otype="p", RN=FALSE)
        v2 <- ecld.ogf(ld2, -0.01, otype="p", RN=FALSE)*exp(-ld1@rho)

        err = abs(v1/v2-1)
        expect_true(err < eps)
    })
}
