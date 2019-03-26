## ---- echo=FALSE---------------------------------------------------------
generate_data <- function(setting = "GLM", n = 1000, maf = 0.2, cens = 0.3,
                          a = NULL, b = NULL, aXK = 0.2, aXY = 0.1, aXL = 0,
                          aKY = 0.3, aLK = 0, aLY = 0, aUY = 0, aUL = 0,
                          mu_X = NULL, sd_X = NULL, X_orth_U = TRUE, mu_U = 0,
                          sd_U = 1, mu_K = 0, sd_K = 1, mu_L = 0, sd_L = 1,
                          mu_Y = 0, sd_Y = 1) {
    U_out <- rnorm(n, mean = mu_U, sd = sd_U)
    if (setting == "AFT" & (is.null(a) | is.null(b))) {
        stop("a and b have to be specified under the AFT setting.")
    }
    if (X_orth_U == TRUE) {
        X_out <- rbinom(n, size = 2, prob = maf)
    }
    if (X_orth_U == FALSE) {
        X_out <- pnorm(U_out, mean = mu_X, sd = sd_X)
        p <- 1 - maf
        for (j in 1:length(X_out)) {
            if (X_out[j] < p^2) {
                X_out[j] <- 0
                next
            }
            if (X_out[j] >= p^2 & X_out[j] < p^2 + 2 * p * (1 - p)) {
                X_out[j] <- 1
                next
            }
            if (X_out[j] >= p^2 + 2 * p * (1 - p)) {
                X_out[j] <- 2
                next
            }
        }
    }
    L_out <- aUL * U_out + aXL * X_out + rnorm(n, mean = mu_L, sd = sd_L)
    K_out <- aXK * X_out + aLK * L_out + rnorm(n, mean = mu_K, sd = sd_K)
    Y_out <- aUY * U_out + aKY * K_out + aXY * X_out + aLY * L_out +
             rnorm(n, mean = mu_Y, sd = sd_Y)
    data <- data.frame(Y = Y_out, K = K_out, X = X_out, L = L_out, U = U_out)
    if (setting == "AFT") {
        T_help <- exp(Y_out)
        ### Create censoring indicator and censored times no censoring
        if (cens == 0) {
            T_out <- T_help
            C_out <- rep(1, n)  # C_out==0 is censored, C_out==1 is uncensored
        }
        if (!cens == 0) {
            # there is censoring; cens is the percentage of censored data
            T_cens <- runif(n, min = a, max = b)  # a, b for desired censoring rate
            C_out <- as.numeric(T_help < T_cens)  # C==0 censored, C==1 uncensored
            T_out <- pmin(T_help, T_cens)
            Y_out <- log(T_out)
        }
        cens_out <- sum(abs(C_out - 1))/n
        data <- data.frame(Y = Y_out, K = K_out, X = X_out, L = L_out, U = U_out,
                           T = T_out, C = C_out)
        print(paste("The empirical censoring rate obtained through the specified parameters a=", a, " and b=", b, " is ", cens_out, ".", sep = ""))
        if (abs(cens_out - cens) > 0.1) {
            warning(paste("This obtained empirical censoring rate is quite different from the desired censoring rate cens=", cens, ". Please check and adapt values for a and b.",
                sep = ""))
        }
    }
    return(data)
}

## ---- echo=FALSE---------------------------------------------------------
mult_reg <- function(setting = "GLM", Y = NULL, X = NULL, K = NULL,
                     L = NULL, C = NULL) {
    if (!requireNamespace("survival", quietly = TRUE)) {
        stop("Pkg needed for this function to work. Please install it.", call. = FALSE)
    }
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables are not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    if (setting == "GLM") {
        fit_mult_reg <- lm(Y ~ K + X + L)
        point_estimates <- c(summary(fit_mult_reg)$coefficients[1, 1],
                             summary(fit_mult_reg)$coefficients[2, 1],
                             summary(fit_mult_reg)$coefficients[3, 1],
                             summary(fit_mult_reg)$coefficients[4, 1])
        SE_estimates <- c(summary(fit_mult_reg)$coefficients[1, 2],
                          summary(fit_mult_reg)$coefficients[2, 2],
                          summary(fit_mult_reg)$coefficients[3, 2],
                          summary(fit_mult_reg)$coefficients[4, 2])
        pvalues <- c(summary(fit_mult_reg)$coefficients[1, 4],
                     summary(fit_mult_reg)$coefficients[2, 4],
                     summary(fit_mult_reg)$coefficients[3, 4],
                     summary(fit_mult_reg)$coefficients[4, 4])
        names(point_estimates) <- names(SE_estimates) <- names(pvalues) <-
          c("alpha_0", "alpha_1", "alpha_XY", "alpha_2")
    }
    if (setting == "AFT") {
        fit_mult_reg <- survival::survreg(survival::Surv(Y, C) ~ K + X + L,
                                          dist = "gaussian")
        point_estimates <- c(summary(fit_mult_reg)$table[1, 1],
                             summary(fit_mult_reg)$table[2, 1],
                             summary(fit_mult_reg)$table[3, 1],
                             summary(fit_mult_reg)$table[4, 1])
        SE_estimates <- c(summary(fit_mult_reg)$table[1, 2],
                          summary(fit_mult_reg)$table[2, 2],
                          summary(fit_mult_reg)$table[3, 2],
                          summary(fit_mult_reg)$table[4, 2])
        pvalues <- c(summary(fit_mult_reg)$table[1, 4],
                     summary(fit_mult_reg)$table[2, 4],
                     summary(fit_mult_reg)$table[3, 4],
                     summary(fit_mult_reg)$table[4, 4])
        names(point_estimates) <- names(SE_estimates) <- names(pvalues) <-
          c("alpha_0", "alpha_1", "alpha_XY", "alpha_2")
    }
    return(list(point_estimates = point_estimates,
                SE_estimates = SE_estimates, pvalues = pvalues))
}

