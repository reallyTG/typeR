### R code from vignette source 'lmSubsets.Rnw'

###################################################
### code chunk number 1: preamble
###################################################
options(width = 70, prompt = "R> ", continue = "+  ")
library("lmSubsets")
data("AirPollution", package = "lmSubsets")


###################################################
### code chunk number 2: data-init
###################################################
data("IbkTemperature", package = "lmSubsets")
IbkTemperature <- na.omit(IbkTemperature)


###################################################
### code chunk number 3: mos0-def
###################################################
MOS0 <- lm(temp ~ t2m + time + sin + cos + sin2 + cos2,
  data = IbkTemperature)


###################################################
### code chunk number 4: mos1-def
###################################################
MOS1_best <- lmSelect(temp ~ ., data = IbkTemperature,
  include = c("t2m", "time", "sin", "cos", "sin2", "cos2"),
  penalty = "BIC", nbest = 20)
MOS1 <- refit(MOS1_best)


###################################################
### code chunk number 5: mos2-def
###################################################
MOS2_all <- lmSubsets(temp ~ ., data = IbkTemperature)
MOS2 <- refit(lmSelect(MOS2_all, penalty = "BIC"))


###################################################
### code chunk number 6: mos-stats
###################################################
sum0 <- summary(MOS0)
sum1 <- summary(MOS1)
sum2 <- summary(MOS2)

xnms0 <- rownames(sum0$coefficients)
xnms1 <- rownames(sum1$coefficients)
xnms2 <- rownames(sum2$coefficients)

xnms <- unique(c(xnms0, xnms1, xnms2))

symb <- c("***", "**", "*", ".", "")
cpts <- c(0, 0.001, 0.01, 0.05, 0.1, 1)

sgnf0 <- symnum(unname(sum0$coefficients[, 4]), corr = FALSE, na = FALSE,
                cutpoints = cpts, symbols = symb)
sgnf1 <- symnum(unname(sum1$coefficients[, 4]), corr = FALSE, na = FALSE,
                cutpoints = cpts, symbols = symb)
sgnf2 <- symnum(unname(sum2$coefficients[, 4]), corr = FALSE, na = FALSE,
                cutpoints = cpts, symbols = symb)

sgnf_tab <- matrix("", nrow = length(xnms), ncol = 3)
rownames(sgnf_tab) <- xnms

sgnf_tab[xnms0, 1] <- sgnf0
sgnf_tab[xnms1, 2] <- sgnf1
sgnf_tab[xnms2, 3] <- sgnf2

coef0 <- unname(sum0$coefficients[, 1])
coef1 <- unname(sum1$coefficients[, 1])
coef2 <- unname(sum2$coefficients[, 1])

coef0 <- formatC(coef0, format = "f", digits = 3)
coef1 <- formatC(coef1, format = "f", digits = 3)
coef2 <- formatC(coef2, format = "f", digits = 3)

coef_tab <- matrix("", nrow = length(xnms), ncol = 3)
rownames(coef_tab) <- xnms

coef_tab[xnms0, 1] <- coef0
coef_tab[xnms1, 2] <- coef1
coef_tab[xnms2, 3] <- coef2

stde0 <- unname(sum0$coefficients[, 2])
stde1 <- unname(sum1$coefficients[, 2])
stde2 <- unname(sum2$coefficients[, 2])

stde0 <- formatC(stde0, format = "f", digits = 3)
stde1 <- formatC(stde1, format = "f", digits = 3)
stde2 <- formatC(stde2, format = "f", digits = 3)


stde0 <- paste0("(", format(stde0, justify = "right"), ")")
stde1 <- paste0("(", format(stde1, justify = "right"), ")")
stde2 <- paste0("(", format(stde2, justify = "right"), ")")

stde_tab <- matrix("", nrow = length(xnms), ncol = 3)
rownames(stde_tab) <- xnms

stde_tab[xnms0, 1] <- stde0
stde_tab[xnms1, 2] <- stde1
stde_tab[xnms2, 3] <- stde2

stde_tab <- gsub("\\s", "~", stde_tab)

stat_tab <- matrix(NA, nrow = 5, ncol = 3)
rownames(stat_tab) <- c("AIC", "BIC", "RSS", "Sigma", "R-sq.")

stat_tab["AIC", 1] <- AIC(MOS0)
stat_tab["BIC", 1] <- BIC(MOS0)
stat_tab["RSS", 1] <- deviance(MOS0)
stat_tab["Sigma", 1] <- sum0$sigma
stat_tab["R-sq.", 1] <- sum0$r.squared

stat_tab["AIC", 2] <- AIC(MOS1)
stat_tab["BIC", 2] <- BIC(MOS1)
stat_tab["RSS", 2] <- deviance(MOS1)
stat_tab["Sigma", 2] <- sum1$sigma
stat_tab["R-sq.", 2] <- sum1$r.squared

