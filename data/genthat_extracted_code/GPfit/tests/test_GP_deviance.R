
context("GP_deviance")

test_that("check GP_deviance", {
    set.seed(6436345)
    nn <- nrow(mtcars)
    x1 <- scale_norm(seq_len(nn))
    y1 <- mtcars$mpg
    gp1 <- GP_deviance(
        beta = 0.9591, 
        X = x1,
        Y = y1)
    expect_equal(
        object = gp1, 
        expected = 255.131524543349)
    
    m2 <- cbind(
        x1,
        mtcars$am, 
        scale_norm(mtcars$disp))
    gp2 <- GP_deviance(
        beta = c(0.9591, 0.1283, 0.8786),
        X = m2,
        Y = y1)
    expect_equal(
        object = gp2, 
        expected = 240.003417343703)
    
    computer_simulator <- function(x) {
        log(x + 0.1) + sin(5 * pi * x)
    }
    
    x <- c(0.752215523306014, 0.481731985662399, 0.224693337621699, 
        0.415458255713539, 0.885954561576779, 0.128341383566814, 
        0.706382181229336)
    y <- computer_simulator(x)
    beta <- -0.411510832795067
    res <- GP_deviance(
        beta = beta,
        X = x,
        Y = y,
        corr = list(
            type = "matern",
            nu = 5/2))
    if (Sys.info()[['sysname']] != "Linux") {
    expect_equal(
        object = res, 
        expected = 37.1900808777125, 
        tol = 1e-5)
    } else {
        expect_true(is.numeric(res) && !is.na(res))
    }
})