## ---- echo=FALSE---------------------------------------------------------
res_reg <- function(Y = NULL, X = NULL, K = NULL, L = NULL) {
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables is not supplied.")
    }
    data_help <- data.frame(Y = Y, X = X, K = K, L = L)
    data_help <- data_help[complete.cases(data_help), ]
    fit_res_reg_1 <- lm(data_help$Y ~ data_help$K + data_help$L)
    res <- fit_res_reg_1$residuals
    fit_res_reg_2 <- lm(res ~ data_help$X)

    point_estimates <- c(summary(fit_res_reg_1)$coefficients[1, 1],
                         summary(fit_res_reg_1)$coefficients[2, 1],
                         summary(fit_res_reg_1)$coefficients[3, 1],
                         summary(fit_res_reg_2)$coefficients[1, 1],
                         summary(fit_res_reg_2)$coefficients[2, 1])
    SE_estimates <- c(summary(fit_res_reg_1)$coefficients[1, 2],
                      summary(fit_res_reg_1)$coefficients[2, 2],
                      summary(fit_res_reg_1)$coefficients[3, 2],
                      summary(fit_res_reg_2)$coefficients[1, 2],
                      summary(fit_res_reg_2)$coefficients[2, 2])
    pvalues <- c(summary(fit_res_reg_1)$coefficients[1, 4],
                 summary(fit_res_reg_1)$coefficients[2, 4],
                 summary(fit_res_reg_1)$coefficients[3, 4],
                 summary(fit_res_reg_2)$coefficients[1, 4],
                 summary(fit_res_reg_2)$coefficients[2, 4])
    names(point_estimates) <- names(SE_estimates) <- names(pvalues) <-
      c("alpha_0", "alpha_1", "alpha_2", "alpha_3", "alpha_XY")
    return(list(point_estimates = point_estimates,
                SE_estimates = SE_estimates, pvalues = pvalues))
}

## ------------------------------------------------------------------------
dat <- generate_data(setting="GLM", n = 1000, maf = 0.2, cens = 0.3, a = NULL, b = NULL, 
                     aUL = 0, aXL = 0, aXK = 0.2, aLK = 0, aUY = 0, aKY = 0.3, aXY = 0.1,
                     aLY = 0, mu_U = 0, sd_U = 1, X_orth_U = TRUE, mu_X = NULL, 
                     sd_X = NULL, mu_L = 0, sd_L = 1, mu_K = 0, sd_K = 1, mu_Y = 0, 
                     sd_Y = 1)
head(dat)
mult_reg(setting = "GLM", Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)
res_reg(Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)

## ---- echo=FALSE---------------------------------------------------------
sem_appl <- function(setting = "GLM", Y = NULL, X = NULL, K = NULL, L = NULL) {
    if (!requireNamespace("lavaan", quietly = TRUE)) {
        stop("Pkg needed for this function to work. Please install it.", call. = FALSE)
    }
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (setting == "AFT") {
        stop("Only GLM setting is implemented.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables are not supplied.")
    }
    data_help <- data.frame(Y = Y, X = X, K = K, L = L)
    data_help <- data_help[complete.cases(data_help), ]
    model <- "
              L ~ X
              K ~ X + L
              Y ~ K + X
             "
    fit <- lavaan::sem(model, data = data_help)

    point_estimates <- c(fit@Fit@est[1], fit@Fit@est[2], fit@Fit@est[3],
                         fit@Fit@est[4], fit@Fit@est[5])
    SE_estimates <- c(fit@Fit@se[1], fit@Fit@se[2], fit@Fit@se[3],
                      fit@Fit@se[4], fit@Fit@se[5])
    pvalues <- 2 * pnorm(-abs(point_estimates/SE_estimates))
    names(point_estimates) <- names(SE_estimates) <- names(pvalues) <-
      c("alpha_1", "alpha_3", "alpha_4", "alpha_6", "alpha_XY")
    return(list(point_estimates = point_estimates,
                SE_estimates = SE_estimates, pvalues = pvalues))
}

## ------------------------------------------------------------------------
sem_appl(Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)

## ---- echo=FALSE---------------------------------------------------------
est_funct_expr <- function(setting = "GLM") {
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (setting == "GLM") {
        logL1 <- expression(log((1/sqrt(sigma1sq)) * dnorm((y_i - alpha0 -
                            alpha1 * k_i - alpha2 * x_i - alpha3 * l_i)/
                            sqrt(sigma1sq), mean = 0, sd = 1)))
        logL2 <- expression(log((1/sqrt(sigma2sq)) * dnorm((y_i - y_bar -
                            alpha1 * (k_i - k_bar) - alpha4 - alphaXY * x_i)/
                            sqrt(sigma2sq), mean = 0, sd = 1)))
    }
    if (setting == "AFT") {
        logL1 <- expression(-c_i * log(sigma1) + c_i * log(dnorm((y_i -
                            alpha0 - alpha1 * k_i - alpha2 * x_i -
                            alpha3 * l_i)/sigma1, mean = 0, sd = 1)) +
                            (1 - c_i) * log(1 - pnorm((y_i - alpha0 -
                            alpha1 * k_i - alpha2 * x_i - alpha3 * l_i)/
                            sigma1, mean = 0, sd = 1)))
        logL2 <- expression(log((1/sqrt(sigma2sq)) * dnorm(((c_i * y_i +
                            (1 - c_i) * ((alpha0 + alpha1 * k_i +
                            alpha2 * x_i + alpha3 * l_i) + (sigma1 *
                            dnorm((y_i - alpha0 - alpha1 * k_i -
                            alpha2 * x_i - alpha3 * l_i)/sigma1, mean = 0,
                            sd = 1)/(1 - pnorm((y_i - alpha0 - alpha1 * k_i -
                            alpha2 * x_i - alpha3 * l_i)/sigma1, mean = 0,
                            sd = 1))))) - y_adj_bar - alpha1 * (k_i - k_bar) -
                            alpha4 - alphaXY * x_i)/sqrt(sigma2sq),
                            mean = 0, sd = 1)))
    }
    return(list(logL1 = logL1, logL2 = logL2))
}

## ------------------------------------------------------------------------
estfunct <- est_funct_expr(setting="GLM")
estfunct
est_funct_expr(setting = "AFT")

