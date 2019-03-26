## ----setup, include=FALSE, cache=FALSE-----------------------------------
require(knitr)
opts_chunk$set(size = "small", tidy = TRUE, comment = "")
knit_theme$set("print")

## ----eval=FALSE----------------------------------------------------------
#  # Import the data set
#  library(haven)
#  library(data.table)
#  cudata <- read_dta("appl/dataaxj1.dta")
#  cudata <- as.data.table(cudata)
#  
#  # Subsetting relevant variables
#  var.nms <- c("exp1to2", "custrict11", "ldist", "comlang", "border", "regional",
#               "comcol", "curcol", "colony", "comctry", "cuwoemu", "emu", "cuc",
#               "cty1", "cty2", "year", "pairid")
#  cudata <- cudata[, ..var.nms]
#  
#  # Generate identifiers required for structural gravity
#  cudata[, pairid := factor(pairid)]
#  cudata[, exp.time := interaction(cty1, year)]
#  cudata[, imp.time := interaction(cty2, year)]
#  
#  # Generate dummies for disaggregated currency unions
#  cudata[, cuau := as.integer(cuc == "au")]
#  cudata[, cube := as.integer(cuc == "be")]
#  cudata[, cuca := as.integer(cuc == "ca")]
#  cudata[, cucf := as.integer(cuc == "cf")]
#  cudata[, cucp := as.integer(cuc == "cp")]
#  cudata[, cudk := as.integer(cuc == "dk")]
#  cudata[, cuea := as.integer(cuc == "ea")]
#  cudata[, cuec := as.integer(cuc == "ec")]
#  cudata[, cuem := as.integer(cuc == "em")]
#  cudata[, cufr := as.integer(cuc == "fr")]
#  cudata[, cugb := as.integer(cuc == "gb")]
#  cudata[, cuin := as.integer(cuc == "in")]
#  cudata[, cuma := as.integer(cuc == "ma")]
#  cudata[, cuml := as.integer(cuc == "ml")]
#  cudata[, cunc := as.integer(cuc == "nc")]
#  cudata[, cunz := as.integer(cuc == "nz")]
#  cudata[, cupk := as.integer(cuc == "pk")]
#  cudata[, cupt := as.integer(cuc == "pt")]
#  cudata[, cusa := as.integer(cuc == "sa")]
#  cudata[, cusp := as.integer(cuc == "sp")]
#  cudata[, cuua := as.integer(cuc == "ua")]
#  cudata[, cuus := as.integer(cuc == "us")]
#  cudata[, cuwa := as.integer(cuc == "wa")]
#  cudata[, cuwoo := custrict11]
#  cudata[cuc %in% c("em", "au", "cf", "ec", "fr", "gb", "in", "us"), cuwoo := 0L]
#  
#  # Set missing trade flows to zero
#  cudata[is.na(exp1to2), exp1to2 := 0.0]
#  
#  # Generate lead and lags of any currency union entry and exit
#  setkey(cudata, pairid, year)
#  cudata[, lcu11 := shift(custrict11), by = pairid]
#  cudata[, tranex := as.integer(!is.na(lcu11) & custrict11 - lcu11 == - 1.0)]
#  cudata[, tranen := as.integer(!is.na(lcu11) & custrict11 - lcu11 == 1.0)]
#  for (i in seq(14L)) {
#    cudata[, paste0("acuex", i) := shift(tranex, i, 0L, "lag"), by = pairid]
#    cudata[, paste0("acuen", i) := shift(tranen, i, 0L, "lag"), by = pairid]
#    cudata[, paste0("bcuex", i) := shift(tranex, i, 0L, "lead"), by = pairid]
#    cudata[, paste0("bcuen", i) := shift(tranen, i, 0L, "lead"), by = pairid]
#  }
#  
#  # Generate lead and lags for EMU entry
#  cudata[, lemu := shift(emu), by = pairid]
#  cudata[, tranemuen := as.integer(!is.na(lemu) & emu - lemu == 1.0 & comctry == 0.0)]
#  # Guadeloupe, French Guiana, Reunion, and Martinique
#  cudata[pairid == shift(pairid) & custrict11 == 1L & lcu11 == 1L & comctry == 0.0 & tranemuen != 0L,
#         tranemuen := 0L]
#  for (i in seq(14L)) {
#    cudata[, paste0("aemuen", i) := shift(tranemuen, i, 0L, "lag"), by = pairid]
#    cudata[, paste0("bemuen", i) := shift(tranemuen, i, 0L, "lead"), by = pairid]
#  }
#  
#  # Generate lead and lags for non-EMU entry
#  cudata[, trannoeen := as.integer(!is.na(lcu11) & custrict11 - lcu11 == 1.0)]
#  cudata[tranemuen == 1L, trannoeen := 0L]
#  for (i in seq(14L)) {
#    cudata[, paste0("anoeen", i) := shift(trannoeen, i, 0L, "lag"), by = pairid]
#    cudata[, paste0("bnoeen", i) := shift(trannoeen, i, 0L, "lead"), by = pairid]
#  }
#  
#  # Remove auxiliary variables
#  cudata[, c("lemu", "lcu11") := NULL]