stat_tab["AIC", 3] <- AIC(MOS2)
stat_tab["BIC", 3] <- BIC(MOS2)
stat_tab["RSS", 3] <- deviance(MOS2)
stat_tab["Sigma", 3] <- sum2$sigma
stat_tab["R-sq.", 3] <- sum2$r.squared

stat_tab <- formatC(stat_tab, format = "f", digits = 3)


###################################################
### code chunk number 7: mos-stats-tex-coefs
###################################################
for (nm in xnms) {
    cat(nm, " & ", coef_tab[nm, 1], " & ", sgnf_tab[nm, 1], " & ", stde_tab[nm, 1],
            " & ", coef_tab[nm, 2], " & ", sgnf_tab[nm, 2], " & ", stde_tab[nm, 2],
            " & ", coef_tab[nm, 3], " & ", sgnf_tab[nm, 3], " & ", stde_tab[nm, 3],
        "\\\\", "\n", sep = "")
}


###################################################
### code chunk number 8: mos-stats-tex
###################################################
for (nm in rownames(stat_tab)) {
    cat(nm, " & ", stat_tab[nm, 1], " & ", " & ",
            " & ", stat_tab[nm, 2], " & ", " & ",
            " & ", stat_tab[nm, 3], " & ", " & ",
        "\\\\", "\n")
}


###################################################
### code chunk number 9: mos1-echo
###################################################
MOS1_best <- lmSelect(temp ~ ., data = IbkTemperature,
  include = c("t2m", "time", "sin", "cos", "sin2", "cos2"),
  penalty = "BIC", nbest = 20)
MOS1 <- refit(MOS1_best)


###################################################
### code chunk number 10: mos1-best-image
###################################################
image(MOS1_best, hilite = 1, lab_hilite = "bold(lab)", pad_size = 2,
  pad_which = 2)


###################################################
### code chunk number 11: mos2-all-image
###################################################
image(MOS2_all, size = 8:27, hilite = 1, hilite_penalty = "BIC",
      lab_hilite = "bold(lab)", pad_size = 2, pad_which = 2)


###################################################
### code chunk number 12: mos1-best-plot
###################################################
plot(MOS1_best)


###################################################
### code chunk number 13: mos2-all-plot
###################################################
plot(MOS2_all, ylim_ic = c(9000, 9700))


###################################################
### code chunk number 14: mos2-echo
###################################################
MOS2_all <- lmSubsets(temp ~ ., data = IbkTemperature)
MOS2 <- refit(lmSelect(MOS2_all, penalty = "BIC"))


###################################################
### code chunk number 15: bm-01
###################################################
source("bm-01.R")

df <- report_benchmark()

goop <- lapply(split(df, with(df, SD)), function (grp) {
    sd <- grp[1, "SD"]

    grp <- with(grp, {
        SPEEDUP <- LEAPS / LM_SUBSETS
        SPEEDUP1 <- LEAPS1 / LM_SUBSETS

        cbind(SD = "", formatC(NVAR, format = "d"),
              formatC(cbind(LEAPS, LEAPS1, LM_SUBSETS),
                      format = "f", digits = 3),
              formatC(cbind(SPEEDUP, SPEEDUP1),
                      format = "f", digits = 1))
    })
    grp[1, "SD"] <- formatC(sd, format = "f", digits = 2)

    grp[, 3:5] <- paste0(grp[, 3:5], "\\,s")
    grp <- apply(grp, 1, paste0, collapse = " & ")

    cat("\\midrule\n")
    for (row in grp) {
        cat(row)
        cat("\\\\\n")
    }
})


###################################################
### code chunk number 16: bm-02
###################################################
source("bm-02.R")

df <- report_benchmark()
df <- subset(df, IC == "BIC")

goop <- lapply(split(df, with(df, SD)), function (grp) {
    sd <- grp[1, "SD"]

    grp <- with(grp, {
        SPEEDUP <- BESTGLM / LM_SELECT
        SPEEDUP1 <- BESTGLM1 / LM_SELECT

        cbind(SD = "", formatC(NVAR, format = "d"),
                 formatC(cbind(BESTGLM, BESTGLM1, LM_SELECT),
                         format = "f", digits = 3),
                 formatC(cbind(SPEEDUP, SPEEDUP1),
                         format = "f", digits = 1))
    })
    grp[1, "SD"] <- formatC(sd, format = "f", digits = 2)

    grp[, 3:5] <- paste0(grp[, 3:5], "\\,s")
    grp <- apply(grp, 1, paste0, collapse = " & ")

    cat("\\midrule\n")
    for (row in grp) {
        cat(row)
        cat("\\\\\n")
    }
})