## ---- echo=FALSE---------------------------------------------------------
get_estimates <- function(setting = "GLM", Y = NULL, X = NULL, K = NULL,
                          L = NULL, C = NULL) {
    if (!requireNamespace("survival", quietly = TRUE)) {
        stop("Pkg needed for this function to work. Please install it.", call. = FALSE)
    }
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables are not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    n <- length(Y)

    if (setting == "GLM") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L)
        data_help <- data_help[complete.cases(data_help), ]
        ######### Stage 1 #########
        fit_stage_1 <- lm(data_help$Y ~ data_help$K + data_help$X + data_help$L)

        alpha_0_out <- summary(fit_stage_1)$coefficients[1, 1]
        alpha_1_out <- summary(fit_stage_1)$coefficients[2, 1]
        alpha_2_out <- summary(fit_stage_1)$coefficients[3, 1]
        alpha_3_out <- summary(fit_stage_1)$coefficients[4, 1]
        sigma_1_sq_out <- (n - 4)/n * summary(fit_stage_1)$sigma^2

        ######### Stage 2 #########
        Y_tilde <- data_help$Y - mean(data_help$Y) -
                   alpha_1_out * (data_help$K - mean(data_help$K))
        fit_stage_2 <- lm(Y_tilde ~ data_help$X)

        alpha_4_out <- summary(fit_stage_2)$coefficients[1, 1]
        alpha_XY_out <- summary(fit_stage_2)$coefficients[2, 1]
        sigma_2_sq_out <- (n - 2)/n * summary(fit_stage_2)$sigma^2

        point_estimates <- c(alpha_0_out, alpha_1_out, alpha_2_out, alpha_3_out,
                             sigma_1_sq_out, alpha_4_out, alpha_XY_out, sigma_2_sq_out)
        names(point_estimates) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3",
                                    "sigma_1_sq", "alpha_4", "alpha_XY", "sigma_2_sq")
    }
    if (setting == "AFT") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L, C = C)
        data_help <- data_help[complete.cases(data_help), ]
        ######### Stage 1 #########
        fit_stage_1 <- survival::survreg(survival::Surv(data_help$Y, data_help$C) ~
                                         data_help$K + data_help$X + data_help$L,
                                         dist = "gaussian")

        alpha_0_out <- summary(fit_stage_1)$table[1, 1]
        alpha_1_out <- summary(fit_stage_1)$table[2, 1]
        alpha_2_out <- summary(fit_stage_1)$table[3, 1]
        alpha_3_out <- summary(fit_stage_1)$table[4, 1]
        sigma_1_out <- fit_stage_1$scale

        ######### Stage 2 #########
        mu <- fit_stage_1$linear.predictors
        Y_adj <- data_help$C * data_help$Y + (1 - data_help$C) * (mu +
                 (sigma_1_out * dnorm((data_help$Y - mu)/sigma_1_out,
                 mean = 0, sd = 1)/(1 - pnorm((data_help$Y - mu)/sigma_1_out,
                 mean = 0, sd = 1))))
        Y_tilde <- Y_adj - mean(Y_adj) -
                   alpha_1_out * (data_help$K - mean(data_help$K))
        fit_stage_2 <- lm(Y_tilde ~ data_help$X)

        alpha_4_out <- summary(fit_stage_2)$coefficients[1, 1]
        alpha_XY_out <- summary(fit_stage_2)$coefficients[2, 1]
        sigma_2_sq_out <- (n - 2)/n * summary(fit_stage_2)$sigma^2

        point_estimates <- c(alpha_0_out, alpha_1_out, alpha_2_out, alpha_3_out,
                             sigma_1_out, alpha_4_out, alpha_XY_out, sigma_2_sq_out,
                             mean(Y_adj))
        names(point_estimates) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3",
                                    "sigma_1", "alpha_4", "alpha_XY", "sigma_2_sq",
                                    "y_adj_bar")
    }
    return(point_estimates)
}

## ------------------------------------------------------------------------
estimates <- get_estimates(setting = "GLM", Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)
estimates

## ---- echo=FALSE---------------------------------------------------------
deriv_obj <- function(setting = "GLM", logL1 = NULL, logL2 = NULL, Y = NULL,
                      X = NULL, K = NULL, L = NULL, C = NULL,
                      estimates = NULL) {
    if (is.null(setting) | is.null(logL1) | is.null(logL2) |
        is.null(estimates)) {
        stop("One or more arguments of the function are missing.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables are not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    n <- length(Y)
    if (setting == "GLM") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L)
        data_help <- data_help[complete.cases(data_help), ]
        U12345_i <- deriv(expr = logL1, namevec = c("alpha0", "alpha1", "alpha2",
                          "alpha3", "sigma1sq", "alpha4", "alphaXY", "sigma2sq"),
                          function.arg = c("y_i", "k_i", "x_i", "l_i", "alpha0",
                          "alpha1", "alpha2", "alpha3", "sigma1sq"), func = T,
                          hessian = T)
        U678_i <- deriv(expr = logL2, namevec = c("alpha0", "alpha1", "alpha2",
                        "alpha3", "sigma1sq", "alpha4", "alphaXY", "sigma2sq"),
                        function.arg = c("y_i", "k_i", "x_i", "y_bar", "k_bar",
                        "alpha1", "alpha4", "alphaXY", "sigma2sq"), func = T,
                        hessian = T)
        logL1_deriv <- attributes(U12345_i(y_i = data_help$Y, k_i = data_help$K,
                                  x_i = data_help$X, l_i = data_help$L,
                                  alpha0 = estimates[names(estimates) == "alpha_0"],
                                  alpha1 = estimates[names(estimates) == "alpha_1"],
                                  alpha2 = estimates[names(estimates) == "alpha_2"],
                                  alpha3 = estimates[names(estimates) == "alpha_3"],
                                  sigma1sq = estimates[names(estimates) == "sigma_1_sq"]))
        logL2_deriv <- attributes(U678_i(y_i = data_help$Y, k_i = data_help$K,
                                  x_i = data_help$X, y_bar = mean(data_help$Y),
                                  k_bar = mean(data_help$K),
                                  alpha1 = estimates[names(estimates) == "alpha_1"],
                                  alpha4 = estimates[names(estimates) == "alpha_4"],
                                  alphaXY = estimates[names(estimates) == "alpha_XY"],
                                  sigma2sq = estimates[names(estimates) == "sigma_2_sq"]))
        deriv_obj <- list(logL1_deriv = logL1_deriv, logL2_deriv = logL2_deriv)
    }
    if (setting == "AFT") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L, C = C)
        data_help <- data_help[complete.cases(data_help), ]
        U12345_i <- deriv(expr = logL1, namevec = c("alpha0", "alpha1", "alpha2",
                          "alpha3", "sigma1", "alpha4", "alphaXY", "sigma2sq"),
                          function.arg = c("y_i", "c_i", "k_i", "x_i", "l_i",
                          "alpha0", "alpha1", "alpha2", "alpha3", "sigma1"),
                          func = T, hessian = T)
        U678_i <- deriv(expr = logL2, namevec = c("alpha0", "alpha1", "alpha2",
                        "alpha3", "sigma1", "alpha4", "alphaXY", "sigma2sq"),
                        function.arg = c("y_i", "c_i", "k_i", "x_i", "l_i",
                        "y_adj_bar", "k_bar", "alpha0", "alpha1", "alpha2",
                        "alpha3", "sigma1", "alpha4", "alphaXY", "sigma2sq"),
                        func = T, hessian = T)
        logL1_deriv <- attributes(U12345_i(y_i = data_help$Y, c_i = data_help$C,
                                  k_i = data_help$K, x_i = data_help$X, l_i = data_help$L,
                                  alpha0 = estimates[names(estimates) == "alpha_0"],
                                  alpha1 = estimates[names(estimates) == "alpha_1"],
                                  alpha2 = estimates[names(estimates) == "alpha_2"],
                                  alpha3 = estimates[names(estimates) == "alpha_3"],
                                  sigma1 = estimates[names(estimates) == "sigma_1"]))
        logL2_deriv <- attributes(U678_i(y_i = data_help$Y, c_i = data_help$C,
                                  k_i = data_help$K, x_i = data_help$X, l_i = data_help$L,
                                  y_adj_bar = estimates[names(estimates) == "y_adj_bar"],
                                  k_bar = mean(data_help$K),
                                  alpha0 = estimates[names(estimates) == "alpha_0"],
                                  alpha1 = estimates[names(estimates) == "alpha_1"],
                                  alpha2 = estimates[names(estimates) == "alpha_2"],
                                  alpha3 = estimates[names(estimates) == "alpha_3"],
                                  sigma1 = estimates[names(estimates) == "sigma_1"],
                                  alpha4 = estimates[names(estimates) == "alpha_4"],
                                  alphaXY = estimates[names(estimates) == "alpha_XY"],
                                  sigma2sq = estimates[names(estimates) == "sigma_2_sq"]))
        deriv_obj <- list(logL1_deriv = logL1_deriv, logL2_deriv = logL2_deriv)
    }
    return(deriv_obj)
}

