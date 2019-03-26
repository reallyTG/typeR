### R code from vignette source 'movMF.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: movMF.Rnw:80-95
###################################################
set.seed(1234)
options(width=65, prompt = "R> ", continue = "+  ", useFancyQuotes = FALSE)
cache <- TRUE
library("slam")
library("lattice")
library("movMF")
palette(colorspace::heat_hcl(4))
ltheme <- canonical.theme("pdf", FALSE)
for (i in grep("padding", names(ltheme$layout.heights))) {
  ltheme$layout.heights[[i]] <- 0.2
}
for (i in grep("padding", names(ltheme$layout.widths))) {
  ltheme$layout.widths[[i]] <- 0
}
lattice.options(default.theme = ltheme)


###################################################
### code chunk number 2: movMF.Rnw:98-157
###################################################
rotationMatrix <- function(mu) {
    beta <- asin(mu[1])
    alpha <- atan( - mu[2] / mu[3]) + sign(mu[2] * mu[3]) * (mu[3] < 0) * pi
    cosa <- cos(alpha); cosb <- cos(beta)
    sina <- sin(alpha); sinb <- sin(beta)
    matrix(c(cosb, sina * sinb, - cosa * sinb,
             0, cosa, sina,
             sinb, - sina * cosb, cosa * cosb),
           nrow = 3)
}

getIsolines <- function(d, mu, length = 100) {
    theta <- seq(0, 2*pi, length = length)
    sinphi <- sin(acos(d))
    tcrossprod(cbind(cos(theta) * sinphi, sin(theta) * sinphi, d),
               rotationMatrix(mu))
}

plotGlobe <- function(x, class, pars = NULL, main = "", theta = 0, phi = 0,
                      Q = c(0.5, 0.95), n = 100000,
                      xlim = c(-1, 1), ylim = c(-1, 1), zlim = c(-1, 1), ...) {
    pmat <- persp(0:1, 0:1, matrix(, 2, 2), theta = theta, phi = phi, 
                  xlim = xlim, ylim = ylim, zlim = zlim, scale = FALSE,
                  xlab="x", ylab="y", zlab="z", main = main, ...)
    trans3d <- function(x, y, z) {
        tr <- cbind(x, y, z, 1) %*% pmat
        list(x = tr[, 1]/tr[, 4],
             y = tr[, 2]/tr[, 4])
    }
    x <- x / row_norms(x)
    x3D <- trans3d(x[,1], x[,2], x[,3])
    
    theta <- seq(0, 2*pi, length = 41)
    phi <- seq(0, pi/2, length = 21)
    x <- cos(theta) %o% sin(phi)
    y <- sin(theta) %o% sin(phi)
    z <- rep(1, length(theta)) %o% cos(phi)
    for (j in seq(phi)[-1]) for (i in seq(theta)[-1]) {
        idx <- rbind(c(i-1,j-1), c(i,j-1), c(i,j), c(i-1,j))
        polygon(trans3d(x[idx], y[idx], z[idx]), border = "grey")
    }
    points(x3D$x, x3D$y, col = class, pch = 20)

    if (!is.null(pars)) {
        kappa <- row_norms(pars)
        d <- sapply(kappa, function(K) rmovMF(n, K * c(1, 0, 0))[,1])
        mu <- pars / kappa
        for (i in seq_along(Q)) {
            M <- apply(d, 2, quantile, 1-Q[i])
            isos <- lapply(seq_len(nrow(mu)), function(i) getIsolines(M[i], mu[i,]))
            isostrans <- lapply(isos, function(x) trans3d(x[,1], x[,2], x[,3]))
            lapply(seq_along(isostrans), function(j) 
                   polygon(isostrans[[j]]$x, isostrans[[j]]$y, border = j, lwd = 2, lty = i))
        }
        mu3D <- trans3d(mu[,1], mu[,2], mu[,3])
        points(mu3D$x, mu3D$y, pch = 4, lwd = 2, col = seq_len(nrow(mu)))
    }
    invisible(pmat)
}


###################################################
### code chunk number 3: corpus-package
###################################################
if(!nzchar(system.file(package = "corpus.useR.2008.abstracts"))) {
    templib <- tempfile(); dir.create(templib)
    install.packages("corpus.useR.2008.abstracts", lib = templib,
                     repos = "https://datacube.wu.ac.at/",
                     type = "source")
    data("useR_2008_abstracts", package = "corpus.useR.2008.abstracts",
         lib.loc = templib)
} else {
    data("useR_2008_abstracts", package = "corpus.useR.2008.abstracts")
}


###################################################
### code chunk number 4: illustration1
###################################################
data("household", package = "HSAUR2")
x <- as.matrix(household[, c(1:2, 4)])
gender <- household$gender

theta <- rbind(female = movMF(x[gender == "female", ], k = 1)$theta, 
               male = movMF(x[gender == "male", ], k = 1)$theta)
   
set.seed(2008)
vMFs <- lapply(1:5, function(K) 
  movMF(x, k = K, control= list(nruns = 20)))


