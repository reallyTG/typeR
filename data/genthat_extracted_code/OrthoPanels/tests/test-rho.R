
context("rho")

## Generate test data without littering the environment with temporary
## variables
x <- NULL
y <- NULL
local({
    set.seed(123)
    N <- 3
    T <- 2

    dd <- generate_data(N=N, T=T)
    x <<- dd$x
    y <<- dd$y
})


## Sanity check
test_that('data', {
    expect_equal(x, array(c(-1.31047564655221, -0.679491608575424, -0.289083794010798, 
                            -0.23017748948328, 0.129287735160946, -1.26506123460653,
                            2.30870831414912, 2.46506498688328, 0.0631471481064739),
                           dim = c(3, 1, 3)))
    expect_equal(y, matrix(c(-2.10089979337606, 1.10899305269782, 2.51416798413193,
                             -1.98942425038169, 0.729823109874504, 2.93377535075353,
                             -0.352340885393167, 0.230231415863224, 0.531844092800363),
                           nrow = 3, ncol = 3, byrow=TRUE))
})


test_that('centering', {
    Ti <- Ti(x, y) - 1
    X <- round(center_x(x, Ti), 2)
    expect_equal(X, array(c(-0.2, 0.2, 0.7, -0.7, 1.2, -1.2),
                          dim = c(2, 1, 3)))

    Y <- round(center_y(y, Ti), 2)
    expect_equal(Y, matrix(c(0.11, 1.75, -0.38, -0.88, 0.42, -1.98),
                           nrow = 2, ncol = 3))
})


test_that('w', {
    Ti <- Ti(x, y) - 1
    W <- round(w(center_y(y, Ti), rho = .5), 2)
    expect_equal(W, matrix(c(0.11, 1.69, -0.38, -0.69, 0.42, -2.19),
                           nrow = 2, ncol = 3))
})


test_that('b', {
    expect_equal(b(rho = .5, T = 2), 0.25)
    expect_equal(b(rho = .5, T = 4), 0.447916666666667)
})


test_that('y_', {
    Ti <- Ti(x, y) - 1
    expect_equal(lapply(1:3, y_, y = center_y(y, Ti)),
                 list(c(0, 0.111475542994372),
                      c(0, -0.379169942823318),
                      c(0, 0.419607366621602)))
})


test_that('Q_star', {
    Ti <- Ti(x, y) - 1
    X <- center_x(x, Ti)
    W <- w(center_y(y, Ti), rho = .5)

    expect_equal(wHw(W), matrix(4.70895872876527, 1))
    
    expect_equal(wHx(X, W), matrix(3.66139998854137, 1))
    expect_equal(xHw(X, W), matrix(3.66139998854137, 1))
    
    expect_equal(Hstar(X), matrix(1/0.254264116811756, 1))
    
    expect_equal(Q_star(X, W), matrix(1.30033214991006, 1))
})


test_that('pdf', {
    rho <- -1:1
    expected_pdf <- c(0.21205474066272, 0.876734313547208, 2.91567329477363) # c(0.21374923, 0.87969049, 2.91235100)
    expect_equal(expected_pdf, p_rho(x, y, rho))
})