## ---- echo=FALSE---------------------------------------------------------
scores <- function(derivobj = NULL) {
    if (is.null(derivobj)) {
        stop("derivobj has to be supplied.")
    }
    scores_out <- cbind(derivobj[[1]]$gradient[, 1:5],
                        derivobj[[2]]$gradient[, 6:8])
    return(scores_out)
}

## ---- echo=FALSE---------------------------------------------------------
hessian <- function(derivobj = NULL) {
    if (is.null(derivobj)) {
        stop("derivobj has to be supplied.")
    }
    hessian_out <- derivobj[[1]]$hessian
    hessian_out[, 6:8, ] <- derivobj[[2]]$hessian[, 6:8, ]
    return(hessian_out)
}

## ------------------------------------------------------------------------
derivobj <- deriv_obj(setting = "GLM", logL1 = estfunct$logL1, logL2 = estfunct$logL2, 
                      Y = dat$Y, X = dat$X, K = dat$K, L = dat$L, estimates = estimates)
names(derivobj)
head(derivobj$logL1_deriv$gradient)
score_matrix <- scores(derivobj)
head(score_matrix)
hessian_matrix <- hessian(derivobj)
str(hessian_matrix)

## ---- echo=FALSE---------------------------------------------------------
sandwich_se <- function(setting = "GLM", scores = NULL, hessian = NULL) {
    if (is.null(scores) | is.null(hessian)) {
        stop("scores and hessian have to be supplied.")
    }
    n <- dim(scores)[1]

    ### A_n matrix ###
    A_n <- matrix(, nrow = 8, ncol = 8)
    for (A_n_i in 1:8) {
        for (A_n_j in 1:8) {
            A_n[A_n_i, A_n_j] <- sum(hessian[, A_n_i, A_n_j])
        }
    }
    A_n <- -(1/n) * A_n

    ### B_n matrix ###
    B_n <- matrix(, nrow = 8, ncol = 8)
    for (B_n_i in 1:8) {
        for (B_n_j in 1:8) {
            B_n[B_n_i, B_n_j] <- sum(scores[, B_n_i] * scores[, B_n_j])
        }
    }
    B_n <- (1/n) * B_n

    ### C_n matrix ###
    C_n <- solve(A_n) %*% B_n %*% t(solve(A_n))

    ### Variance estimates of coefficients ###
    theta_EE_se <- (1/n) * diag(C_n)
    theta_EE_se <- sqrt(theta_EE_se)
    if (setting == "GLM") {
        names(theta_EE_se) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3",
                                "sigma_1_sq", "alpha_4", "alpha_XY", "sigma_2_sq")
    }
    if (setting == "AFT") {
        names(theta_EE_se) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3",
                                "sigma_1", "alpha_4", "alpha_XY", "sigma_2_sq")
    }
    return(theta_EE_se)
}

## ------------------------------------------------------------------------
sandwich_se(scores = score_matrix, hessian = hessian_matrix)

