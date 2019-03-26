## ---- echo = FALSE-------------------------------------------------------
#knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
knitr::opts_chunk$set(fig.width = 6, fig.height = 4.5) 

## ---- warning = FALSE, message = FALSE-----------------------------------
library("SimMultiCorrData")
library("printr")
H_stcum <- matrix(1, nrow = 4, ncol = ncol(Headrick.dist))
for (i in 1:ncol(H_params)) {
  if (is.na(H_params[2, i])) {
    params <- H_params[1, i]
  } else {
    params <- as.numeric(H_params[, i])
  }
  H_stcum[, i] <- round(calc_theory(Dist = colnames(H_params)[i], 
                                    params = params)[3:6], 10)
}
colnames(H_stcum) <- colnames(Headrick.dist)
rownames(H_stcum) <- c("skew", "skurtosis", "fifth", "sixth")
round(H_stcum[, 1:6], 5)
round(H_stcum[, 7:12], 5)
round(H_stcum[, 13:18], 5)
round(H_stcum[, 19:22], 5)

## ---- warning = FALSE, message = FALSE-----------------------------------
Six <- list(NULL, seq(1.7, 1.8, 0.01), seq(0.5, 2, 0.5), seq(25.1, 25.2, 0.01),
            seq(0.1, 0.3, 0.01), NULL, NULL, seq(0.5, 2, 0.5), 
            NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
            seq(0.01, 0.05, 0.01), seq(0.15, 0.2, 0.01), seq(0.5, 2, 0.5), 
            NULL, seq(0.5, 2, 0.5), seq(0.5, 2, 0.5))
H_consol <- list()

start.time <- Sys.time()
for (i in 1:ncol(H_stcum)) {
  skurtsH <- ifelse(colnames(H_stcum)[i] == "Triangular", -0.5856216, 
                    H_stcum[2, i])
  H_consol[[i]] <- find_constants(method = "Polynomial", skews = H_stcum[1, i],
                                  skurts = skurtsH, fifths = H_stcum[3, i],
                                  sixths = H_stcum[4, i], Six = Six[[i]])
}
stop.time <- Sys.time()
Time <- round(difftime(stop.time, start.time, units = "min"), 3)
cat("Total computation time:", Time, "minutes \n")

H_cons <- matrix(1, nrow = 7, ncol = ncol(Headrick.dist))
valid <- numeric(ncol(Headrick.dist))
for (i in 1:ncol(H_stcum)) {
  H_cons[1:6, i] <- H_consol[[i]]$constants
  H_cons[7, i] <- ifelse(is.null(H_consol[[i]]$SixCorr1), NA, 
                         H_consol[[i]]$SixCorr1)
  valid[i] <- H_consol[[i]]$valid
}
colnames(H_cons) <- colnames(Headrick.dist)
rownames(H_cons) <- c("c0", "c1", "c2", "c3", "c4", "c5", "sixcorr")

## ------------------------------------------------------------------------
colnames(H_cons)[valid == FALSE]

## ------------------------------------------------------------------------
round(H_cons[, 1:6], 6)
round(H_cons[, 7:12], 6)
round(H_cons[, 13:18], 6)
round(H_cons[, 19:22], 6)

## ---- warning = FALSE----------------------------------------------------
seed <- 1234
Rey <- matrix(c(1, 0.4, 0.4, 1), 2, 2)

# Make sure Rey is within feasible correlation bounds
valid <- valid_corr(k_cont = 2, method = "Polynomial", 
                    means = rep(0, 2), vars = rep(1, 2), 
                    skews = H_stcum[1, c("Logistic", "Laplace")], 
                    skurts = H_stcum[2, c("Logistic", "Laplace")],
                    fifths = H_stcum[3, c("Logistic", "Laplace")], 
                    sixths = H_stcum[4, c("Logistic", "Laplace")], 
                    rho = Rey, seed = seed)

