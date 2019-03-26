### R code from vignette source 'lmSubsets.Rnw'

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