## ---- echo=FALSE---------------------------------------------------------
bootstrap_se <- function(setting = "GLM", BS_rep = 1000, Y = NULL, X = NULL,
                         K = NULL, L = NULL, C = NULL) {
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables are not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    n <- length(Y)

    if (setting == "GLM") {
        alpha_0_SE_BS_help <- alpha_1_SE_BS_help <-
          alpha_2_SE_BS_help <- alpha_3_SE_BS_help <-
          sigma_1_sq_SE_BS_help <- alpha_4_SE_BS_help <-
          alpha_XY_SE_BS_help <- sigma_2_sq_SE_BS_help <- NULL
    }
    if (setting == "AFT") {
        alpha_0_SE_BS_help <- alpha_1_SE_BS_help <-
          alpha_2_SE_BS_help <- alpha_3_SE_BS_help <-
          sigma_1_SE_BS_help <- alpha_4_SE_BS_help <-
          alpha_XY_SE_BS_help <- sigma_2_sq_SE_BS_help <- NULL
    }
    for (rep in 1:BS_rep) {
        id <- sample(1:n, n, replace = TRUE)
        if (setting == "GLM") {
            data_id <- data.frame(X = X[id], L = L[id], K = K[id], Y = Y[id])
            estimates <- get_estimates(setting = setting, Y = data_id$Y, X = data_id$X,
                                       K = data_id$K, L = data_id$L)
        }
        if (setting == "AFT") {
            data_id <- data.frame(X = X[id], L = L[id], K = K[id], Y = Y[id],
                                  T = T[id], C = C[id])
            estimates <- get_estimates(setting = setting, Y = data_id$Y, X = data_id$X,
                                       K = data_id$K, L = data_id$L, C = data_id$C)
        }
        alpha_0_SE_BS_help[rep] <- estimates[names(estimates) == "alpha_0"]
        alpha_1_SE_BS_help[rep] <- estimates[names(estimates) == "alpha_1"]
        alpha_2_SE_BS_help[rep] <- estimates[names(estimates) == "alpha_2"]
        alpha_3_SE_BS_help[rep] <- estimates[names(estimates) == "alpha_3"]
        if (setting == "GLM") {
            sigma_1_sq_SE_BS_help[rep] <- estimates[names(estimates) == "sigma_1_sq"]
        }
        if (setting == "AFT") {
            sigma_1_SE_BS_help[rep] <- estimates[names(estimates) == "sigma_1"]
        }
        alpha_4_SE_BS_help[rep] <- estimates[names(estimates) == "alpha_4"]
        alpha_XY_SE_BS_help[rep] <- estimates[names(estimates) == "alpha_XY"]
        sigma_2_sq_SE_BS_help[rep] <- estimates[names(estimates) == "sigma_2_sq"]
    }
    if (setting == "GLM") {
        theta_bootstrap_se <- c(sd(alpha_0_SE_BS_help,na.rm=T),
                                sd(alpha_1_SE_BS_help,na.rm=T),
                                sd(alpha_2_SE_BS_help,na.rm=T),
                                sd(alpha_3_SE_BS_help,na.rm=T),
                                sd(sigma_1_sq_SE_BS_help,na.rm=T),
                                sd(alpha_4_SE_BS_help,na.rm=T),
                                sd(alpha_XY_SE_BS_help,na.rm=T),
                                sd(sigma_2_sq_SE_BS_help,na.rm=T))
        names(theta_bootstrap_se) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3",
                                       "sigma_1_sq", "alpha_4", "alpha_XY", "sigma_2_sq")
    }
    if (setting == "AFT") {
        theta_bootstrap_se <- c(sd(alpha_0_SE_BS_help,na.rm=T),
                                sd(alpha_1_SE_BS_help,na.rm=T),
                                sd(alpha_2_SE_BS_help,na.rm=T),
                                sd(alpha_3_SE_BS_help,na.rm=T),
                                sd(sigma_1_SE_BS_help,na.rm=T),
                                sd(alpha_4_SE_BS_help,na.rm=T),
                                sd(alpha_XY_SE_BS_help,na.rm=T),
                                sd(sigma_2_sq_SE_BS_help,na.rm=T))
        names(theta_bootstrap_se) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3",
                                       "sigma_1", "alpha_4", "alpha_XY", "sigma_2_sq")
    }
    return(theta_bootstrap_se)
}

## ---- echo=FALSE---------------------------------------------------------
naive_se <- function(setting = "GLM", Y = NULL, X = NULL,
                     K = NULL, L = NULL, C = NULL) {
    if (!requireNamespace("survival", quietly = TRUE)) {
        stop("Pkg needed for this function to work. Please install it.", call. = FALSE)
    }
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables are not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    n <- length(Y)

    if (setting == "GLM") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L)
        data_help <- data_help[complete.cases(data_help), ]
        ######### Stage 1 #########
        fit_stage_1 <- lm(data_help$Y ~ data_help$K + data_help$X + data_help$L)

        alpha_1_out <- summary(fit_stage_1)$coefficients[2, 1]
        alpha_0_SE_out <- summary(fit_stage_1)$coefficients[1, 2]
        alpha_1_SE_out <- summary(fit_stage_1)$coefficients[2, 2]
        alpha_2_SE_out <- summary(fit_stage_1)$coefficients[3, 2]
        alpha_3_SE_out <- summary(fit_stage_1)$coefficients[4, 2]

        ######### Stage 2 #########
        Y_tilde <- data_help$Y - mean(data_help$Y) -
                   alpha_1_out * (data_help$K - mean(data_help$K))
        fit_stage_2 <- lm(Y_tilde ~ data_help$X)

        alpha_4_SE_out <- summary(fit_stage_2)$coefficients[1, 2]
        alpha_XY_SE_out <- summary(fit_stage_2)$coefficients[2, 2]
    }
    if (setting == "AFT") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L, C = C)
        data_help <- data_help[complete.cases(data_help), ]
        ######### Stage 1 #########
        fit_stage_1 <- survival::survreg(survival::Surv(data_help$Y, data_help$C) ~
                                         data_help$K + data_help$X + data_help$L,
                                         dist = "gaussian")

        alpha_1_out <- summary(fit_stage_1)$table[2, 1]
        sigma_1_out <- fit_stage_1$scale
        alpha_0_SE_out <- summary(fit_stage_1)$table[1, 2]
        alpha_1_SE_out <- summary(fit_stage_1)$table[2, 2]
        alpha_2_SE_out <- summary(fit_stage_1)$table[3, 2]
        alpha_3_SE_out <- summary(fit_stage_1)$table[4, 2]

        ######### Stage 2 #########
        mu <- fit_stage_1$linear.predictors
        Y_adj <- data_help$C * data_help$Y + (1 - data_help$C) * (mu + (sigma_1_out *
                 dnorm((data_help$Y - mu)/sigma_1_out, mean = 0, sd = 1)/
                (1 - pnorm((data_help$Y - mu)/sigma_1_out, mean = 0, sd = 1))))
        Y_tilde <- Y_adj - mean(Y_adj) - alpha_1_out * (data_help$K - mean(data_help$K))
        fit_stage_2 <- lm(Y_tilde ~ data_help$X)

        alpha_4_SE_out <- summary(fit_stage_2)$coefficients[1, 2]
        alpha_XY_SE_out <- summary(fit_stage_2)$coefficients[2, 2]
    }
    SE_estimates <- c(alpha_0_SE_out, alpha_1_SE_out, alpha_2_SE_out, alpha_3_SE_out,
                      NA, alpha_4_SE_out, alpha_XY_SE_out, NA)
    names(SE_estimates) <- c("alpha_0", "alpha_1", "alpha_2", "alpha_3", "sigma_1_sq",
                             "alpha_4", "alpha_XY", "sigma_2_sq")
    return(SE_estimates)
}

## ------------------------------------------------------------------------
bootstrap_se(setting = "GLM", BS_rep = 1000, Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)
naive_se(setting = "GLM", Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)