A <- rcorrvar(n = 10000, k_cont = 2, method = "Polynomial", 
              means = rep(0, 2), vars = rep(1, 2), 
              skews = H_stcum[1, c("Logistic", "Laplace")], 
              skurts = H_stcum[2, c("Logistic", "Laplace")], 
              fifths = H_stcum[3, c("Logistic", "Laplace")], 
              sixths = H_stcum[4, c("Logistic", "Laplace")], 
              rho = Rey, seed = seed)

## ------------------------------------------------------------------------
cat(paste("The maximum correlation error is ", round(A$maxerr, 5), ".", 
          sep = ""))

## ------------------------------------------------------------------------
Acorr_error = round(A$correlations - Rey, 6)
cat(paste("The IQR of correlation errors is [", 
          round(quantile(as.numeric(Acorr_error), 0.25), 5), ", ",
          round(quantile(as.numeric(Acorr_error), 0.75), 5), "].", sep = ""))

## ---- warning = FALSE----------------------------------------------------
Six <- list(H_cons["sixcorr", "Logistic"], H_cons["sixcorr", "Laplace"])

# Make sure Rey is within feasible correlation bounds
valid2 <- valid_corr(k_cont = 2, method = "Polynomial", 
                     means = rep(0, 2), vars = rep(1, 2), 
                     skews = H_stcum[1, c("Logistic", "Laplace")], 
                     skurts = H_stcum[2, c("Logistic", "Laplace")],
                     fifths = H_stcum[3, c("Logistic", "Laplace")], 
                     sixths = H_stcum[4, c("Logistic", "Laplace")], 
                     Six = Six, rho = Rey, seed = seed)

B <- rcorrvar(n = 10000, k_cont = 2, method = "Polynomial", 
              means = rep(0, 2), vars = rep(1, 2), 
              skews = H_stcum[1, c("Logistic", "Laplace")], 
              skurts = H_stcum[2, c("Logistic", "Laplace")], 
              fifths = H_stcum[3, c("Logistic", "Laplace")], 
              sixths = H_stcum[4, c("Logistic", "Laplace")], Six = Six, 
              rho = Rey, seed = seed)

## ------------------------------------------------------------------------
cat(paste("The maximum correlation error is ", round(B$maxerr, 5), ".", 
          sep = ""))

## ------------------------------------------------------------------------
Bcorr_error = round(B$correlations - Rey, 6)
cat(paste("The IQR of correlation errors is [", 
          round(quantile(as.numeric(Bcorr_error), 0.25), 5), ", ",
          round(quantile(as.numeric(Bcorr_error), 0.75), 5), "].", sep = ""))

## ------------------------------------------------------------------------
as.matrix(round(A$summary_targetcont, 5), nrow = 2, ncol = 7, byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(A$summary_continuous[, c("Distribution", "mean", "sd", "skew", 
                               "skurtosis", "fifth", "sixth")], 5), nrow = 2, 
          ncol = 7, byrow = TRUE)
A$valid.pdf

## ------------------------------------------------------------------------
as.matrix(round(B$summary_continuous[, c("Distribution", "mean", "sd", "skew", 
                               "skurtosis", "fifth", "sixth")], 5), nrow = 2,
          ncol = 7, byrow = TRUE)
B$valid.pdf

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(sim_y = A$continuous_variables[, 1], 
                    title = "Logistic Pdf", Dist = "Logistic", 
                    params = H_params$Logistic)
plot_sim_pdf_theory(sim_y = B$continuous_variables[, 1], 
                    title = "Corrected Logistic Pdf", Dist = "Logistic", 
                    params = H_params$Logistic)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(sim_y = A$continuous_variables[, 2], 
                    title = "Laplace Pdf", Dist = "Laplace", 
                    params = H_params$Laplace)
plot_sim_pdf_theory(sim_y = B$continuous_variables[, 2], 
                    title = "Corrected Laplace Pdf", Dist = "Laplace", 
                    params = H_params$Laplace)