###################################################
### code chunk number 5: movMF.Rnw:494-498
###################################################
kappa <- row_norms(theta)
tab2 <- table(max.col(vMFs[[2]]$P), household$gender)
mc2 <- min(c(sum(diag(tab2)), sum(tab2) - sum(diag(tab2))))
tab3 <- table(max.col(vMFs[[3]]$P), household$gender)


###################################################
### code chunk number 6: movMF.Rnw:520-543
###################################################
par(mar = 0.1 + c(0, 0.5, 2, 0), mfrow = c(2, 2))
plotGlobe(x, household$gender, main = "Data", 
          theta = -30, phi = 10, zlim = c(0, 1))

plotGlobe(x, household$gender, theta, main = "Known group membership", 
          theta = -30, phi = 10, zlim = c(0, 1))

mu <- lapply(vMFs, function(x) x$theta / row_norms(x$theta))
ordering <- lapply(mu, function(x) order(x[,1], decreasing = TRUE))
class <- alpha <- kappa <- theta <- vector("list", length(ordering))
for (i in seq_along(ordering)) {
   alpha[[i]] <- vMFs[[i]]$alpha[ordering[[i]]]
   mu[[i]] <- mu[[i]][ordering[[i]],,drop=FALSE]
   theta[[i]] <- vMFs[[i]]$theta[ordering[[i]],,drop=FALSE]
   kappa[[i]] <- row_norms(vMFs[[i]]$theta[ordering[[i]],,drop=FALSE])
   class[[i]] <- max.col(vMFs[[i]]$P[,ordering[[i]]])
}
	  
for (k in 2:3) {
  plotGlobe(x, class[[k]], theta[[k]], 
            main = paste("Mixtures of vMFs with K =", k),
            theta = -30, phi = 10, zlim = c(0, 1))
}


###################################################
### code chunk number 7: movMF.Rnw:750-761
###################################################
X2 <- cbind(alpha[[2]], mu[[2]], kappa[[2]], c(BIC(vMFs[[2]]), NA))
X2 <- format(round(X2, digits = 2), nsmall = 2)
X2[1,6] <- paste("$", X2[1,6], "$", sep = "")
X2 <- gsub("NA", "  ", X2)
X2 <- apply(cbind(c("$K = 2$", ""), X2), 1, paste, collapse = "&")

X3 <- cbind(alpha[[3]], mu[[3]], kappa[[3]], c(BIC(vMFs[[3]]), rep(NA, 2)))
X3 <- format(round(X3, digits = 2), nsmall = 2)
X3[1,6] <- paste("$", X3[1,6], "$", sep = "")
X3 <- gsub("NA", "  ", X3)
X3 <- apply(cbind(c("$K = 3$", rep("", 2)), X3), 1, paste, collapse = "&")


###################################################
### code chunk number 8: movMF.Rnw:792-793
###################################################
cat(paste("R> ", prompt(movMF, filename = NA)$usage[[2]]))


###################################################
### code chunk number 9: movMF.Rnw:907-908 (eval = FALSE)
###################################################
## data("household", package = "HSAUR2")
## x <- as.matrix(household[, c(1:2, 4)])
## gender <- household$gender
## 
## theta <- rbind(female = movMF(x[gender == "female", ], k = 1)$theta, 
##                male = movMF(x[gender == "male", ], k = 1)$theta)
##    
## set.seed(2008)
## vMFs <- lapply(1:5, function(K) 
##   movMF(x, k = K, control= list(nruns = 20)))


###################################################
### code chunk number 10: movMF.Rnw:913-914
###################################################
sapply(vMFs, BIC)


###################################################
### code chunk number 11: movMF.Rnw:1415-1416 (eval = FALSE)
###################################################
## if(!nzchar(system.file(package = "corpus.useR.2008.abstracts"))) {
##     templib <- tempfile(); dir.create(templib)
##     install.packages("corpus.useR.2008.abstracts", lib = templib,
##                      repos = "https://datacube.wu.ac.at/",
##                      type = "source")
##     data("useR_2008_abstracts", package = "corpus.useR.2008.abstracts",
##          lib.loc = templib)
## } else {
##     data("useR_2008_abstracts", package = "corpus.useR.2008.abstracts")
## }


###################################################
### code chunk number 12: movMF.Rnw:1440-1452
###################################################
library("tm")
abstracts_titles <- 
  apply(useR_2008_abstracts[,c("Title", "Abstract")],
        1, paste, collapse = " ")
useR_2008_abstracts_corpus <- Corpus(VectorSource(abstracts_titles))
useR_2008_abstracts_DTM <- 
  DocumentTermMatrix(useR_2008_abstracts_corpus,
                     control = list(
                       tokenize = "MC",
                       stopwords = TRUE,
                       stemming = TRUE,
                       wordLengths = c(3, Inf)))


###################################################
### code chunk number 13: movMF.Rnw:1467-1470
###################################################
library("slam")
ColSums <- col_sums(useR_2008_abstracts_DTM > 0)
sort(ColSums, decreasing = TRUE)[1:10]