## ---- echo=FALSE---------------------------------------------------------
ciee <- function(setting = "GLM", estimates = c("ee", "mult_reg", "res_reg", "sem"),
                 ee_se = c("sandwich"), BS_rep = NULL, Y = NULL, X = NULL, K = NULL,
                 L = NULL, C = NULL) {
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (is.null(estimates)) {
        stop("At least one method has to be computed.")
    }
    if ((("ee" %in% estimates) & is.null(ee_se)) | (("ee" %in% estimates) &
          length(ee_se) > 1)) {
        stop("If the estimating equations approach is chosen, one approach has to be chosen for the computation of standard errors.")
    }
    if (("bootstrap" %in% estimates) & is.null(BS_rep)) {
        stop("For the computation of bootstrap standard errors, the number of bootstrap samples has to be chosen.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables is not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    if (setting == "AFT" & ("sem" %in% estimates)) {
        stop("The structural equations modeling approach is only implemented for the GLM setting.")
    }
    if (setting == "AFT" & ("res_reg" %in% estimates)) {
        stop("The regression of residuals approach is only implemented for the GLM setting.")
    }
    if (setting == "GLM") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L)
        data_help <- data_help[complete.cases(data_help), ]
        if ("sem" %in% estimates) {
            results_sem <- sem_appl(Y = data_help$Y, X = data_help$X,
                                    K = data_help$K, L = data_help$L)
        }
        if ("mult_reg" %in% estimates) {
            results_mult_reg <- mult_reg(setting = setting, Y = data_help$Y,
                                         X = data_help$X, K = data_help$K,
                                         L = data_help$L)
        }
        if ("res_reg" %in% estimates) {
            results_res_reg <- res_reg(Y = data_help$Y, X = data_help$X,
                                       K = data_help$K, L = data_help$L)
        }
        if ("ee" %in% estimates) {
            point_estimates_ee <- get_estimates(setting = setting, Y = data_help$Y,
                                                X = data_help$X, K = data_help$K,
                                                L = data_help$L)
            if (ee_se == "sandwich") {
                # Obtain estimating functions expressions
                estfunct <- est_funct_expr(setting = "GLM")
                # Obtain matrices with all first and second derivatives
                derivobj <- deriv_obj(setting = setting, logL1 = estfunct$logL1,
                                      logL2 = estfunct$logL2, Y = data_help$Y,
                                      X = data_help$X, K = data_help$K,
                                      L = data_help$L,
                                      estimates = point_estimates_ee)
                # Obtain score and hessian matrices
                results_scores <- scores(derivobj)
                results_hessian <- hessian(derivobj)
                # Obtain sandwich standard error estimates of the parameters
                se_estimates_ee <- sandwich_se(setting = setting,
                                               scores = results_scores,
                                               hessian = results_hessian)
            }
            if (ee_se == "bootstrap") {
                se_estimates_ee <- bootstrap_se(setting = setting, BS_rep = BS_rep,
                                                Y = data_help$Y, X = data_help$X,
                                                K = data_help$K, L = data_help$L)
            }
            if (ee_se == "naive") {
                se_estimates_ee <- naive_se(setting = setting, Y = data_help$Y,
                                            X = data_help$X, K = data_help$K,
                                            L = data_help$L)
            }
            wald_test_stat_ee <- point_estimates_ee[1:8]/se_estimates_ee
            pvalues_ee <- 2 * pnorm(-abs(wald_test_stat_ee))
            results_ee <- list(point_estimates = point_estimates_ee[1:8],
                               SE_estimates = se_estimates_ee,
                               wald_test_stat = wald_test_stat_ee,
                               pvalues = pvalues_ee)
        }
    }
    if (setting == "AFT") {
        data_help <- data.frame(Y = Y, X = X, K = K, L = L, C = C)
        data_help <- data_help[complete.cases(data_help), ]
        if ("mult_reg" %in% estimates) {
            results_mult_reg <- mult_reg(setting = setting, Y = data_help$Y,
                                         X = data_help$X, K = data_help$K,
                                         L = data_help$L, C = data_help$C)
        }
        if ("ee" %in% estimates) {
            point_estimates_ee <- get_estimates(setting = setting, Y = data_help$Y,
                                                X = data_help$X, K = data_help$K,
                                                L = data_help$L, C = data_help$C)
            if (ee_se == "sandwich") {
                # Obtain estimating functions expressions
                estfunct <- est_funct_expr(setting = setting)
                # Obtain matrices with all first and second derivatives
                derivobj <- deriv_obj(setting = setting, logL1 = estfunct$logL1,
                                      logL2 = estfunct$logL2, Y = data_help$Y,
                                      X = data_help$X, K = data_help$K,
                                      L = data_help$L, C = data_help$C,
                                      estimates = point_estimates_ee)
                # Obtain score and hessian matrices
                results_scores <- scores(derivobj)
                results_hessian <- hessian(derivobj)
                # Obtain sandwich standard error estimates of the parameters
                se_estimates_ee <- sandwich_se(setting = setting,
                                               scores = results_scores,
                                               hessian = results_hessian)
            }
            if (ee_se == "bootstrap") {
                se_estimates_ee <- bootstrap_se(setting = setting, BS_rep = BS_rep,
                                                Y = data_help$Y, X = data_help$X,
                                                K = data_help$K, L = data_help$L,
                                                C = data_help$C)
            }
            if (ee_se == "naive") {
                se_estimates_ee <- naive_se(setting = setting, Y = data_help$Y,
                                            X = data_help$X, K = data_help$K,
                                            L = data_help$L, C = data_help$C)
            }
            wald_test_stat_ee <- point_estimates_ee[1:8]/se_estimates_ee
            pvalues_ee <- 2 * pnorm(-abs(wald_test_stat_ee))
            results_ee <- list(point_estimates = point_estimates_ee[1:8],
                               SE_estimates = se_estimates_ee,
                               wald_test_stat = wald_test_stat_ee,
                               pvalues = pvalues_ee)
        }
    }
    output <- list()
    if ("ee" %in% estimates) {
        output$results_ee <- results_ee
    }
    if ("mult_reg" %in% estimates) {
        output$results_mult_reg <- results_mult_reg
    }
    if ("res_reg" %in% estimates) {
        output$results_res_reg <- results_res_reg
    }
    if ("sem" %in% estimates) {
        output$results_sem <- results_sem
    }
    class(output) <- "ciee"
    return(output)
}

