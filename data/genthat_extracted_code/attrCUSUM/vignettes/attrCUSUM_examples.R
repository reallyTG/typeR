## ----attach--------------------------------------------------------------
library(attrCUSUM)

## ----ANSS_pois_1---------------------------------------------------------
lambda <-  4  # mean of Poisson distribution
k <- 5  # reference value 
h <- 8  # control limit
c.zero <- 0  # initial state
res <- getAve_pois(lambda = lambda, refv = k, contl = h, c.zero = c.zero)
res$ANSS

## ----ATS_pois_1----------------------------------------------------------
lambda <-  4  # mean of Poisson distribution
k <- 5  # reference value 
h <- 8  # control limit
c.zero <- 0  # initial state
warnl <- -1  # warning limit
ds <- 0.1  # shorter sampling interval
res1 <- getAve_pois(lambda = lambda, refv = k, contl = h, 
                   c.zero = c.zero, warnl = warnl, ds = ds)
dl <- res1$dl  # longer sampling interval
dl
res2 <- getAve_pois(lambda = lambda, refv = k, contl = h, 
                   c.zero = c.zero, warnl = warnl, ds = ds, dl = dl)
res2$ANSS
res2$ATS

## ----ATS_profiles_pois_1, echo=FALSE, fig.align='center', fig.width=7, fig.height=5----
lambda <-  4  # mean of Poisson distribution
k <- 5  # reference value 
h <- 8  # control limit
c.zero <- 0  # initial state
warnl <- -1  # warning limit
std.lambda <- sqrt(lambda)
dss <- c(1, 0.75, 0.5, 0.25, 0.1)  # shorter sampling intervals
deltas <- seq(0, 2.0, 0.1)  # shift  
for (ds in dss) {
  dl <- getAve_pois(lambda = lambda, refv = k, contl = h,
                    ds = ds, warnl = warnl)$dl
  ds.text <- as.character(ds)
  ats.text <- paste("ats", ds.text, sep = "_")
  eval.text.1 <- paste(ats.text, " <- numeric(length(deltas))", sep = "")
  eval.text.2 <- paste(ats.text, "[j] <- res$ATS", sep = "")
  eval(parse(text = eval.text.1))
  for (j in seq_along(deltas)) {  
    res <- getAve_pois(lambda = lambda + (std.lambda * deltas[j]), 
                       refv = k,contl = h, ds = ds, dl = dl, warnl = warnl)
    eval(parse(text = eval.text.2))
  }
}
plot(x = deltas, y = log10(ats_0.1), ylim = c(-0.5, log10(ats_1)[1]),
     pch = 0, type = "o", main = "VSI Poisson CUSUM(5,8)", cex.main = 1.1,
     sub = paste("w=", warnl, sep = ""), cex.sub = 1.1,
     xlab = expression(delta), cex.lab = 1.1,
     ylab = expression(paste(log[10], ATS)))
lines(x = deltas, y = log10(ats_0.25), pch = 1, type = "o")
lines(x = deltas, y = log10(ats_0.5), pch = 6, type = "o")
lines(x = deltas, y = log10(ats_0.75), pch = 7, type = "o")
lines(x = deltas, y = log10(ats_1), pch = 16, type = "o")
legend(x = 1.4, y = 2.25, legend = paste("ds=", dss, sep = ""),
       pch = c(16, 7, 6, 1, 0), cex = 0.9, bty = "n")


## ----names_getAve_pois---------------------------------------------------
names(res2)

## ----Contl_pois_1--------------------------------------------------------
lambda <-  4  # mean of Poisson distribution
k <- 5  # reference value 
c.zero <- 0  # initial state
anss.target <- 200L  # desired anss
getContl_pois(lambda = lambda, anss.target = anss.target, 
              refv = k, c.zero = c.zero)