###################################################
### code chunk number 14: movMF.Rnw:1478-1481
###################################################
useR_2008_abstracts_DTM <- 
  useR_2008_abstracts_DTM[, ColSums >= 5 & ColSums <= 90]
useR_2008_abstracts_DTM


###################################################
### code chunk number 15: movMF.Rnw:1486-1487
###################################################
useR_2008_abstracts_DTM <- weightTfIdf(useR_2008_abstracts_DTM)


###################################################
### code chunk number 16: fit-movMF (eval = FALSE)
###################################################
## set.seed(2008)
## library("movMF")
## Ks <- c(1:5, 10, 20)
## splits <- sample(rep(1:10, length.out = nrow(useR_2008_abstracts_DTM)))
## useR_2008_movMF <- 
##   lapply(Ks, function(k) 
##          sapply(1:10, function(s) {
##            m <- movMF(useR_2008_abstracts_DTM[splits != s,], 
##                       k = k, nruns = 20)
##            logLik(m, useR_2008_abstracts_DTM[splits == s,])
##          }))
## useR_2008_movMF_common <- 
##   lapply(Ks, function(k) 
##          sapply(1:10, function(s) {
##            m <- movMF(useR_2008_abstracts_DTM[splits != s,], 
##                       k = k, nruns = 20,
##                       kappa = list(common = TRUE))
##            logLik(m, useR_2008_abstracts_DTM[splits == s,])
##          }))


###################################################
### code chunk number 17: movMF.Rnw:1522-1535
###################################################
if(cache & file.exists("movMF.rda")) {
  load("movMF.rda")
  library("movMF")
  Ks <- c(1:5, 10, 20)
} else {
set.seed(2008)
library("movMF")
Ks <- c(1:5, 10, 20)
splits <- sample(rep(1:10, length.out = nrow(useR_2008_abstracts_DTM)))
useR_2008_movMF <- 
  lapply(Ks, function(k) 
         sapply(1:10, function(s) {
           m <- movMF(useR_2008_abstracts_DTM[splits != s,], 
                      k = k, nruns = 20)
           logLik(m, useR_2008_abstracts_DTM[splits == s,])
         }))
useR_2008_movMF_common <- 
  lapply(Ks, function(k) 
         sapply(1:10, function(s) {
           m <- movMF(useR_2008_abstracts_DTM[splits != s,], 
                      k = k, nruns = 20,
                      kappa = list(common = TRUE))
           logLik(m, useR_2008_abstracts_DTM[splits == s,])
         }))
if(cache) {
  save(useR_2008_movMF, useR_2008_movMF_common,
  file = "movMF.rda")
} else {
  if(file.exists("movMF.rda")) file.remove("movMF.rda")
}
}


###################################################
### code chunk number 18: movMF.Rnw:1548-1560
###################################################
logLiks <- data.frame(logLik = c(unlist(useR_2008_movMF),
                        unlist(useR_2008_movMF_common)),
                      K = c(rep(Ks, sapply(useR_2008_movMF, length)),
                        rep(Ks, sapply(useR_2008_movMF_common, length))),
                      Dataset = seq_len(length(useR_2008_movMF[[1]])),
                      Method = factor(rep(1:2, each = length(unlist(useR_2008_movMF))),
                        1:2, c("free", "common")))
logLiks$logLik <- logLiks$logLik - rep(rep(with(logLiks, tapply(logLik, Dataset, mean)), length(Ks)), 2)
print(xyplot(logLik ~ K | Method, data = logLiks, groups = Dataset, type = "l", lty = 1, 
             xlab = "Number of components", ylab = "Predictive log-likelihood",           
             strip = strip.custom(factor.levels  = 
               expression(paste("Free ", kappa), paste("Common ", kappa)))))


###################################################
### code chunk number 19: movMF.Rnw:1573-1576
###################################################
set.seed(2008)
best_model <- movMF(useR_2008_abstracts_DTM, k = 2, nruns = 20,
                    kappa = list(common = TRUE))


###################################################
### code chunk number 20: movMF.Rnw:1582-1584
###################################################
apply(coef(best_model)$theta, 1, function(x) 
      colnames(coef(best_model)$theta)[order(x, decreasing = TRUE)[1:10]])


###################################################
### code chunk number 21: movMF.Rnw:1597-1604
###################################################
clustering <- predict(best_model)
keywords <- useR_2008_abstracts[, "Keywords"]
keywords <- sapply(keywords, 
                   function(x) sapply(strsplit(x, ", ")[[1]], function(y) 
                                      strsplit(y, "-")[[1]][1]))
tab <- table(Keyword = unlist(keywords), 
             Component = rep(clustering, sapply(keywords, length)))


###################################################
### code chunk number 22: movMF.Rnw:1610-1611
###################################################
(tab <- tab[rowSums(tab) > 8, ])


###################################################
### code chunk number 23: movMF.Rnw:1624-1628
###################################################
library("vcd")
mosaic(tab, shade = TRUE, 
       labeling_args = list(rot_labels = 0, just_labels = c("center", "right"), 
         pos_varnames = c("left", "right"), rot_varnames = 0))