## ---- echo=FALSE---------------------------------------------------------
ciee_loop <- function(setting = "GLM", estimates = c("ee", "mult_reg", "res_reg",
                      "sem"), ee_se = c("sandwich"), BS_rep = NULL, Y = NULL,
                      X = NULL, K = NULL, L = NULL, C = NULL) {
    if (is.null(setting)) {
        stop("setting has to be supplied.")
    }
    if (is.null(estimates)) {
        stop("At least one method has to be computed.")
    }
    if ((("ee" %in% estimates) & is.null(ee_se)) | (("ee" %in% estimates)
         & length(ee_se) > 1)) {
        stop("If the estimating equations approach is chosen, one approach has to be chosen for the computation of standard errors.")
    }
    if (("bootstrap" %in% estimates) & is.null(BS_rep)) {
        stop("For the computation of bootstrap standard errors, the number of bootstrap samples has to be chosen.")
    }
    if (is.null(Y) | is.null(X) | is.null(K) | is.null(L)) {
        stop("Data of one or more variables is not supplied.")
    }
    if (setting == "AFT" & is.null(C)) {
        stop("C has to be supplied for the AFT setting.")
    }
    if (setting == "AFT" & ("sem" %in% estimates)) {
        stop("The structural equations modeling approach is only implemented for the GLM setting.")
    }
    if (setting == "AFT" & ("res_reg" %in% estimates)) {
        stop("The regression of residuals approach is only implemented for the GLM setting.")
    }
    if ("sem" %in% estimates) {
        results_sem <- list(point_estimates = NULL, SE_estimates = NULL,
                            pvalues = NULL)
    }
    if ("mult_reg" %in% estimates) {
        results_mult_reg <- list(point_estimates = NULL, SE_estimates = NULL,
                                 pvalues = NULL)
    }
    if ("res_reg" %in% estimates) {
        results_res_reg <- list(point_estimates = NULL, SE_estimates = NULL,
                            pvalues = NULL)
    }
    if ("ee" %in% estimates) {
        results_ee <- list(point_estimates = NULL, SE_estimates = NULL,
                           wald_test_stat = NULL, pvalues = NULL)
    }
    k <- dim(X)[2]
    for (i in 1:k) {
        Xi <- X[, i]
        if (setting == "GLM") {
            data_help <- data.frame(Y = Y, X = Xi, K = K, L = L)
            data_help <- data_help[complete.cases(data_help), ]

            if ("sem" %in% estimates) {
                sem_help <- sem_appl(Y = data_help$Y, X = data_help$X,
                                     K = data_help$K, L = data_help$L)
                results_sem$point_estimates[i] <- sem_help$point_estimates[5]
                results_sem$SE_estimates[i] <- sem_help$SE_estimates[5]
                results_sem$pvalues[i] <- sem_help$pvalues[5]
                names(results_sem$point_estimates)[i] <-
                  names(results_sem$SE_estimates)[i] <-
                  names(results_sem$pvalues)[i] <- names(X)[i]
            }
            if ("mult_reg" %in% estimates) {
                mult_reg_help <- mult_reg(setting = setting, Y = data_help$Y,
                                          X = data_help$X, K = data_help$K,
                                          L = data_help$L)
                results_mult_reg$point_estimates[i] <- mult_reg_help$point_estimates[3]
                results_mult_reg$SE_estimates[i] <- mult_reg_help$SE_estimates[3]
                results_mult_reg$pvalues[i] <- mult_reg_help$pvalues[3]
                names(results_mult_reg$point_estimates)[i] <-
                  names(results_mult_reg$SE_estimates)[i] <-
                  names(results_mult_reg$pvalues)[i] <- names(X)[i]
            }
            if ("res_reg" %in% estimates) {
                res_reg_help <- res_reg(Y = data_help$Y, X = data_help$X,
                                        K = data_help$K, L = data_help$L)
                results_res_reg$point_estimates[i] <- res_reg_help$point_estimates[5]
                results_res_reg$SE_estimates[i] <- res_reg_help$SE_estimates[5]
                results_res_reg$pvalues[i] <- res_reg_help$pvalues[5]
                names(results_res_reg$point_estimates)[i] <-
                  names(results_res_reg$SE_estimates)[i] <-
                  names(results_res_reg$pvalues)[i] <- names(X)[i]
            }
            if ("ee" %in% estimates) {
                point_estimates_ee <- get_estimates(setting = setting,
                                                    Y = data_help$Y,
                                                    X = data_help$X,
                                                    K = data_help$K,
                                                    L = data_help$L)
                if (ee_se == "sandwich") {
                    # Obtain estimating functions expressions
                    estfunct <- est_funct_expr(setting = "GLM")
                    # Obtain matrices with all first and second derivatives
                    derivobj <- deriv_obj(setting = setting,
                                          logL1 = estfunct$logL1,
                                          logL2 = estfunct$logL2,
                                          Y = data_help$Y,
                                          X = data_help$X,
                                          K = data_help$K,
                                          L = data_help$L,
                                          estimates = point_estimates_ee)
                    # Obtain score and hessian matrices
                    results_scores <- scores(derivobj)
                    results_hessian <- hessian(derivobj)
                    # Obtain sandwich standard error estimates of the parameters
                    se_estimates_ee <- sandwich_se(setting = setting,
                                                   scores = results_scores,
                                                   hessian = results_hessian)
                }
                if (ee_se == "bootstrap") {
                    se_estimates_ee <- bootstrap_se(setting = setting,
                                                    BS_rep = BS_rep,
                                                    Y = data_help$Y,
                                                    X = data_help$X,
                                                    K = data_help$K,
                                                    L = data_help$L)
                }
                if (ee_se == "naive") {
                    se_estimates_ee <- naive_se(setting = setting,
                                                Y = data_help$Y,
                                                X = data_help$X,
                                                K = data_help$K,
                                                L = data_help$L)
                }
                results_ee$point_estimates[i] <- point_estimates_ee[7]
                results_ee$SE_estimates[i] <- se_estimates_ee[7]
                results_ee$wald_test_stat[i] <- point_estimates_ee[7]/
                                                  se_estimates_ee[7]
                results_ee$pvalues[i] <- 2 * pnorm(-abs(point_estimates_ee[7]/
                                                        se_estimates_ee[7]))
                names(results_ee$point_estimates)[i] <-
                  names(results_ee$SE_estimates)[i] <-
                  names(results_ee$wald_test_stat)[i] <-
                  names(results_ee$pvalues)[i] <- names(X)[i]
            }
        }
        if (setting == "AFT") {
            data_help <- data.frame(Y = Y, X = Xi, K = K, L = L, C = C)
            data_help <- data_help[complete.cases(data_help), ]
            if ("mult_reg" %in% estimates) {
                mult_reg_help <- mult_reg(setting = setting, Y = data_help$Y,
                                          X = data_help$X, K = data_help$K,
                                          L = data_help$L, C = data_help$C)
                results_mult_reg$point_estimates[i] <- mult_reg_help$point_estimates[3]
                results_mult_reg$SE_estimates[i] <- mult_reg_help$SE_estimates[3]
                results_mult_reg$pvalues[i] <- mult_reg_help$pvalues[3]
                names(results_mult_reg$point_estimates)[i] <-
                  names(results_mult_reg$SE_estimates)[i] <-
                  names(results_mult_reg$pvalues)[i] <- names(X)[i]
            }
            if ("ee" %in% estimates) {
                point_estimates_ee <- get_estimates(setting = setting,
                                                    Y = data_help$Y,
                                                    X = data_help$X,
                                                    K = data_help$K,
                                                    L = data_help$L,
                                                    C = data_help$C)
                if (ee_se == "sandwich") {
                    # Obtain estimating functions expressions
                    estfunct <- est_funct_expr(setting = setting)
                    # Obtain matrices with all first and second derivatives
                    derivobj <- deriv_obj(setting = setting,
                                          logL1 = estfunct$logL1,
                                          logL2 = estfunct$logL2,
                                          Y = data_help$Y,
                                          X = data_help$X,
                                          K = data_help$K,
                                          L = data_help$L,
                                          C = data_help$C,
                                          estimates = point_estimates_ee)
                    # Obtain score and hessian matrices
                    results_scores <- scores(derivobj)
                    results_hessian <- hessian(derivobj)
                    # Obtain sandwich standard error estimates of the parameters
                    se_estimates_ee <- sandwich_se(setting = setting,
                                                   scores = results_scores,
                                                   hessian = results_hessian)
                }
                if (ee_se == "bootstrap") {
                    se_estimates_ee <- bootstrap_se(setting = setting,
                                                    BS_rep = BS_rep,
                                                    Y = data_help$Y,
                                                    X = data_help$X,
                                                    K = data_help$K,
                                                    L = data_help$L,
                                                    C = data_help$C)
                }
                if (ee_se == "naive") {
                    se_estimates_ee <- naive_se(setting = setting,
                                                Y = data_help$Y,
                                                X = data_help$X,
                                                K = data_help$K,
                                                L = data_help$L,
                                                C = data_help$C)
                }
                results_ee$point_estimates[i] <- point_estimates_ee[7]
                results_ee$SE_estimates[i] <- se_estimates_ee[7]
                results_ee$wald_test_stat[i] <- point_estimates_ee[7]/
                                                  se_estimates_ee[7]
                results_ee$pvalues[i] <- 2 * pnorm(-abs(point_estimates_ee[7]/
                                                        se_estimates_ee[7]))
                names(results_ee$point_estimates)[i] <-
                  names(results_ee$SE_estimates)[i] <-
                  names(results_ee$wald_test_stat)[i] <-
                  names(results_ee$pvalues)[i] <- names(X)[i]
            }
        }
    }
    output <- list()
    if ("ee" %in% estimates) {
        output$results_ee <- results_ee
    }
    if ("mult_reg" %in% estimates) {
        output$results_mult_reg <- results_mult_reg
    }
    if ("res_reg" %in% estimates) {
        output$results_res_reg <- results_res_reg
    }
    if ("sem" %in% estimates) {
        output$results_sem <- results_sem
    }
    class(output) <- "ciee"
    return(output)
}