## ----eval=FALSE----------------------------------------------------------
#  # Three fixed effects categories (exporter x year, importer x year, dyadic)
#  # Disaggregated Currency Unions
#  formula <- exp1to2 ~ emu + cuwoo + cuau + cucf + cuec + cufr + cugb + cuin + cuus +
#    regional + curcol | exp.time + imp.time + pairid
#  mod <- feglm(formula, cudata[exp1to2 > 0.0], family = poisson())
#  
#  # Summarize estimates (standard errors clustered by distance)
#  summary(mod, "clustered", "pairid")

## ----eval=FALSE----------------------------------------------------------
#  # Wald-test
#  wald.test <- function(R, theta, q, V) {
#    V.wald <- R %*% V %*% t(R)
#    lr <- R %*% theta - q
#    W <- as.double(t(lr) %*% solve(V.wald) %*% lr)
#    list(W = W, p.value = 1.0 - pchisq(W, nrow(R)))
#  }
#  
#  # Three fixed effects categories (exporter x year, importer x year, dyadic)
#  # Any CU
#  formula1.3way <- as.formula(paste0("exp1to2~",
#                                     paste0("bcuen", seq(14L), collapse = "+"), "+tranen+",
#                                     paste0("acuen", seq(14L), collapse = "+"), "+",
#                                     paste0("bcuex", seq(14L), collapse = "+"), "+tranex+",
#                                     paste0("acuex", seq(14L), collapse = "+"),
#                                     "+regional+curcol|exp.time+imp.time+pairid"))
#  mod <- feglm(formula1.3way, cudata[exp1to2 > 0.0], family = poisson())
#  theta1.3way <- coef(mod)
#  V1.3way <- vcov(mod, "clustered", cluster.vars = "pairid")
#  rm(mod)
#  
#  # After any CU Entry = - After any CU Exit?
#  R1.3way <- matrix(0.0, 14L, length(theta1.3way))
#  colnames(R1.3way) <- names(theta1.3way)
#  R1.3way[, "tranen"] <- - 1.0
#  R1.3way[, "tranex"] <- - 1.0
#  for (i in seq(14L)) {
#    R1.3way[i, paste0("acuen", i)] <- 1.0
#    R1.3way[i, paste0("acuex", i)] <- 1.0
#  }
#  q1.3way <- numeric(nrow(R1.3way))
#  w1.3way <- wald.test(R1.3way, theta1.3way, q1.3way, V1.3way)
#  
#  # Before any CU Entry = - Before any CU Exit?
#  R2.3way <- matrix(0.0, 14L, length(theta1.3way))
#  colnames(R2.3way) <- names(theta1.3way)
#  R2.3way[, "tranen"] <- - 1.0
#  R2.3way[, "tranex"] <- - 1.0
#  for (i in seq(14L)) {
#    R2.3way[i, paste0("bcuen", i)] <- 1.0
#    R2.3way[i, paste0("bcuex", i)] <- 1.0
#  }
#  q2.3way <- numeric(nrow(R2.3way))
#  w2.3way <- wald.test(R2.3way, theta1.3way, q2.3way, V1.3way)
#  
#  # Both (any CU)
#  R3.3way <- rbind(R1.3way, R2.3way)
#  q3.3way <- numeric(nrow(R3.3way))
#  w3.3way <- wald.test(R3.3way, theta1.3way, q3.3way, V1.3way)
#  
#  # EMU entry
#  formula2.3way <- as.formula(paste0("exp1to2~",
#                                     paste0("bnoeen", seq(14L), collapse = "+"), "+trannoeen+",
#                                     paste0("anoeen", seq(14L), collapse = "+"), "+",
#                                     paste0("bcuex", seq(14L), collapse = "+"), "+tranex+",
#                                     paste0("acuex", seq(14L), collapse = "+"), "+",
#                                     paste0("bemuen", seq(14L), collapse = "+"), "+tranemuen+",
#                                     paste0("aemuen", seq(14L), collapse = "+"), "+",
#                                     "+regional+curcol|exp.time+imp.time+pairid"))
#  mod <- feglm(formula2.3way, cudata[exp1to2 > 0.0], family = poisson())
#  theta2.3way <- coef(mod)
#  V2.3way <- vcov(mod, "clustered", cluster.vars = "pairid")
#  rm(mod)
#  
#  # After non-EMU CU Entry = After EMU Entry?
#  R4.3way <- matrix(0.0, 14L, length(theta2.3way))
#  colnames(R4.3way) <- names(theta2.3way)
#  R4.3way[, "trannoeen"] <- - 1.0
#  R4.3way[, "tranemuen"] <- - 1.0
#  for (i in seq(14L)) {
#    R4.3way[i, paste0("anoeen", i)] <- 1.0
#    R4.3way[i, paste0("aemuen", i)] <- 1.0
#  }
#  q4.3way <- numeric(nrow(R4.3way))
#  w4.3way <- wald.test(R4.3way, theta2.3way, q4.3way, V2.3way)
#  
#  # Before non-EMU CU Entry = Before EMU Entry?
#  R5.3way <- matrix(0.0, 14L, length(theta2.3way))
#  colnames(R5.3way) <- names(theta2.3way)
#  R5.3way[, "trannoeen"] <- - 1.0
#  R5.3way[, "tranemuen"] <- - 1.0
#  for (i in seq(14L)) {
#    R5.3way[i, paste0("bnoeen", i)] <- 1.0
#    R5.3way[i, paste0("bemuen", i)] <- 1.0
#  }
#  q5.3way <- numeric(nrow(R5.3way))
#  w5.3way <- wald.test(R5.3way, theta2.3way, q5.3way, V2.3way)
#  
#  # Both (EMU Entry)
#  R6.3way <- rbind(R4.3way, R5.3way)
#  q6.3way <- numeric(nrow(R6.3way))
#  w6.3way <- wald.test(R6.3way, theta2.3way, q6.3way, V2.3way)
#  
#  # After non-EMU CU Exit = - After EMU Entry
#  R7.3way <- matrix(0.0, 14L, length(theta2.3way))
#  colnames(R7.3way) <- names(theta2.3way)
#  R7.3way[, "tranex"] <- - 1.0
#  R7.3way[, "tranemuen"] <- - 1.0
#  for (i in seq(14L)) {
#    R7.3way[i, paste0("acuex", i)] <- 1.0
#    R7.3way[i, paste0("aemuen", i)] <- 1.0
#  }
#  q7.3way <- numeric(nrow(R7.3way))
#  w7.3way <- wald.test(R7.3way, theta2.3way, q7.3way, V2.3way)
#  
#  # Display test results
#  W <- round(c(w1.3way$W, w2.3way$W, w3.3way$W,
#               w4.3way$W, w5.3way$W, w6.3way$W,
#               w7.3way$W), 1L)
#  P <- round(c(w1.3way$p.value, w2.3way$p.value, w3.3way$p.value,
#               w4.3way$p.value, w5.3way$p.value, w6.3way$p.value,
#               w7.3way$p.value), 1L)
#  cbind(W, P)

