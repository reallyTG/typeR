
context("GP model for predictions")

test_that("check predict.GP", {
    set.seed(4523452)
    nn <- nrow(mtcars)
    x1 <- scale_norm(seq_len(nn))
    y1 <- mtcars$mpg
    gp1 <- GP_fit(
        X = x1,
        Y = y1)
    gpp1 <- predict(gp1)
    expect_equal(
        object = gpp1$Y_hat, 
        expected = y1)
    expect_equal(
        object = gpp1$Y, 
        expected = y1)
    expect_equal(
        object = gpp1$MSE,
        expected = rep(0, times = 32))
    expect_equal(
        object = gpp1$complete_data,
        expected = cbind(
            xnew.1 = x1, 
            Y_hat = gpp1$Y_hat,
            MSE = gpp1$MSE))
    d2 <- scale_norm(mtcars$disp)
    m2 <- cbind(
        x1,
        mtcars$am, 
        d2)
    gp2 <- GP_fit(
        X = m2,
        Y = y1)
    gpp2 <- predict(gp2)
    yh2 <- c(
        20.4495822191238, 20.4493197202682, 25.490684337914, 17.9180349633098, 
        15.9655147790909, 18.4245208799839, 15.964971922338, 21.5122658833861, 
        21.9683394506574, 19.8817151561379, 19.8814389556646, 16.8555046543479, 
        16.8552300930023, 16.8549560308456, 10.7972563505173, 11.829979069531, 
        13.8136333450675, 30.2796733826399, 30.7394959554076, 31.4222140833735, 
        23.8250488638878, 15.4551635533571, 15.65510135144, 15.6336256042123, 
        16.5156528800726, 30.2310752794147, 23.7995721921325, 27.6872404590249, 
        15.6591707468033, 21.6349107176065, 15.7310634106398, 23.7180442214012
    )
    ms2 <- c(
        1.58000044657923, 2.33429623197564, 0.145689754151451, 0.338800211303227, 
        0, 1.67336892766858, 0, 0, 1.59146876477222, 0, 0, 0, 0.810056277111584, 
        0, 1.70773502732415, 0, 0, 3.05764921386227, 1.97598076343674, 
        1.54291511744041, 1.31474402172419, 0, 0, 0, 0, 0, 2.44797789105932, 
        0.385539558315119, 2.26234026141441, 0.0639366276699653, 0.409828313132026, 
        1.90776068803875)
    
    expect_equal(
        object = gpp2$Y_hat, 
        expected = yh2, 
        tol = 1e-5)
    expect_equal(
        object = gpp2$Y, 
        expected = gpp2$Y_hat)
    if (Sys.info()[['sysname']] != "Linux") {
        smse2 <- sum(gpp2$MSE)
        expect_true(
            object = smse2 >= 0 & smse2 < 30)
    }
    # input data
    expect_equal(
        object = gpp2$complete_data[, 1:3],
        expected = cbind(
            xnew.1 = x1, 
            xnew.2 = mtcars$am,
            xnew.3 = d2))
    # response
    expect_equal(
        object = gpp2$complete_data[, 4],
        expected = yh2, 
        tol = 1e-5)
    # mse mostly same; some differences on other platforms
    if (Sys.info()[['sysname']] != "Linux") {
        expect_true(object = sum(gpp2$complete_data[, 5] - ms2 < 1e-5) >= 10)
    }
    # new data
    gpp3 <- predict(gp2, xnew = cbind(nn + 1, 0, c(0.5, 0.9)))
    yh3 <- c(16.895212046802, 14.3097567856312)
    ms3 <- c(14.0864286965686, 11.8945074975033)
    expect_equal(
        object = gpp3$Y_hat, 
        expected = yh3, 
        tol = 1e-4)
    expect_equal(
        object = gpp3$Y, 
        expected = gpp3$Y_hat)
    if (Sys.info()[['sysname']] != "Linux") {
        mse3 <- gpp3$MSE
        # mse very sensitive to platform
        expect_true(
            object = all(mse3 > 9 & mse3 < 15))
    }
    expect_equal(
        object = gpp3$complete_data[, 1:3],
        expected = cbind(
            xnew.1 = nn + 1, 
            xnew.2 = 0,
            xnew.3 = c(0.5, 0.9)), 
        tol = 1e-6)
    expect_equal(
        object = gpp3$complete_data[, 4], 
        expected = yh3, tol = 1e-5)
    if (Sys.info()[['sysname']] != "Linux") {
        mse3 <- gpp3$complete_data[, 5]
        # mse very sensitive to platform
        expect_true(
            object = all(mse3 > 9 & mse3 < 15))
    }
})