## ------------------------------------------------------------------------
results_ciee <- ciee(setting = "GLM", Y = dat$Y, X = dat$X, K = dat$K, L = dat$L,
                     estimates = c("ee", "mult_reg", "res_reg", "sem"),
                     ee_se = "sandwich")
results_ciee

maf <- 0.2
n <- 1000
dat <- generate_data(n = n, maf = maf)
datX <- data.frame(X = dat$X)
names(datX)[1] <- "X1"
for(i in 2:10){
 X <- rbinom(n, size = 2, prob = maf)
 datX$X <- X
 names(datX)[i] <- paste("X", i, sep="")
}
results_ciee_loop <- ciee_loop(setting = "GLM", Y = dat$Y, X = datX, K = dat$K, L = dat$L)
results_ciee_loop

## ---- echo=FALSE---------------------------------------------------------
summary.ciee <- function(results = NULL) {
    if (is.null(results)) {
        stop("ciee output has to be supplied.")
    }
    res_out <- NULL
    if ("results_ee" %in% names(results)) {
        res_ee_out <- data.frame(point_estimates = results$results_ee$point_estimates,
                                 SE_estimates = results$results_ee$SE_estimates,
                                 wald_test_stat = results$results_ee$wald_test_stat,
                                 pvalues = results$results_ee$pvalues)
        rownames(res_ee_out) <- paste("CIEE", rownames(res_ee_out), sep = "_")
        print(paste("Results based on estimating equations."))
        print(res_ee_out)
        res_out <- res_ee_out[,c(1,2,4)]
    }
    if ("results_mult_reg" %in% names(results)) {
        res_mr_out <- data.frame(point_estimates = results$results_mult_reg$point_estimates,
                                 SE_estimates = results$results_mult_reg$SE_estimates,
                                 pvalues = results$results_mult_reg$pvalues)
        rownames(res_mr_out) <- paste("MR", rownames(res_mr_out), sep = "_")
        print(paste("Results based on traditional multiple regression."))
        print(res_mr_out)
        res_out <- rbind(res_out, res_mr_out)
    }
    if ("results_res_reg" %in% names(results)) {
        res_rr_out <- data.frame(point_estimates = results$results_res_reg$point_estimates,
                                 SE_estimates = results$results_res_reg$SE_estimates,
                                 pvalues = results$results_res_reg$pvalues)
        rownames(res_rr_out) <- paste("RR", rownames(res_rr_out), sep = "_")
        print(paste("Results based on traditional regression of residuals."))
        print(res_rr_out)
        res_out <- rbind(res_out, res_rr_out)
    }
    if ("results_sem" %in% names(results)) {
        res_sem_out <- data.frame(point_estimates = results$results_sem$point_estimates,
                                  SE_estimates = results$results_sem$SE_estimates,
                                  pvalues = results$results_sem$pvalues)
        rownames(res_sem_out) <- paste("SEM", rownames(res_sem_out), sep = "_")
        print(paste("Results based on structural equation modeling."))
        print(res_sem_out)
        res_out <- rbind(res_out, res_sem_out)
    }
    invisible(res_out)
}

## ------------------------------------------------------------------------
summary(results_ciee)
summary(results_ciee_loop)

