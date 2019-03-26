## ---- echo=FALSE---------------------------------------------------------
generate_clayton_copula <- function(n = NULL, phi = NULL) {
    U1 <- runif(n, min = 0, max = 1)
    U2 <- runif(n, min = 0, max = 1)
    Y1 <- qnorm(U1, mean = 0, sd = 1)
    Y2.help <- (1 - U1^(-phi) * (1 - U2^(-phi/(1 + phi))))^(-1/phi)
    tau <- phi/(phi + 2)
    Y2 <- qnorm(Y2.help, mean = 0, sd = 1)
    phenodata <- data.frame(Y1 = Y1, Y2 = Y2)
    print(paste("Kendall's tau between Y1, Y2 = ", tau, sep=""))
    return(phenodata)
}

## ------------------------------------------------------------------------
# Generate phenotype data from the Clayton copula:
dat1a <- generate_clayton_copula(n = 1000, phi = 0.5)
dat1b <- generate_clayton_copula(n = 1000, phi = 2)
dat1c <- generate_clayton_copula(n = 1000, phi = 8)
par(mfrow = c(1, 3))
plot(dat1a$Y1, dat1a$Y2, xlab = "Y1", ylab = "Y2", 
     main = expression(paste("Scatterplot of ", Y[1], ", ", Y[2], " with ", tau, "=0.2")))
plot(dat1b$Y1, dat1b$Y2, xlab = "Y1", ylab = "Y2", 
     main = expression(paste("Scatterplot of ", Y[1], ", ", Y[2], " with ", tau, "=0.5")))
plot(dat1c$Y1, dat1c$Y2, xlab = "Y1", ylab = "Y2", 
     main = expression(paste("Scatterplot of ", Y[1], ", ", Y[2], " with ", tau, "=0.8")))

## ---- echo=FALSE---------------------------------------------------------
generate_singleton_data <- function(n_SNV = 100, n_ind = 1000) {
    genodata <- data.frame(matrix(nrow = n_ind, ncol = n_SNV))
    helpvec <- c(1, rep(0, n_ind - 1))
    for (i in 1:n_SNV) {
        genodata[, i] <- sample(helpvec, n_ind, replace = F)
        names(genodata)[i] <- paste("SNV", i, sep = "")
    }
    return(genodata)
}

## ---- echo=FALSE---------------------------------------------------------
generate_doubleton_data <- function(n_SNV = 100, n_ind = 1000) {
    genodata <- data.frame(matrix(nrow = n_ind, ncol = n_SNV))
    helpvec <- c(1, 1, rep(0, n_ind - 2))
    for (i in 1:n_SNV) {
        genodata[, i] <- sample(helpvec, n_ind, replace = F)
        names(genodata)[i] <- paste("SNV", i, sep = "")
    }
    return(genodata)
}

## ---- echo=FALSE---------------------------------------------------------
generate_genodata <- function(n_SNV = 100, n_ind = 1000) {
    genodata <- data.frame(matrix(nrow = n_ind, ncol = n_SNV))
    for (i in 1:n_SNV) {
        MAFhelp <- round(runif(1, 0, 0.5), 3)
        n0 <- round((1 - MAFhelp)^2 * n_ind)
        n2 <- round(MAFhelp^2 * n_ind)
        n1 <- n_ind - n0 - n2
        helpvec <- c(rep(0, n0), rep(1, n1), rep(2, n2))
        genodata[, i] <- sample(helpvec, n_ind, replace = F)
        names(genodata)[i] <- paste("SNV", i, sep = "")
    }
    return(genodata)
}

## ---- echo=FALSE---------------------------------------------------------
compute_MAF <- function(genodata) {
    MAF <- NULL
    if (is.null(dim(genodata))) {
        dat <- genodata[!is.na(genodata)]
        if (!all(unique(dat) %in% c(0, 1, 2))) {
            stop("SNP has to be supplied as genotypes 0,1,2.")
        }
        if (is.na(table(dat)["1"])) {
            genocount1 <- 0
        }
        if (!is.na(table(dat)["1"])) {
            genocount1 <- table(dat)["1"][[1]]
        }
        if (is.na(table(dat)["2"])) {
            genocount2 <- 0
        }
        if (!is.na(table(dat)["2"])) {
            genocount2 <- table(dat)["2"][[1]]
        }
        nobs <- length(dat)
        MAF <- (genocount1/nobs + 2 * genocount2/nobs)/2
        if (MAF > 0.5) {
            warning("MAF is larger than 0.5, maybe recode alleles?")
        }
    }
    if (!is.null(dim(genodata))) {
        for (i in 1:dim(genodata)[2]) {
            dat <- genodata[, i][!is.na(genodata[, i])]
            if (!all(unique(dat) %in% c(0, 1, 2))) {
                stop("SNP has to be supplied as genotypes 0,1,2.")
            }
            if (is.na(table(dat)["1"])) {
                genocount1 <- 0
            }
            if (!is.na(table(dat)["1"])) {
                genocount1 <- table(dat)["1"][[1]]
            }
            if (is.na(table(dat)["2"])) {
                genocount2 <- 0
            }
            if (!is.na(table(dat)["2"])) {
                genocount2 <- table(dat)["2"][[1]]
            }
            nobs <- length(dat)
            MAF[i] <- (genocount1/nobs + 2 * genocount2/nobs)/2
            if (MAF[i] > 0.5) {
                warning(paste("MAF of SNV ",i ," is larger than 0.5, maybe recode alleles?",sep=""))
            }
        }
    }
    names(MAF) <- names(genodata)
    return(MAF)
}

