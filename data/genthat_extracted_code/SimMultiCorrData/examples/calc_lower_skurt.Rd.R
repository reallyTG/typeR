library(SimMultiCorrData)


### Name: calc_lower_skurt
### Title: Find Lower Boundary of Standardized Kurtosis for Polynomial
###   Transformation
### Aliases: calc_lower_skurt
### Keywords: Fleishman, Headrick boundary, kurtosis,

### ** Examples


# Normal distribution with Fleishman transformation
calc_lower_skurt("Fleishman", 0, 0, 0)

## Not run: 
##D 
##D # This example takes considerable computation time.
##D 
##D # Reproduce Headrick's Table 2 (2002, p.698): note the seed here is 104.
##D # If you use seed = 1234, you get higher Headrick kurtosis values for V7 and V9.
##D # This shows the importance of trying different seeds.
##D 
##D options(scipen = 999)
##D 
##D V1 <- c(0, 0, 28.5)
##D V2 <- c(0.24, -1, 11)
##D V3 <- c(0.48, -2, 6.25)
##D V4 <- c(0.72, -2.5, 2.5)
##D V5 <- c(0.96, -2.25, -0.25)
##D V6 <- c(1.20, -1.20, -3.08)
##D V7 <- c(1.44, 0.40, 6)
##D V8 <- c(1.68, 2.38, 6)
##D V9 <- c(1.92, 11, 195)
##D V10 <- c(2.16, 10, 37)
##D V11 <- c(2.40, 15, 200)
##D 
##D G <- as.data.frame(rbind(V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11))
##D colnames(G) <- c("g1", "g3", "g4")
##D 
##D # kurtosis correction vector (used in case of invalid power method pdf constants)
##D Skurt <- seq(0.01, 2, 0.01)
##D 
##D # sixth cumulant correction vector (used in case of no converged solutions for
##D # method = "Polynomial")
##D Six <- seq(0.1, 10, 0.1)
##D 
##D # Fleishman's Third-order transformation
##D F_lower <- list()
##D for (i in 1:nrow(G)) {
##D   F_lower[[i]] <- calc_lower_skurt("Fleishman", G[i, 1], Skurt = Skurt,
##D                                    seed = 104)
##D }
##D 
##D # Headrick's Fifth-order transformation
##D H_lower <- list()
##D for (i in 1:nrow(G)) {
##D   H_lower[[i]] <- calc_lower_skurt("Polynomial", G[i, 1], G[i, 2], G[i, 3],
##D                                    Skurt = Skurt, Six = Six, seed = 104)
##D }
##D 
##D # Approximate boundary from PoisBinOrdNonNor
##D PBON_lower <- G$g1^2 - 2
##D 
##D # Compare results:
##D # Note: 1) the lower Headrick kurtosis boundary for V4 is slightly lower than the
##D #          value found by Headrick (-0.480129), and
##D #       2) the approximate lower kurtosis boundaries used in PoisBinOrdNonNor are
##D #          much lower than the actual Fleishman boundaries, indicating that the
##D #          guideline is not accurate.
##D Lower <- matrix(1, nrow = nrow(G), ncol = 12)
##D colnames(Lower) <- c("skew", "fifth", "sixth", "H_valid.skurt",
##D                      "F_valid.skurt", "H_invalid.skurt", "F_invalid.skurt",
##D                      "PBON_skurt", "H_skurt_corr", "F_skurt_corr",
##D                      "H_time", "F_time")
##D 
##D for (i in 1:nrow(G)) {
##D   Lower[i, 1:3] <- as.numeric(G[i, 1:3])
##D   Lower[i, 4] <- ifelse(H_lower[[i]]$Min[1, "valid.pdf"] == "TRUE",
##D                         H_lower[[i]]$Min[1, "skurtosis"], NA)
##D   Lower[i, 5] <- ifelse(F_lower[[i]]$Min[1, "valid.pdf"] == "TRUE",
##D                         F_lower[[i]]$Min[1, "skurtosis"], NA)
##D   Lower[i, 6] <- min(H_lower[[i]]$Invalid.C[, "skurtosis"])
##D   Lower[i, 7] <- min(F_lower[[i]]$Invalid.C[, "skurtosis"])
##D   Lower[i, 8:12] <- c(PBON_lower[i], H_lower[[i]]$SkurtCorr1,
##D                       F_lower[[i]]$SkurtCorr1,
##D                       H_lower[[i]]$Time, F_lower[[i]]$Time)
##D }
##D Lower <- as.data.frame(Lower)
##D print(Lower[, 1:8], digits = 4)
##D 
##D #    skew fifth  sixth H_valid.skurt F_valid.skurt H_invalid.skurt F_invalid.skurt PBON_skurt
##D # 1  0.00  0.00  28.50       -1.0551      0.008677         -1.3851         -1.1513    -2.0000
##D # 2  0.24 -1.00  11.00       -0.8600      0.096715         -1.2100         -1.0533    -1.9424
##D # 3  0.48 -2.00   6.25       -0.5766      0.367177         -0.9266         -0.7728    -1.7696
##D # 4  0.72 -2.50   2.50       -0.1319      0.808779         -0.4819         -0.3212    -1.4816
##D # 5  0.96 -2.25  -0.25        0.4934      1.443567          0.1334          0.3036    -1.0784
##D # 6  1.20 -1.20  -3.08        1.2575      2.256908          0.9075          1.1069    -0.5600
##D # 7  1.44  0.40   6.00            NA      3.264374          1.7758          2.0944     0.0736
##D # 8  1.68  2.38   6.00            NA      4.452011          2.7624          3.2720     0.8224
##D # 9  1.92 11.00 195.00        5.7229      5.837442          4.1729          4.6474     1.6864
##D # 10 2.16 10.00  37.00            NA      7.411697          5.1993          6.2317     2.6656
##D # 11 2.40 15.00 200.00            NA      9.182819          6.6066          8.0428     3.7600
##D 
##D Lower[, 9:12]
##D 
##D #    H_skurt_corr F_skurt_corr H_time F_time
##D # 1          0.33         1.16  1.757  8.227
##D # 2          0.35         1.15  1.566  8.164
##D # 3          0.35         1.14  1.630  6.321
##D # 4          0.35         1.13  1.537  5.568
##D # 5          0.36         1.14  1.558  5.540
##D # 6          0.35         1.15  1.602  6.619
##D # 7          2.00         1.17  9.088  8.835
##D # 8          2.00         1.18  9.425 11.103
##D # 9          1.55         1.19  6.776 14.364
##D # 10         2.00         1.18 11.174 15.382
##D # 11         2.00         1.14 10.567 18.184
##D 
##D # The 1st 3 columns give the skewness and standardized fifth and sixth cumulants.
##D # "H_valid.skurt" gives the lower kurtosis boundary that produces a valid power method pdf
##D #     using Headrick's approximation, with the kurtosis addition given in the "H_skurt_corr"
##D #     column if necessary.
##D # "F_valid.skurt" gives the lower kurtosis boundary that produces a valid power method pdf
##D #     using Fleishman's approximation, with the kurtosis addition given in the "F_skurt_corr"
##D #     column if necessary.
##D # "H_invalid.skurt" gives the lower kurtosis boundary that produces an invalid power method
##D #     pdf using Headrick's approximation, without the use of a kurtosis correction.
##D # "F_valid.skurt" gives the lower kurtosis boundary that produces an invalid power method
##D #     pdf using Fleishman's approximation, without the use of a kurtosis correction.
##D # "PBON_skurt" gives the lower kurtosis boundary approximation used in the PoisBinOrdNonNor
##D #     package.
##D # "H_time" gives the computation time (minutes) for Headrick's method.
##D # "F_time" gives the computation time (minutes) for Fleishman's method.
##D 
## End(Not run)



