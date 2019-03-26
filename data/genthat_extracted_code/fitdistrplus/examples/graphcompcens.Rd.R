library(fitdistrplus)


### Name: graphcompcens
### Title: Graphical comparison of multiple fitted distributions for
###   censored data
### Aliases: graphcompcens cdfcompcens denscompcens qqcompcens ppcompcens
### Keywords: distribution

### ** Examples

# (1) Plot various distributions fitted to bacterial contamination data
#
data(smokedfish)
Clog10 <- log10(smokedfish)

fitsfn <- fitdistcens(Clog10,"norm")
summary(fitsfn)

fitsfl <- fitdistcens(Clog10,"logis")
summary(fitsfl)

dgumbel <- function(x,a,b) 1/b*exp((a-x)/b)*exp(-exp((a-x)/b))
pgumbel <- function(q,a,b) exp(-exp((a-q)/b))
qgumbel <- function(p,a,b) a-b*log(-log(p))
fitsfg<-fitdistcens(Clog10,"gumbel",start=list(a=-3,b=3))
summary(fitsfg)

# CDF plot
cdfcompcens(list(fitsfn,fitsfl,fitsfg))
cdfcompcens(list(fitsfn,fitsfl,fitsfg),datacol="orange",fillrect = NA, 
    legendtext=c("normal","logistic","Gumbel"),
    main="bacterial contamination fits",
    xlab="bacterial concentration (CFU/g)",ylab="F",
    xlegend = "bottom",lines01 = TRUE)
# alternative Turnbull plot for the empirical cumulative distribution
# (default plot of the previous versions of the package)
cdfcompcens(list(fitsfn,fitsfl,fitsfg), NPMLE.method = "Turnbull")

# customizing graphical output with ggplot2
if (requireNamespace ("ggplot2", quietly = TRUE)) {
  cdfcompcens <- cdfcompcens(list(fitsfn,fitsfl,fitsfg),datacol="orange",fillrect = NA, 
    legendtext=c("normal","logistic","Gumbel"),
    xlab="bacterial concentration (CFU/g)",ylab="F",
    xlegend = "bottom",lines01 = TRUE, plotstyle = "ggplot")
  cdfcompcens + ggplot2::theme_minimal() + ggplot2::ggtitle("Bacterial contamination fits")
}

# PP plot
ppcompcens(list(fitsfn,fitsfl,fitsfg))
ppcompcens(list(fitsfn,fitsfl,fitsfg), ynoise = FALSE)
par(mfrow = c(2,2))
ppcompcens(fitsfn)
ppcompcens(fitsfl)
ppcompcens(fitsfg)
par(mfrow = c(1,1))
if (requireNamespace ("ggplot2", quietly = TRUE)) {
  ppcompcens(list(fitsfn,fitsfl,fitsfg), plotstyle = "ggplot")
  ppcompcens(list(fitsfn,fitsfl,fitsfg), plotstyle = "ggplot", 
    fillrect = c("lightpink", "lightblue", "lightgreen"), 
    fitcol = c("red", "blue", "green"))
}

# QQ plot
qqcompcens(list(fitsfn,fitsfl,fitsfg))
qqcompcens(list(fitsfn,fitsfl,fitsfg), ynoise = FALSE)
par(mfrow = c(2,2))
qqcompcens(fitsfn)
qqcompcens(fitsfl)
qqcompcens(fitsfg)
par(mfrow = c(1,1))

if (requireNamespace ("ggplot2", quietly = TRUE)) {
  qqcompcens(list(fitsfn,fitsfl,fitsfg), ynoise = FALSE, plotstyle = "ggplot")
  qqcompcens(list(fitsfn,fitsfl,fitsfg), ynoise = FALSE, plotstyle = "ggplot", 
    fillrect = c("lightpink", "lightblue", "lightgreen"), 
    fitcol = c("red", "blue", "green"))
}




