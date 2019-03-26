library(daewr)


### Name: LGBc
### Title: This function does the calculations for the LGB Method to detect
###   significant effects in unreplicated fractional factorials.
### Aliases: LGBc
### Keywords: htest

### ** Examples

data(chem)
modf<-lm(y~A*B*C*D,data=chem)
sig<-LGBc(coef(modf)[-1],rpt=FALSE)


## The function is currently defined as
function (Beta, alpha = 0.05, rpt = TRUE, plt = TRUE, pltl = TRUE) 
{
    siglev <- c(0.1, 0.05, 0.025, 0.01)
    df <- c(7, 8, 11, 15, 16, 17, 26, 31, 32, 35, 63, 127)
    crittab <- matrix(c(1.265, 1.196, 1.161, 1.122, 1.11, 1.106, 
        1.072, 1.063, 1.06, 1.059, 1.037, 1.023, 1.534, 1.385, 
        1.291, 1.201, 1.186, 1.178, 1.115, 1.099, 1.093, 1.091, 
        1.056, 1.034, 1.889, 1.606, 1.449, 1.297, 1.274, 1.26, 
        1.165, 1.14, 1.13, 1.127, 1.074, 1.043, 2.506, 2.026, 
        1.74, 1.447, 1.421, 1.377, 1.232, 1.197, 1.185, 1.178, 
        1.096, 1.058), ncol = 4, byrow = FALSE)
    colind <- which(siglev == alpha, arr.ind = TRUE)
    if (length(colind) == 0) {
        stop("this function works only when alpha= .1, .05, .025 or .01")
    }
    rowind <- which(df == length(Beta), arr.ind = TRUE)
    if (length(rowind) == 0) {
        stop("this function works only for coefficent vectors of 
		length 7,8,11,15,16,26,31,32,35,63,or 127")
    }
    critL <- crittab[rowind, colind]
    acj <- abs(Beta)
    ranks <- rank(acj, ties.method = "first")
    s0 <- 1.5 * median(acj)
    p <- (ranks - 0.5)/length(Beta)
    z <- qnorm((p + 1)/2)
    moda <- lm(acj ~ -1 + z)
    beta1 <- moda$coef
    sel <- acj < 2.5 * s0
    modi <- lm(acj[sel] ~ -1 + z[sel])
    beta2 <- modi$coef
    Rn <- beta1/beta2
    pred <- beta2 * z
    n <- length(acj[sel])
    df <- n - 1
    sig <- sqrt(sum(modi$residuals^2)/df)
    se.pred <- sig * (1 + 1/n + (z^2)/sum(z[sel]^2))^0.5
    pred.lim <- pred + qt(0.975, df) * se.pred
    sigi <- c(rep("no", length(Beta)))
    sel2 <- acj > pred.lim
    sigi[sel2] <- "yes"
    if (plt) {
        plot(z, acj, xlab = "Half Normal Scores", ylab = "Absoulute Effects")
        lines(sort(z), sort(pred), lty = 1)
        for (i in 1:length(Beta)) {
            if (sigi[i] == "yes") 
                text(z[i], acj[i], names(Beta)[i], pos = 1)
        }
        if (pltl) {
            lines(sort(z), sort(pred.lim), lty = 3)
        }
    }
    if (rpt) {
        cat("Effect Report", "\n")
        cat("  ", "\n")
        cat("Label     Half Effect    Sig(.05)", "\n")
        cat(paste(format(names(Beta), width = 8), format(Beta, 
            width = 8), "      ", format(sigi, width = 10), "\n"), 
            sep = "")
        cat("  ", "\n")
        cat("Lawson, Grimshaw & Burt Rn Statistic = ", Rn, "\n")
        cat("95th percentile of Rn = ", critL, "\n")
    }
    return(sigi)
  }