## ---- echo=FALSE---------------------------------------------------------
generate_phenodata_1_simple <- function(genodata = NULL, type = "quantitative",
                                        b = 0, a = c(0, 0.5, 0.5)) {
    if (is.null(genodata)) {
        stop("Genotype data has to be supplied.")
    }
    genodata <- as.matrix(genodata)
    genodata <- genodata[complete.cases(genodata),]
    genodata <- as.matrix(genodata)
    n_ind <- dim(genodata)[1]
    n_SNV <- dim(genodata)[2]
    if ((!n_SNV == length(b)) & (!n_SNV == length(b)) & (!length(b) == 1)) {
        stop("Genetic effects b has to be of same length as \n
             the number of provided SNVs or of length 1.")
    }
    if ((!n_SNV == length(b)) & (length(b) == 1)) {
        b <- rep(b, n_SNV)
    }
    X1 <- rnorm(n_ind, mean = 0, sd = 1)
    X2 <- rbinom(n_ind, size = 1, prob = 0.5)
    if (type == "quantitative") {
        Y <- a[1] + a[2] * X1 + a[3] * X2 + genodata %*% b + rnorm(n_ind, 0, 1)
    }
    if (type == "binary") {
        P <- 1/(1 + exp(-(a[1] + a[2] * X1 + a[3] * X2 + b * genodata)))
        Y <- rbinom(n_ind, 1, P)
    }
    phenodata <- data.frame(Y = Y, X1 = X1, X2 = X2)
    return(phenodata)
}

## ---- echo=FALSE---------------------------------------------------------
generate_phenodata_1 <- function(genodata = NULL, type = "quantitative", b = 0.6,
                                 a = c(0, 0.5, 0.5), MAF_cutoff = 1,
                                 prop_causal = 0.1, direction = "a") {
    if (is.null(genodata)) {
        stop("Genotype data has to be supplied")
    }
    genodata <- as.data.frame(genodata)
    genodata <- genodata[complete.cases(genodata),]
    genodata <- as.data.frame(genodata)
    n_ind <- dim(genodata)[1]
    n_SNV <- dim(genodata)[2]
    if ((!n_SNV == length(b)) & (!length(b) == 1)) {
        stop("Genetic effects b has to be of same length as \n
             the number of provided SNVs or of length 1.")
    }
    if ((!n_SNV == length(b)) & (length(b) == 1)) {
        b <- rep(b, n_SNV)
    }
    X1 <- rnorm(n_ind, mean = 0, sd = 1)
    X2 <- rbinom(n_ind, size = 1, prob = 0.5)
    sigma1 <- 1
    causal_idx <- FALSE
    while (!any(causal_idx)) {
        # if no causal variants are selected (MAF <= MAF_cutoff), do it again
        help_idx <- sample(1:dim(genodata)[2],
                           ceiling(prop_causal * dim(genodata)[2]))
        causal_idx <- ((1:dim(genodata)[2] %in% help_idx) &
                       (compute_MAF(genodata) < MAF_cutoff))
    }
    geno_causal <- as.matrix(genodata[, causal_idx])
    b <- b[causal_idx]
    alpha_g <- b * abs(log10(compute_MAF(geno_causal)))
    # if direction b or c is specified, change direction of effect for some variants
    if (direction == "b") {
        help_idx_2 <- sample(1:dim(geno_causal)[2],
                             round(0.2 * dim(geno_causal)[2]))
        alpha_g <- (-1)^(as.numeric(!(1:dim(geno_causal)[2] %in%help_idx_2)) + 1) * alpha_g
    }
    if (direction == "c") {
        help_idx_3 <- sample(1:dim(geno_causal)[2],
                             round(0.5 * dim(geno_causal)[2]))
        alpha_g <- (-1)^(as.numeric(!(1:dim(geno_causal)[2] %in% help_idx_3)) + 1) * alpha_g
    }
    epsilon1 <- rnorm(n_ind, mean = 0, sd = sigma1)
    if (type == "quantitative") {
        Y <- a[1] + a[2] * X1 + a[3] * X2 + geno_causal %*% alpha_g + epsilon1
        Y <- as.numeric(Y)
    }
    if (type == "binary") {
        P <- 1/(1 + exp(-(a[1] + a[2] * scale(X1, center = T, scale = F) +
                          a[3] * scale(X2, center = T, scale = F) +
                          geno_causal %*% alpha_g)))
        Y <- rbinom(n_ind, 1, P)
        Y <- as.numeric(Y)
    }
    phenodata <- data.frame(Y = Y, X1 = X1, X2 = X2)
    return(phenodata)
}

## ---- echo=FALSE---------------------------------------------------------
generate_phenodata_2_bvn <- function(genodata = NULL, tau = NULL, b1 = 0,
                                     b2 = 0, a1 = c(0, 0.5, 0.5),
                                     a2 = c(0, 0.5, 0.5)) {
    if (!requireNamespace("MASS", quietly = TRUE)) {
        stop("MASS package needed for this function to work. Please install it.",
             call. = FALSE)
    }
    if (is.null(genodata)) {
        stop("Genotype data has to be supplied.")
    }
    genodata <- as.matrix(genodata)
    genodata <- genodata[complete.cases(genodata),]
    genodata <- as.matrix(genodata)
    n_ind <- dim(genodata)[1]
    n_SNV <- dim(genodata)[2]
    if ((!n_SNV == length(b1)) & (!n_SNV == length(b1)) & (!length(b1) == 1)) {
        stop("Genetic effects b1 has to be of same length \n
             as the number of provided SNVs or of length 1.")
    }
    if ((!n_SNV == length(b2)) & (!n_SNV == length(b2)) & (!length(b2) == 1)) {
        stop("Genetic effects b2 has to be of same length \n
             as the number of provided SNVs or of length 1.")
    }
    if ((!n_SNV == length(b1)) & (length(b1) == 1)) {
        b1 <- rep(b1, n_SNV)
    }
    if ((!n_SNV == length(b2)) & (length(b2) == 1)) {
        b2 <- rep(b2, n_SNV)
    }
    # generate the two covariates
    X1 <- rnorm(n_ind, mean = 0, sd = 1)
    X2 <- rbinom(n_ind, size = 1, prob = 0.5)
    # set the weight of the nongenetic covariates set the residual variances
    sigma1 <- 1
    sigma2 <- 1
    if (is.null(tau)) {
        stop("Tau has to be provided.")
    }
    rho <- sin(tau * pi/2)
    mu <- c(0, 0)
    sigma <- matrix(c(sigma1, rho, rho, sigma2), 2, 2)
    epsilon <- MASS::mvrnorm(n = n_ind, mu = mu, Sigma = sigma)
    epsilon1 <- epsilon[, 1]
    epsilon2 <- epsilon[, 2]
    Y1 <- a1[1] + a1[2] * X1 + a1[3] * X2 + genodata %*% b1 + epsilon1
    Y2 <- a2[1] + a2[2] * X1 + a2[3] * X2 + genodata %*% b2 + epsilon2
    phenodata <- data.frame(Y1 = Y1, Y2 = Y2, X1 = X1, X2 = X2)
    return(phenodata)
}

## ---- echo=FALSE---------------------------------------------------------
generate_phenodata_2_copula <- function(genodata = NULL, phi = NULL, tau = 0.5,
                                        b1 = 0.6, b2 = 0.6, a1 = c(0, 0.5, 0.5),
                                        a2 = c(0, 0.5, 0.5), MAF_cutoff = 1,
                                        prop_causal = 0.1, direction = "a") {
    if (is.null(genodata)) {
        stop("Genotype data has to be supplied.")
    }
    genodata <- as.matrix(genodata)
    genodata <- genodata[complete.cases(genodata),]
    genodata <- as.matrix(genodata)
    n_ind <- dim(genodata)[1]
    n_SNV <- dim(genodata)[2]
    if ((!n_SNV == length(b1)) & (!n_SNV == length(b1)) & (!length(b1) == 1)) {
        stop("Genetic effects b1 has to be of same length \n
             as the number of provided SNVs or of length 1.")
    }
    if ((!n_SNV == length(b2)) & (!n_SNV == length(b2)) & (!length(b2) == 1)) {
        stop("Genetic effects b2 has to be of same length \n
             as the number of provided SNVs or of length 1.")
    }
    if ((!n_SNV == length(b1)) & (length(b1) == 1)) {
        b1 <- rep(b1, n_SNV)
    }
    if ((!n_SNV == length(b2)) & (length(b2) == 1)) {
        b2 <- rep(b2, n_SNV)
    }
    X1 <- rnorm(n_ind, mean = 0, sd = 1)
    X2 <- rbinom(n_ind, size = 1, prob = 0.5)
    sigma1 <- 1
    sigma2 <- 1
    causal_idx <- FALSE
    while (!any(causal_idx)) {
        # if no causal variants are selected (MAF <= MAF_cutoff), do it again
        help_idx <- sample(1:dim(genodata)[2],
                           ceiling(prop_causal * dim(genodata)[2]))
        causal_idx <- ((1:dim(genodata)[2] %in% help_idx) &
                       (compute_MAF(genodata) < MAF_cutoff))
    }
    geno_causal <- as.matrix(genodata[, causal_idx])
    b1 <- b1[causal_idx]
    b2 <- b2[causal_idx]
    alpha_g <- b1 * abs(log10(compute_MAF(geno_causal)))
    beta_g <- b2 * abs(log10(compute_MAF(geno_causal)))
    # if b or c is specified, change effect direction for some variants
    if (direction == "b") {
        help_idx_2 <- sample(1:dim(geno_causal)[2],
                             round(0.2 * dim(geno_causal)[2]))
        alpha_g <- (-1)^(as.numeric(!(1:dim(geno_causal)[2] %in% help_idx_2)) + 1) * alpha_g
        beta_g <- (-1)^(as.numeric(!(1:dim(geno_causal)[2] %in% help_idx_2)) + 1) * beta_g
    }
    if (direction == "c") {
        help_idx_3 <- sample(1:dim(geno_causal)[2],
                             round(0.5 * dim(geno_causal)[2]))
        alpha_g <- (-1)^(as.numeric(!(1:dim(geno_causal)[2] %in% help_idx_3)) + 1) * alpha_g
        beta_g <- (-1)^(as.numeric(!(1:dim(geno_causal)[2] %in% help_idx_3)) + 1) * beta_g
    }
    # compute copula parameter between the two phenotypes from tau if tau is given
    if (!is.null(tau)) {
        phi <- (2 * tau)/(1 - tau)
    }
    res_copula <- generate_clayton_copula(n = n_ind, phi = phi)
    epsilon1 <- res_copula$Y1
    epsilon2 <- res_copula$Y2
    if (is.null(tau)) {
        tau <- phi/(phi + 2)
    }
    Y1 <- a1[1] + a1[2] * X1 + a1[3] * X2 + geno_causal %*% alpha_g + epsilon1
    Y1 <- as.numeric(Y1)
    Y2 <- a2[1] + a2[2] * X1 + a2[3] * X2 + geno_causal %*% beta_g + epsilon2
    Y2 <- as.numeric(Y2)
    phenodata <- data.frame(Y1 = Y1, Y2 = Y2, X1 = X1, X2 = X2)
    print(paste("Kendall's tau between Y1, Y2 = ", tau, sep=""))
    return(phenodata)
}

## ------------------------------------------------------------------------
# Generate genetic data:
genodata <- generate_genodata(n_SNV = 20, n_ind = 1000)
compute_MAF(genodata)
# Generate phenotype data from the bivariate normal distribution given covariates:
phenodata_bvn <- generate_phenodata_2_bvn(genodata = genodata,
                                          tau = 0.5, b1 = 1, b2 = 2)
plot(phenodata_bvn$Y1, phenodata_bvn$Y2, xlab = "Y1", ylab = "Y2",
     main = expression(paste("Scatterplot of bivariate normal ", Y[1], ", ", 
                             Y[2], " with ", tau, "=0.5")))
# Generate phenotype data from the Clayton copula given covariates:
phenodata <- generate_phenodata_2_copula(genodata = genodata$SNV1,
                                         MAF_cutoff = 1, prop_causal = 1,
                                         tau = 0.5, b1 = 0.3, b2 = 0.3)
plot(phenodata$Y1, phenodata$Y2, xlab = "Y1", ylab = "Y2",
     main = expression(paste("Scatterplot of ", Y[1], ", ", Y[2], 
                             " from the Clayton copula with ", tau, "=0.5")))

## ---- echo=FALSE---------------------------------------------------------
compute_expl_var <- function(genodata = NULL, phenodata = NULL,
                             type = "Rsquared_unadj", causal_idx = NULL,
                             effect_causal = NULL) {
    ExplVar <- NULL
    if (is.null(phenodata) | is.null(genodata)) {
        stop("Genodata and phenodata have to be supplied.")
    }
    if (!dim(genodata)[1] == length(phenodata)) {
        stop("Number of observations in genodata and phenodata has to be the same.")
    }
    if (class(genodata) == "data.frame") {
        if (!all(sapply(genodata, is.numeric))) {
            genodata <- as.data.frame(data.matrix(genodata))
        }
    }
    if (is.null(dim(genodata))) {
        if (!is.numeric(genodata)) {
            stop("genodata has to be numeric.")
        }
    }
    if (class(phenodata) == "data.frame") {
        if (!all(sapply(phenodata, is.numeric))) {
            phenodata <- as.data.frame(data.matrix(phenodata))
            warning("phenodata contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    if (is.null(dim(phenodata))) {
        if (!is.numeric(phenodata)) {
            stop("phenodata has to be numeric.")
        }
    }
    if (is.null(causal_idx)) {
        warning("A vector indicating the causal SNVs is not supplied \n
                so the estimate of explained variance is based on all SNVs.")
    }
    if (any(type %in% c("MAF_based", "MAF_based_Y_adjusted")) & is.null(effect_causal)) {
        stop("A vector indicating the genetic effect sizes of the causal SNVs has \n
             to be supplied for the MAF_based and MAF_based_Y_adjusted approach.")
    }
    if (!is.null(causal_idx)) {
        genodata <- as.data.frame(genodata[, causal_idx])
    }
    MAF_causal <- compute_MAF(genodata)
    phenodata <- as.data.frame(phenodata)
    dat <- as.data.frame(append(phenodata, genodata))
    dat <- dat[complete.cases(dat),]
    names(dat)[1] <- "Y"
    ExplVar <- list()
    if ("Rsquared_unadj" %in% type) {
        ExplVar$Rsquared_unadj <- summary(lm(Y ~ ., data = dat))$r.squared
    }
    if ("Rsquared_adj" %in% type) {
        ExplVar$Rsquared_adj <- summary(lm(Y ~ ., data = dat))$adj.r.squared
    }
    if ("MAF_based" %in% type) {
        ExplVar$MAF_based <- sum(2 * MAF_causal * (1 - MAF_causal) * effect_causal^2)
    }
    if ("MAF_based_Y_adjusted" %in% type) {
        ExplVar$MAF_based_Y_adjusted <- sum(2 * MAF_causal *
                                            (1 - MAF_causal) *
                                            effect_causal^2)/var(dat$Y)
    }
    return(ExplVar)
}

## ------------------------------------------------------------------------
compute_expl_var(genodata = genodata, phenodata = phenodata$Y1,
                 type = c("Rsquared_unadj", "Rsquared_adj", 
                          "MAF_based", "MAF_based_Y_adjusted"),
                 causal_idx = rep(TRUE,20), effect_causal = 
                   c(0.3 * abs(log10(compute_MAF(genodata$SNV1))), rep(0,19)))

## ---- echo=FALSE---------------------------------------------------------
get_estimates_naive <- function(Y1 = NULL, Y2 = NULL, predictors_Y1 = NULL,
                                predictors_Y2 = NULL, copula_param = "both") {
    if (is.null(Y1) | is.null(Y2)) {
        stop("Both Y1 and Y2 have to be supplied.")
    }
    dataframe_Y1 <- data.frame(Y1 = Y1)
    dataframe_Y2 <- data.frame(Y2 = Y2)
    n_ind <- dim(dataframe_Y1)[1]
    if ((!class(predictors_Y1) == "data.frame" & !is.null(predictors_Y1)) |
        (!class(predictors_Y2) == "data.frame" & !is.null(predictors_Y2))) {
      stop("predictors_Y1 and predictors_Y2 have to be a dataframe or NULL.")
    }
    if (class(predictors_Y1) == "data.frame") {
      if (!all(sapply(predictors_Y1, is.numeric))) {
        predictors_Y1 <- as.data.frame(data.matrix(predictors_Y1))
        warning("predictors_Y1 contains non-numeric Variables,
                     which have automatically been transformed.")
      }
    }
    if (class(predictors_Y2) == "data.frame") {
      if (!all(sapply(predictors_Y2, is.numeric))) {
        predictors_Y2 <- as.data.frame(data.matrix(predictors_Y2))
        warning("predictors_Y2 contains non-numeric Variables,
                     which have automatically been transformed.")
      }
    }
    if (!is.null(predictors_Y1)) {
        predictors_Y1 <- data.frame(predictors_Y1)
    }
    if (!is.null(predictors_Y2)) {
        predictors_Y2 <- data.frame(predictors_Y2)
    }
    if (!n_ind == dim(dataframe_Y2)[1]) {
        stop("Variables must have same length.")
    }
    if (!is.null(predictors_Y1)) {
        if (!n_ind == dim(predictors_Y1)[1]) {
            stop("Variables must have same length.")
        }
    }
    if (!is.null(predictors_Y2)) {
        if (!n_ind == dim(predictors_Y2)[1]) {
            stop("Variables must have same length.")
        }
    }
    if (!is.null(predictors_Y1)) {
        dataframe_Y1 <- cbind(dataframe_Y1, predictors_Y1)
    }
    if (!is.null(predictors_Y2)) {
        dataframe_Y2 <- cbind(dataframe_Y2, predictors_Y2)
    }
    res_Y1 <- lm(Y1 ~ ., data = dataframe_Y1)
    res_Y2 <- lm(Y2 ~ ., data = dataframe_Y2)
    param_Y1_sigma <- log(sd(res_Y1$residuals, na.rm = T))
    #param_Y1_sigma <- log(sd(Y1, na.rm = T))
    names(param_Y1_sigma) <- "Y1_log_sigma"
    param_Y2_sigma <- log(sd(res_Y2$residuals, na.rm = T))
    #param_Y2_sigma <- log(sd(Y2, na.rm = T))
    names(param_Y2_sigma) <- "Y2_log_sigma"
    tau <- cor(Y1, Y2, use = "complete.obs", method = c("kendall"))
    if (tau == 0) {
        tau <- 1e-04
    } # to avoid technical breakdown of function
    log_phi <- log(2 * tau/(1 - tau))
    log_theta <- log((1/(1 - tau)) - 1)
    param_Y1_Y2 <- c(log_phi, log_theta)
    names(param_Y1_Y2) <- c("log_phi", "log_theta_minus1")
    if (copula_param == "phi") {
        param_Y1_Y2 <- param_Y1_Y2[1]
    }
    if (copula_param == "theta") {
        param_Y1_Y2 <- param_Y1_Y2[2]
    }
    param_Y1_predictors <- res_Y1$coefficients
    names(param_Y1_predictors) <- paste("Y1_", names(param_Y1_predictors), sep = "")
    param_Y2_predictors <- res_Y2$coefficients
    names(param_Y2_predictors) <- paste("Y2_", names(param_Y2_predictors), sep = "")
    if (any(is.na(param_Y1_Y2))) {
        warning("One or both dependence parameters could not be estimated.")
    }
    if (any(is.na(param_Y1_sigma)) | any(is.na(param_Y2_sigma))) {
        warning("One or both marginal variances could not be estimated.")
    }
    if (any(is.na(param_Y1_predictors)) | any(is.na(param_Y2_predictors))) {
        warning("One or more marginal parameters could not be estimated.")
    }
    estimates <- c(param_Y1_Y2, param_Y1_sigma, param_Y2_sigma,
                   param_Y1_predictors, param_Y2_predictors)
    return(estimates)
}

## ------------------------------------------------------------------------
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2, SNV = genodata$SNV1)
get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors, 
                    predictors_Y2 = predictors, copula_param = "both")

## ---- echo=FALSE---------------------------------------------------------
minusloglik <- function(copula = "Clayton", Y1 = NULL, Y2 = NULL,
                        predictors_Y1 = NULL, predictors_Y2 = NULL,
                        parameters = NULL) {
    if ((!class(predictors_Y1) == "data.frame" & !is.null(predictors_Y1)) |
        (!class(predictors_Y2) == "data.frame" & !is.null(predictors_Y2))) {
        stop("predictors_Y1 and predictors_Y2 have to be a dataframe or NULL.")
    }
    if (class(predictors_Y1) == "data.frame") {
        if (!all(sapply(predictors_Y1, is.numeric))) {
            predictors_Y1 <- as.data.frame(data.matrix(predictors_Y1))
            warning("predictors_Y1 contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    if (class(predictors_Y2) == "data.frame") {
        if (!all(sapply(predictors_Y2, is.numeric))) {
            predictors_Y2 <- as.data.frame(data.matrix(predictors_Y2))
            warning("predictors_Y2 contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    if (!is.null(predictors_Y2)) {
        n_Y2_pred <- dim(predictors_Y2)[2]
    } else {
        n_Y2_pred <- 0
    }
    if (!is.null(predictors_Y1)) {
        n_Y1_pred <- dim(predictors_Y1)[2]
    } else {
        n_Y1_pred <- 0
    }
    if (!is.null(predictors_Y2)) {
        n_Y2_pred <- dim(predictors_Y2)[2]
    } else {
        n_Y2_pred <- 0
    }
    if (copula == "Clayton") {
        param_Y1_Y2 <- parameters[1]
        n_dep <- 1
        if (!names(param_Y1_Y2) == "log_phi") {
            stop("Estimate for phi is not provided.")
        }
    }
    if (copula == "2param") {
        param_Y1_Y2 <- parameters[1:2]
        n_dep <- 2
        if (!identical(names(param_Y1_Y2), c("log_phi", "log_theta_minus1"))) {
            stop("Estimates for phi/theta are not provided.")
        }
    }
    param_Y1_sigma <- parameters[n_dep + 1]
    param_Y2_sigma <- parameters[n_dep + 2]
    no_p <- length(parameters)
    param_Y1_predictors <- parameters[(n_dep + 3):(n_dep + 3 + n_Y1_pred)]
    param_Y2_predictors <- parameters[(no_p - n_Y2_pred):no_p]
    if (is.null(Y1) | is.null(Y2)) {
        stop("Both Y1 and Y2 have to be supplied.")
    }
    n_ind <- length(Y1)
    if (!is.null(predictors_Y1)) {
        predictors_Y1 <- cbind(data.frame(One = rep(1, n_ind)), predictors_Y1)
    } else {
        predictors_Y1 <- data.frame(One = rep(1, n_ind))
    }
    if (!is.null(predictors_Y2)) {
        predictors_Y2 <- cbind(data.frame(One = rep(1, n_ind)), predictors_Y2)
    } else {
        predictors_Y2 <- data.frame(One = rep(1, n_ind))
    }
    if (!n_ind == length(Y2)) {
        stop("Variables must have same length.")
    }
    if (!n_ind == dim(predictors_Y1)[1]) {
        stop("Variables must have same length.")
    }
    if (!n_ind == dim(predictors_Y2)[1]) {
        stop("Variables must have same length.")
    }
    if (is.null(param_Y1_Y2) | any(is.na(param_Y1_Y2))) {
        stop("Estimate(s) of dependence betwee Y1 and Y2 is (are) not provided.")
    }
    if (any(is.na(param_Y1_sigma)) | any(is.na(param_Y2_sigma))) {
        stop("One or both marginal variances are not provided")
    }
    if (any(is.na(param_Y1_predictors))) {
        warning(paste("Effect estimate of ",
                      names(predictors_Y1)[which(is.na(param_Y1_predictors))],
                      " on Y1 is missing. Variable ",
                      names(predictors_Y1)[which(is.na(param_Y1_predictors))],
                      " is excluded from the analysis.", sep = ""))
        predictors_Y1 <- predictors_Y1[, !is.na(param_Y1_predictors)]
        param_Y1_predictors <- param_Y1_predictors[!is.na(param_Y1_predictors)]
    }
    if (any(is.na(param_Y2_predictors))) {
        warning(paste("Effect estimates of ",
                      names(predictors_Y2)[which(is.na(param_Y2_predictors))],
                      " on Y2 is missing. Variable ",
                      names(predictors_Y2)[which(is.na(param_Y1_predictors))],
                      " is excluded from the analysis.", sep = ""))
        predictors_Y2 <- predictors_Y2[, !is.na(param_Y2_predictors)]
        param_Y2_predictors <- param_Y2_predictors[!is.na(param_Y2_predictors)]
    }
    if (copula == "Clayton") {
        phi <- exp(param_Y1_Y2[1])
    } else if (copula == "2param") {
        phi <- exp(param_Y1_Y2[1])
        theta <- exp(param_Y1_Y2[2]) + 1
    } else {
        stop("copula has to be specified")
    }
    minusloglik <- 0
    predictors_Y1 <- as.matrix(predictors_Y1)
    predictors_Y2 <- as.matrix(predictors_Y2)
    for (i in 1:n_ind) {
        lik.pt1.1 <- pnorm(Y1[i],
                           mean = as.numeric(param_Y1_predictors) %*% predictors_Y1[i, ],
                           sd = exp(as.numeric(param_Y1_sigma)))
        lik.pt1.2 <- pnorm(Y2[i],
                           mean = as.numeric(param_Y2_predictors) %*% predictors_Y2[i, ],
                           sd = exp(as.numeric(param_Y2_sigma)))
        lik.pt2 <- dnorm(Y1[i],
                         mean = as.numeric(param_Y1_predictors) %*% predictors_Y1[i, ],
                         sd = exp(as.numeric(param_Y1_sigma)))
        lik.pt3 <- dnorm(Y2[i],
                         mean = as.numeric(param_Y2_predictors) %*% predictors_Y2[i, ],
                         sd = exp(as.numeric(param_Y2_sigma)))
        if (copula == "Clayton") {
            fun <- ((lik.pt1.1)^(-phi) - 1) + ((lik.pt1.2)^(-phi) - 1)
            joints <- (fun + 1)^(-1/phi)
            d1.joints <- (fun + 1)^(-1/phi - 1) * (lik.pt1.1)^(-phi - 1) * (-lik.pt2)
            d2.joints <- (fun + 1)^(-1/phi - 1) * (lik.pt1.2)^(-phi - 1) * (-lik.pt3)
            dd.joints <- d1.joints * d2.joints * fun^(-1) * (fun + 1)^(1/phi + 1)
            lik <- dd.joints * (fun * (1 + phi) * (fun + 1)^(-1))
        }
        if (copula == "2param") {
            fun <- ((lik.pt1.1)^(-phi) - 1)^theta + ((lik.pt1.2)^(-phi) - 1)^theta
            joints <- (fun^(1/theta) + 1)^(-1/phi)
            d1.joints <- (fun^(1/theta) + 1)^(-1/phi - 1) * fun^(1/theta - 1) *
                         ((lik.pt1.1)^(-phi) - 1)^(theta - 1) *
                         (lik.pt1.1)^(-phi - 1) * (-lik.pt2)
            d2.joints <- (fun^(1/theta) + 1)^(-1/phi - 1) * fun^(1/theta - 1) *
                         ((lik.pt1.2)^(-phi) - 1)^(theta - 1) *
                         (lik.pt1.2)^(-phi - 1) * (-lik.pt3)
            dd.joints <- d1.joints * d2.joints * fun^(-1/theta) *
                         (fun^(1/theta) + 1)^(1/phi + 1)
            lik <- dd.joints * ((theta - 1) * phi + fun^(1/theta) *
                   (1 + phi) * (fun^(1/theta) + 1)^(-1))
        }
        minusloglik <- minusloglik - log(lik)
    }
    return(as.numeric(minusloglik))
}

## ------------------------------------------------------------------------
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2, genodata[, 1:5])
estimates <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                predictors_Y1 = predictors,
                                predictors_Y2 = predictors, copula_param = "both")
minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2, predictors_Y1 = predictors,
           predictors_Y2 = predictors, parameters = estimates, copula = "2param")

## ---- echo=FALSE---------------------------------------------------------
lrt_copula <- function(minlogl_null = NULL, minlogl_altern = NULL) {
    if (is.null(minlogl_null) | is.null(minlogl_altern)) {
        stop("minlogl_null and minlogl_altern have to be supplied.")
    }
    chisq <- 2 * minlogl_null - 2 * minlogl_altern
    pval <- 1 - (0.5 + 0.5 * pchisq(chisq, df = 1))
    return(list(chisq = chisq, pval = pval))
}

## ------------------------------------------------------------------------
# Example: Test whether 2-parameter copula model has a better
#          model fit compared to Clayton copula (no).
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                         SNV = genodata$SNV1)
estimates_c <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors,
                                   predictors_Y2 = predictors,
                                   copula_param = "phi")
minusloglik_Clayton <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors,
                                   predictors_Y2 = predictors,
                                   parameters = estimates_c, copula = "Clayton")
estimates_2p <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                    predictors_Y1 = predictors,
                                    predictors_Y2 = predictors,
                                    copula_param = "both")
minusloglik_2param <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                  predictors_Y1 = predictors,
                                  predictors_Y2 = predictors,
                                  parameters = estimates_2p, copula = "2param")
lrt_copula(minusloglik_Clayton, minusloglik_2param)

## ---- echo=FALSE---------------------------------------------------------
lrt_param <- function(minlogl_null = NULL, minlogl_altern = NULL, df = NULL) {
    if (is.null(minlogl_null) | is.null(minlogl_altern) | is.null(df)) {
        stop("minlogl_null, minlogl_altern and df have to be supplied.")
    }
    chisq <- 2 * minlogl_null - 2 * minlogl_altern
    pval <- 1 - pchisq(chisq, df = df)
    return(list(chisq = chisq, pval = pval))
}

## ------------------------------------------------------------------------
# Example: Test marginal parameters (alternative model has better fit).
predictors_1 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)
estimates_1 <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors_1,
                                   predictors_Y2 = predictors_1,
                                   copula = "phi")
minusloglik_1 <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                             predictors_Y1 = predictors_1,
                             predictors_Y2 = predictors_1,
                             parameters = estimates_1, copula = "Clayton")
predictors_2 <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2,
                           SNV = genodata$SNV1)
estimates_2 <- get_estimates_naive(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                                   predictors_Y1 = predictors_2,
                                   predictors_Y2 = predictors_2,
                                   copula = "phi")
minusloglik_2 <- minusloglik(Y1 = phenodata$Y1, Y2 = phenodata$Y2,
                             predictors_Y1 = predictors_2,
                             predictors_Y2 = predictors_2,
                             parameters = estimates_2, copula = "Clayton")
lrt_param(minusloglik_1, minusloglik_2, df=2)

## ---- echo=FALSE---------------------------------------------------------
cjamp <- function(copula = "Clayton", Y1 = NULL, Y2 = NULL, predictors_Y1 = NULL,
                  predictors_Y2 = NULL, scale_var = FALSE, optim_method = "BFGS",
                  trace = 2, kkt2tol = 1e-16, SE_est = TRUE, pval_est = TRUE,
                  n_iter_max = 10) {
    if (pval_est & !SE_est) {
        stop("SE_est has to be TRUE to compute p-values.")
    }
    if (!requireNamespace("optimx", quietly = TRUE)) {
        stop("Package optimx needed for this function to work. Please install it.",
             call. = FALSE)
    }
    if (is.null(Y1) | is.null(Y2)) {
        stop("Y1 and Y2 have to be supplied.")
    }
    if (cor(Y1, Y2, use = "complete.obs", method = "kendall") < 0) {
        Y2 <- -Y2
        warning("Dependence between Y1, Y2 is negative but copulas require positive dependence. \n
                 Hence Y2 is transformed to -Y2 and point estimates for Y2 are in inverse direction.")
    }
    if (copula == "Clayton") {
        n_dep <- 1
        copula_param = "phi"
    }
    if (copula == "2param") {
        n_dep <- 2
        copula_param = "both"
    }
    if ((!class(predictors_Y1) == "data.frame" & !is.null(predictors_Y1)) |
        (!class(predictors_Y2) == "data.frame" & !is.null(predictors_Y2))) {
         stop("predictors_Y1 and predictors_Y2 have to be a dataframe or NULL.")
    }
    if (class(predictors_Y1) == "data.frame") {
        if (!all(sapply(predictors_Y1, is.numeric))) {
            predictors_Y1 <- as.data.frame(data.matrix(predictors_Y1))
            warning("predictors_Y1 contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    if (class(predictors_Y2) == "data.frame") {
        if (!all(sapply(predictors_Y2, is.numeric))) {
            predictors_Y2 <- as.data.frame(data.matrix(predictors_Y2))
            warning("predictors_Y2 contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    if (is.null(predictors_Y1) & is.null(predictors_Y2)) {
        idx <- (!is.na(Y1) & !is.na(Y2))
        Y1 <- Y1[idx]
        Y2 <- Y2[idx]
        n_pred <- 0
    }
    if (!is.null(predictors_Y1) & is.null(predictors_Y2)) {
        idx <- (!is.na(Y1) & !is.na(Y2) & complete.cases(predictors_Y1))
        Y1 <- Y1[idx]
        Y2 <- Y2[idx]
        predictors_Y1 <- predictors_Y1[idx, , drop = FALSE]
        if (qr(predictors_Y1)$rank < dim(predictors_Y1)[2]) {
            stop("Complete cases matrix of predictors_Y1 doesn't have full rank.")
        }
        n_pred <- dim(predictors_Y1)[2]
    }
    if (is.null(predictors_Y1) & !is.null(predictors_Y2)) {
        idx <- (!is.na(Y1) & !is.na(Y2) & complete.cases(predictors_Y2))
        Y1 <- Y1[idx]
        Y2 <- Y2[idx]
        predictors_Y2 <- predictors_Y2[idx, , drop = FALSE]
        if (qr(predictors_Y2)$rank < dim(predictors_Y2)[2]) {
            stop("Complete cases matrix of predictors_Y2 doesn't have full rank.")
        }
        n_pred <- dim(predictors_Y2)[2]
    }
    if (!is.null(predictors_Y1) & !is.null(predictors_Y2)) {
        idx <- (!is.na(Y1) & !is.na(Y2) & complete.cases(predictors_Y1) &
                complete.cases(predictors_Y2))
        Y1 <- Y1[idx]
        Y2 <- Y2[idx]
        predictors_Y1 <- predictors_Y1[idx, , drop = FALSE]
        predictors_Y2 <- predictors_Y2[idx, , drop = FALSE]
        if (qr(predictors_Y1)$rank < dim(predictors_Y1)[2]) {
            stop("Complete cases matrix of predictors_Y1 doesn't have full rank.")
        }
        if (qr(predictors_Y2)$rank < dim(predictors_Y2)[2]) {
            stop("Complete cases matrix of predictors_Y2 doesn't have full rank.")
        }
        n_pred <- dim(predictors_Y1)[2] + dim(predictors_Y2)[2]
    }
    if (scale_var) {
        predictors_Y1 <- data.frame(lapply(predictors_Y1, scale))
        predictors_Y2 <- data.frame(lapply(predictors_Y2, scale))
    }
    convcode <- 1
    kkt <- c(FALSE, FALSE)
    n_iter <- 1
    helpnum <- 0.4
    while (!(convcode == 0 & all(kkt) & !any(is.na(kkt))) & (n_iter <= n_iter_max)) {
        startvalues <- get_estimates_naive(Y1 = Y1, Y2 = Y2,
                                           predictors_Y1 = predictors_Y1,
                                           predictors_Y2 = predictors_Y2,
                                           copula_param = copula_param) - helpnum
        names_pred <- names(startvalues[(n_dep + 3):length(startvalues)])
        if (minusloglik(Y1 = Y1, Y2 = Y2, predictors_Y1 = predictors_Y1,
                        predictors_Y2 = predictors_Y2, copula = copula,
                        parameters = startvalues) == Inf |
            is.na(minusloglik(Y1 = Y1, Y2 = Y2, predictors_Y1 = predictors_Y1,
                              predictors_Y2 = predictors_Y2, copula = copula,
                              parameters = startvalues))) {
            helpnum <- (-1)^rbinom(1, 1, 0.5) * runif(1, min = 0.1, max = 1)
            n_iter <- n_iter + 1
            next
        }
        res <- optimx::optimx(par = startvalues, fn = minusloglik, Y1 = Y1, Y2 = Y2,
                              predictors_Y1 = predictors_Y1, predictors_Y2 = predictors_Y2,
                              copula = copula, method = optim_method, hessian = TRUE,
                              control = list(trace = trace, kkt2tol = kkt2tol))
        convcode <- res$convcode
        kkt <- c(res$kkt1, res$kkt2)
        helpnum <- (-1)^rbinom(1, 1, 0.5) * runif(1, min = 0.1, max = 1)
        n_iter <- n_iter + 1
    }
    names(convcode) <- "convcode"
    names(kkt) <- c("KKT1", "KKT2")
    maxloglik <- NULL
    if (!convcode == 0) {
        warning("In model with predictors \n", names_pred,
                ": \n Optimization doesn't seem to be converged.",
                "\n SE estimates and pvalues are not computed. Please check.")
    }
    if (!all(kkt) | any(is.na(kkt))) {
        warning("In model with predictors \n", names_pred,
                ": \n KKT conditions are not satistified.",
                " \n SE estimates and pvalues are not computed. Please check.")
    }
    if (!convcode == 0 | !all(kkt) | any(is.na(kkt))) {
        warning("In model with predictors \n", names_pred,
                ": \n Naive parameter estimates are computed from separate marginal models.")
        point_estimates <- get_estimates_naive(Y1 = Y1, Y2 = Y2, predictors_Y1 = predictors_Y1,
                                               predictors_Y2 = predictors_Y2,
                                               copula_param = copula_param)
        point_estimates <- as.list(point_estimates)
        if (copula == "Clayton") {
            phi <- exp(point_estimates$log_phi)
            tau <- phi/(2 + phi)
            theta <- lambda_l <- lambda_u <- NA
        }
        if (copula == "2param") {
            phi <- exp(point_estimates$log_phi)
            theta <- exp(point_estimates$log_theta_minus1) + 1
            tau <- 1 - (2/(theta * (phi + 2)))
            lambda_l <- 2^(-1/(theta * phi))
            lambda_u <- 2 - 2^(1/theta)
        }
        point_estimates <- c(point_estimates[(n_dep + 1):length(point_estimates)],
                             phi, theta, tau, lambda_l, lambda_u)
        point_estimates[[1]] <- exp(point_estimates[[1]])
        point_estimates[[2]] <- exp(point_estimates[[2]])
        names(point_estimates) <- c("Y1_sigma", "Y2_sigma", names_pred, "phi",
                                    "theta", "tau", "lambda_l", "lambda_u")
    }
    if (convcode == 0 & all(kkt) & !any(is.na(kkt))) {
        maxloglik <- res$value
        names(maxloglik) <- "maxloglik"
        point_estimates <- res[(n_dep + 1):(n_dep + n_pred + 4)]
        point_estimates[1:2] <- exp(point_estimates[1:2])
        if (copula == "Clayton") {
            phi <- exp(res$log_phi)
            tau <- phi/(2 + phi)
            theta <- lambda_l <- lambda_u <- NA
        }
        if (copula == "2param") {
            phi <- exp(res$log_phi)
            theta <- exp(res$log_theta_minus1) + 1
            tau <- 1 - (2/(theta * (phi + 2)))
            lambda_l <- 2^(-1/(theta * phi))
            lambda_u <- 2 - 2^(1/theta)
        }
        point_estimates <- c(point_estimates, phi, theta, tau, lambda_l, lambda_u)
        names(point_estimates) <- c("Y1_sigma", "Y2_sigma", names_pred,
                                    "phi", "theta", "tau", "lambda_l", "lambda_u")
    }
    SE_estimates <- NULL
    if (SE_est & convcode == 0 & all(kkt) & !any(is.na(kkt))) {
        SE_estimates <- vector(mode = "numeric", length = (n_pred + 4))
        SE_estimates[1] <- sqrt(diag(solve(attributes(res)$details[[3]]))[n_dep + 1] *
                                  (point_estimates$Y1_sigma^2))
        SE_estimates[2] <- sqrt(diag(solve(attributes(res)$details[[3]]))[n_dep + 2] *
                                  (point_estimates$Y2_sigma^2))
        SE_estimates[3:length(SE_estimates)] <-
          sqrt(diag(solve(attributes(res)$details[[3]]))[(n_dep + 3):(n_dep + n_pred + 4)])
        if (copula == "Clayton") {
            helpvar1 <- 2 * phi/((phi + 2)^2)
            phi_SE <- sqrt(diag(solve(attributes(res)$details[[3]]))[1] * (phi^2))
            tau_SE <- sqrt(diag(solve(attributes(res)$details[[3]]))[1] * (helpvar1^2))
            theta_SE <- lambda_l_SE <- lambda_u_SE <- NA
        }
        if (copula == "2param") {
            helpvar3.1 <- 2 * phi/(theta * (phi + 2)^2)
            helpvar3.2 <- 2 * (theta - 1)/(theta^2 * (phi + 2))
            helpvar3.3 <- (2^(-1/(theta * phi))) * (log(2)/(theta * phi))
            helpvar3.4 <- (2^(-1/(theta * phi))) * (log(2) * (theta - 1)/(theta^2 * phi))
            helpvar3.5 <- (2^(1/theta)) * ((theta - 1) * log(2)/theta^2)
            phi_SE <- sqrt(diag(solve(attributes(res)$details[[3]]))[1] * (phi^2))
            theta_SE <- sqrt(diag(solve(attributes(res)$details[[3]]))[2] *
                               ((theta - 1)^2))
            tau_SE <- sqrt(t(c(helpvar3.1, helpvar3.2)) %*%
                             solve(attributes(res)$details[[3]])[1:2, 1:2] %*%
                             c(helpvar3.1, helpvar3.2))
            lambda_l_SE <- sqrt(t(c(helpvar3.3, helpvar3.4)) %*%
                                  solve(attributes(res)$details[[3]])[1:2, 1:2] %*%
                                  c(helpvar3.3, helpvar3.4))
            lambda_u_SE <- sqrt(diag(solve(attributes(res)$details[[3]]))[2] *
                                  helpvar3.5^2)
        }
        SE_estimates <- c(SE_estimates, phi_SE, theta_SE, tau_SE,
                          lambda_l_SE, lambda_u_SE)
        names(SE_estimates) <- c("Y1_sigma", "Y2_sigma", names_pred, "phi",
                                 "theta", "tau", "lambda_l", "lambda_u")
    }
    if (is.null(SE_estimates)){
        SE_estimates <- rep(NA, length(point_estimates))
    }
    pval <- NULL
    point_estimates <- unlist(point_estimates)
    if (pval_est & convcode == 0 & all(kkt) & !any(is.na(kkt))) {
        pval <- vector(mode = "numeric", length = (n_pred + 2))
        pval <- 2 * pnorm(as.numeric(-abs(point_estimates[3:(n_pred + 4)]/
                                            SE_estimates[3:(n_pred + 4)])))
        names(pval) <- names_pred
    }
    if (is.null(pval)){
        pval <- rep(NA, (n_pred + 2))
    }
    output <- list(point_estimates = point_estimates,
                   SE_estimates = SE_estimates,
                   pval = pval, convcode = convcode,
                   kkt = kkt, maxloglik = maxloglik)
    names(output) <- c("Parameter point estimates",
                       "Parameter standard error estimates",
                       "Parameter p-values",
                       "Convergence code of optimx function",
                       "Karush-Kuhn-Tucker conditions 1 and 2",
                       "Maximum log-likelihood")
   class(output) <- "cjamp"
   return(output)
}

## ------------------------------------------------------------------------
# Restrict example to sample size 100 to decrease running time:
predictors <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2, genodata[, 1:3])[1:100,]
cjamp_res <- cjamp(copula = "2param", Y1 = phenodata$Y1[1:100], Y2 = phenodata$Y2[1:100], 
                   predictors_Y1 = predictors, predictors_Y2 = predictors,
                   scale_var = FALSE, optim_method = "BFGS", trace = 0, 
                   kkt2tol = 1E-16, SE_est = TRUE, pval_est = TRUE, 
                   n_iter_max = 10)
cjamp_res

## ---- echo=FALSE---------------------------------------------------------
cjamp_loop <- function(copula = "Clayton", Y1 = NULL, Y2 = NULL, predictors = NULL,
                       covariates_Y1 = NULL, covariates_Y2 = NULL, scale_var = FALSE,
                       optim_method = "BFGS", trace = 0, kkt2tol = 1e-16,
                       SE_est = TRUE, pval_est = TRUE, n_iter_max = 10) {
    if (is.null(Y1) | is.null(Y2)) {
        stop("Y1 and Y2 have to be supplied.")
    }
    if (is.null(predictors)) {
        stop("At least one predictor has to be supplied.")
    }
    if (!class(predictors) == "data.frame") {
        stop("Predictors has to be a dataframe.")
    }
    if (!all(sapply(predictors, is.numeric))) {
        predictors <- as.data.frame(data.matrix(predictors))
        warning("predictors contains non-numeric Variables,
                 which have automatically been transformed.")
    }
    if ((!class(covariates_Y1) == "data.frame" & !is.null(covariates_Y1)) |
        (!class(covariates_Y2) == "data.frame" & !is.null(covariates_Y2))) {
        stop("covariates_Y1 and covariates_Y2 have to be a dataframe or NULL.")
    }
    if (class(covariates_Y1) == "data.frame") {
        if (!all(sapply(covariates_Y1, is.numeric))) {
            covariates_Y1 <- as.data.frame(data.matrix(covariates_Y1))
            warning("covariates_Y1 contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    if (class(covariates_Y2) == "data.frame") {
        if (!all(sapply(covariates_Y2, is.numeric))) {
            covariates_Y2 <- as.data.frame(data.matrix(covariates_Y2))
            warning("covariates_Y2 contains non-numeric Variables,
                     which have automatically been transformed.")
        }
    }
    N <- dim(predictors)[2]
    Y1_point_estimates <- Y1_SE_estimates <- Y1_pval <- NULL
    Y2_point_estimates <- Y2_SE_estimates <- Y2_pval <- NULL
    convcode <- kkt <- maxloglik <- NULL
    for (i in 1:N) {
         names_pred_i <- names(predictors)[i]
         predictors_Y1 <- predictors_Y2 <- predictors[, i, drop = FALSE]
         if (!is.null(covariates_Y1)) {
             predictors_Y1 <- cbind(predictors_Y1, as.data.frame(covariates_Y1))
         }
         if (!is.null(covariates_Y2)) {
             predictors_Y2 <- cbind(predictors_Y2, as.data.frame(covariates_Y2))
         }
         n_pred_Y1 <- dim(predictors_Y1)[2]
         n_pred_Y2 <- dim(predictors_Y2)[2]
         results <- cjamp(Y1 = Y1, Y2 = Y2, predictors_Y1 = predictors_Y1,
                          predictors_Y2 = predictors_Y2, scale_var = scale_var,
                          copula = copula, optim_method = optim_method,
                          trace = trace, kkt2tol = kkt2tol, SE_est = SE_est,
                          pval_est = pval_est, n_iter_max = n_iter_max)
         Y1_point_estimates[i] <- as.numeric(results[[1]][4])
         Y2_point_estimates[i] <- as.numeric(results[[1]][5 + n_pred_Y1])
         Y1_SE_estimates[i] <- results[[2]][4]
         Y2_SE_estimates[i] <- results[[2]][5 + n_pred_Y1]
         Y1_pval[i] <- results[[3]][2]
         Y2_pval[i] <- results[[3]][3 + n_pred_Y1]
         names(Y1_point_estimates)[i] <- names(Y2_point_estimates)[i] <- names_pred_i
         names(Y1_SE_estimates)[i] <- names(Y2_SE_estimates)[i] <- names_pred_i
         names(Y1_pval)[i] <- names(Y2_pval)[i] <- names_pred_i
         convcode[i] <- results[[4]]
         kkt[i] <- all(results[[5]])
         maxloglik[i] <- results[[6]]
    }
    output <- list(Y1_point_estimates = Y1_point_estimates,
                   Y2_point_estimates = Y2_point_estimates,
                   Y1_SE_estimates = Y1_SE_estimates,
                   Y2_SE_estimates = Y2_SE_estimates,
                   Y1_pval = Y1_pval, Y2_pval = Y2_pval,
                   convcode = convcode, kkt = kkt,
                   maxloglik = maxloglik)
    names(output) <- c("Parameter point estimates for effects of predictors on Y1",
                       "Parameter point estimates for effects of predictors on Y2",
                       "Parameter standard error estimates for effects on Y1",
                       "Parameter standard error estimates for effects on Y2",
                       "Parameter p-values for effects of predictors on Y1",
                       "Parameter p-values for effects of predictors on Y2",
                       "Convergence code of optimx function",
                       "Karush-Kuhn-Tucker conditions 1 and 2",
                       "Maximum log-likelihood")
    class(output) <- "cjamp"
    return(output)
}

## ------------------------------------------------------------------------
# Restrict example to sample size 100 to decrease running time:
covariates <- data.frame(X1 = phenodata$X1, X2 = phenodata$X2)[1:100,]
predictors <- genodata[1:100,1:5]
cjamp_loop_res <- cjamp_loop(copula = "Clayton", Y1 = phenodata$Y1[1:100], 
                             Y2 = phenodata$Y2[1:100], predictors = predictors, 
                             covariates_Y1 = covariates, covariates_Y2 = covariates, 
                             scale_var = FALSE, optim_method = "BFGS", trace = 0, 
                             kkt2tol = 1E-16, SE_est = TRUE, pval_est = TRUE, 
                             n_iter_max = 10)
cjamp_loop_res

## ---- echo=FALSE---------------------------------------------------------
summary.cjamp <- function(results = NULL) {
    if (is.null(results) | !class(results)=="cjamp") {
        stop("cjamp object has to be supplied.")
    }
    # for input from cjamp function:
    if ("Parameter point estimates" %in% names(results)) {
        length_res <- length(results$"Parameter p-values")
        res_out <- data.frame(point_estimates = results$"Parameter point estimates"[3:(length_res+2)],
                              SE_estimates = results$"Parameter standard error estimates"[3:(length_res+2)],
                              pvalues = results$"Parameter p-values")
        print(paste("C-JAMP estimates of marginal parameters."))
        print(res_out)
    }
    # for input from cjamp_loop function:
    if ("Parameter p-values for effects of predictors on Y1" %in% names(results)) {
        res_out_1 <- data.frame(point_estimates = results$"Parameter point estimates for effects of predictors on Y1",
                                SE_estimates = results$"Parameter standard error estimates for effects on Y1",
                                pvalues = results$"Parameter p-values for effects of predictors on Y1")
        rownames(res_out_1) <- paste("Y1", rownames(res_out_1), sep = "_")
        print(paste("C-JAMP estimates of marginal parameters on Y1."))
        print(res_out_1)
        res_out_2 <- data.frame(point_estimates = results$"Parameter point estimates for effects of predictors on Y2",
                                SE_estimates = results$"Parameter standard error estimates for effects on Y2",
                                pvalues = results$"Parameter p-values for effects of predictors on Y2")
        rownames(res_out_2) <- paste("Y2", rownames(res_out_2), sep = "_")
        print(paste("C-JAMP estimates of marginal parameters on Y2."))
        print(res_out_2)
        res_out <- data.frame(rbind(res_out_1, res_out_2))
    }
    invisible(res_out)
}

## ------------------------------------------------------------------------
# Summary of regular cjamp function
summary(cjamp_res)
# Summary of looped cjamp function
summary(cjamp_loop_res)

