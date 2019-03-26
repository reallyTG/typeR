library(daewr)


### Name: fullnormal
### Title: This function makes a full normal plot of the elements of the
###   vector called effects
### Aliases: fullnormal
### Keywords: hplot

### ** Examples

# Example Separate Normal plots of whole and split plot effects from an unreplicated split-plot 
data(plasma)
sol<-lm(y~A*B*C*D*E,data=plasma)
summary(sol)
# get whole plot effects and split plot effects
effects<-coef(sol)
effects<-effects[c(2:32)]
Wpeffects<-effects[c(1:4, 6:11, 16:19, 26)]
Speffects<-effects[c(5,12:15,20:25,27:31)]

#make separate normal plots
library(BsMD)
fullnormal(Wpeffects,names(Wpeffects),alpha=.10)
fullnormal(Speffects,names(Speffects),alpha=.05)


## The function is currently defined as
function (effects, labs, alpha = 0.05, refline = "TRUE") 
{
    crit <- LenthPlot(effects, alpha = alpha, plt = FALSE)["ME"]
    names <- names(effects)
    names <- gsub(":", "", names)
    names <- gsub("1", "", names)
    le <- length(effects)
    for (i in 1:le) {
        logc <- (abs(effects[i]) <= crit)
        if (logc) {
            names[i] <- " "
        }
    }
    qqnorm(effects, ylab = "Estimated Effects", xlab = "Normal Scores")
    x <- qqnorm(effects, plot = FALSE)
    zscr <- (x$x)
    effp <- effects[zscr > 0]
    zp <- zscr[zscr > 0]
    namep <- names[zscr > 0]
    effn <- effects[zscr < 0]
    zn <- zscr[zscr < 0]
    namen <- names[zscr < 0]
    text(zp, effp, namep, pos = 1)
    text(zn, effn, namen, pos = 3)
    ahe <- abs(effects)
    s0 <- 1.5 * median(ahe)
    selhe <- ahe < (2.5 * s0)
    pse = 1.5 * median(ahe[selhe])
    if (refline) {
        abline(0, pse)
    }
  }