###################################################
### code chunk number 17: bm-03
###################################################
source("bm-03.R")

df <- report_benchmark()

goop <- lapply(split(df, with(df, SD)), function (grp) {
    sd <- grp[1, "SD"]

    grp <- do.call(rbind, lapply(split(grp, with(grp, NVAR)), function (grp) {
        nvar <- grp[1, "NVAR"]
        nmin <- grp[1, "NMIN"]
        nmax <- grp[1, "NMAX"]

        c(nvar, nmin, nmax,
          with(subset(grp, TOLERANCE == 0.0),
               c(LM_SUBSETS, LM_SELECT, LM_SUBSETS / LM_SELECT)),
          with(subset(grp, TOLERANCE == 0.1),
               c(LM_SUBSETS, LM_SELECT, LM_SUBSETS / LM_SELECT)))
    }))

    grp <- cbind(SD = "", formatC(grp[, 1], format = "d"),
                 ifelse(is.na(grp[, 2:3]), "-",
                        formatC(grp[, 2:3], format = "d")),
                 formatC(grp[, 4:5], format = "f", digits = 3),
                 formatC(grp[, 6], format = "f", digits = 1),
                 formatC(grp[, 7:8], format = "f", digits = 3),
                 formatC(grp[, 9], format = "f", digits = 1))
    grp[1, "SD"] <- formatC(sd, format = "f", digits = 2)

    grp[, c(5:6, 8:9)] <- paste0(grp[, c(5:6, 8:9)], "\\,s")
    grp <- apply(grp, 1, paste0, collapse = " & ")

    cat("\\midrule\n")
    for (row in grp) {
        cat(row)
        cat("\\\\\n")
    }
})


###################################################
### code chunk number 18: bm-04
###################################################
source("bm-04.R")

df <- report_benchmark()

df <- {
    x <- unique(with(df, data.frame(NVAR, IC)))

    for (nbest in c(1, 5, 10, 15, 20)) {
        x <- merge(x, with(subset(df, NBEST == nbest), {
            z <- data.frame(NVAR, IC, LM_SELECT)
            names(z)[3] <- nbest

            z
        }))
    }

    x
}

goop <- lapply(split(df, with(df, NVAR)), function (grp) {
    nvar <- grp[1, "NVAR"]

    grp <- cbind(NVAR = "", as.character(grp[, 2]),
                 formatC(as.matrix(grp[, 3:7]), format = "f", digits = 3))
    grp[1, "NVAR"] <- formatC(nvar, format = "d")

    grp[, 3:7] <- paste0(grp[, 3:7], "\\,s")
    grp <- apply(grp, 1, paste0, collapse = " & ")

    cat("\\midrule\n")
    for (row in grp) {
        cat(row)
        cat("\\\\\n")
    }
})


###################################################
### code chunk number 19: bm-05
###################################################
source("bm-05.R")

df <- report_benchmark()

df <- {
    x <- unique(with(df, data.frame(NVAR)))

    for (ic in c(1, 2, 4, 8, 16, 32)) {
        x <- merge(x, with(subset(df, IC == ic), {
            z <- data.frame(NVAR, LM_SELECT)
            names(z)[2] <- ic

            z
        }))
    }

    x
}

grp <- cbind(formatC(df[, 1], format = "d"),
             formatC(as.matrix(df[, 2:7]), format = "f", digits = 3))

grp[, 2:7] <- paste0(grp[, 2:7], "\\,s")
grp <- apply(grp, 1, paste0, collapse = " & ")

cat("\\midrule\n")
for (row in grp) {
    cat(row)
    cat("\\\\\n")
}


###################################################
### code chunk number 20: bm-lasso
###################################################
source("bm-lasso.R")

df <- report_benchmark()

goop <- lapply(split(df, with(df, SD)), function (grp) {
    sd <- grp[1, "SD"]

    grp <- do.call(rbind, lapply(split(grp, with(grp, NVAR)), function (grp) {
        nvar <- grp[1, "NVAR"]

        with(grp, c(nvar, LMSELECT, LASSO, LMSELECT / LASSO, HITS))
    }))

    grp <- cbind(SD = "", formatC(grp[, 1], format = "d"),
                 formatC(grp[, 2:3], format = "f", digits = 3),
                 formatC(grp[, 4], format = "f", digits = 1),
                 formatC(grp[, 5], format = "f", digits = 1))
    grp[1, "SD"] <- formatC(sd, format = "f", digits = 2)

    grp[, 3:4] <- paste0(grp[, 3:4], "\\,s")

    grp <- apply(grp, 1, paste0, collapse = " & ")

    cat("\\midrule\n")
    for (row in grp) {
        cat(row)
        cat("\\\\\n")
    }
})


