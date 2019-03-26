library(daewr)


### Name: Gaptest
### Title: This function uses Daniel's Method to find an outlier in an
###   unreplicated 2^{(k-p)} design.
### Aliases: Gaptest
### Keywords: htest

### ** Examples

# Example from Box(1991)
data(BoxM)
Gaptest(BoxM)


## The function is currently defined as
function (DesY) 
{
    ncheck <- dim(DesY)
    ncheck <- ncheck[1]
    tcnd = TRUE
    if (ncheck == 8) {
        tcnd = FALSE
    }
    if (ncheck == 16) {
        tcnd = FALSE
    }
    if (ncheck == 32) {
        tcnd = FALSE
    }
    if (tcnd) {
        stop("This function only works for 8, 16, or 32 run designs", 
            "\n")
    }
    else {
        if (ncheck == 8) 
            ncheck = 16
        critg16 <- c(1.7884, 5.1009)
        critg32 <- c(1.7297, 5.8758)
        modf <- lm(y ~ (.)^4, x = TRUE, data = DesY)
        nbeta <- dim(DesY)
        nbeta <- nbeta[1]
        he <- modf$coef
        selcol <- which(!is.na(he))
        he <- he[selcol]
        he <- he[-1]
        p <- length(he)
        n <- p + 1
        cn1 <- names(he)
        ccn1 <- gsub("[^A-Z]", "", cn1)
        names(he) <- ccn1
        ahe <- abs(he)
        s0 <- 1.5 * median(ahe)
        selhe <- ahe < (2.5 * s0)
        pse = 1.5 * median(ahe[selhe])
        gap <- gapstat(he, pse)
        if (ncheck == 16) {
            test = (gap > critg16[1])
        }
        else {
            test = (gap > critg32[1])
        }
        if (test) {
            X <- modf$x
            X <- X[, selcol]
            X <- X[, -1]
            se <- as.matrix(sign(he), nrow = 1)
            sigef <- LGB(he, rpt = FALSE, plt = FALSE)
            for (i in 1:length(he)) {
                if (sigef[i] == "yes") {
                  se[i] = 0
                }
            }
            sp <- X %*% se
            asp <- abs(sp)
            oo <- max.col(t(asp))
            ae <- abs(he)
            sae <- sort(ae)
            nsmall <- round(length(he)/2)
            bias <- 2 * sum(sae[1:nsmall])
            y <- DesY$y
            ycorr <- DesY$y
            ycorr[oo] <- ycorr[oo] + (-1 * sign(sp[oo])) * bias
            detect <- c(rep("no", n))
            detect[oo] <- "yes"
            cat("Initial Outlier Report", "\n")
            cat("Standardized-Gap = ", gap, "Significant at 50th percentile", 
                "\n")
            DesYc <- cbind(DesY[, 1:(dim(DesY)[2] - 1)], ycorr)
            modf <- lm(ycorr ~ (.)^4, x = TRUE, data = DesYc)
            che <- modf$coef
            che <- che[!is.na(che)]
            che <- che[-1]
            p <- length(che)
            n <- p + 1
            cn <- names(che)
            ccn <- gsub("[^A-Z]", "", cn)
            names(che) <- ccn
            ache <- abs(che)
            s0 <- 1.5 * median(ache)
            selche <- ache < (2.5 * s0)
            psec = 1.5 * median(ache[selche])
            gap <- gapstat(he, psec)
            if (ncheck == 16) 
                test2 = (gap > critg16[2])
            else test2 = (gap > critg32[2])
            if (test2) {
                cat("Final Outlier Report", "\n")
                cat("Standardized-Gap = ", gap, "Significant at 99th percentile", 
                  "\n")
                cat("   ", "\n")
                cat("    Corrrected Data Report  ", "\n")
                cat("Response  Corrected Response   Detect Outlier", 
                  "\n")
                cat(paste(format(DesY$y, width = 8), format(DesYc$ycorr, 
                  width = 13), "           ", format(detect, 
                  width = 10), "\n"), sep = "")
                tce <- LGB(che)
            }
            else {
                cat("Final Outlier Report", "\n")
                cat("No significant outlier detected in second pass", 
                  "\n")
                LGB(he)
                cat("    ", "\n")
            }
        }
    }
  }



