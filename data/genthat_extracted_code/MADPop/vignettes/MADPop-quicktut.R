## ----setup, echo = FALSE, include = FALSE--------------------------------

require(knitr)
require(rmarkdown)
knitr::opts_chunk$set(cache = FALSE, autodep = FALSE)
if(FALSE) {
  # compile
  #rmarkdown::render(file.path("vignettes", "MADPop-quicktut.Rmd"))
  rmarkdown::render("MADPop-quicktut.Rmd")
}
# view it by opening MADPop/vignettes/MADPop-tutorial.html


## ----madpop--------------------------------------------------------------
require(MADPop)

## ----preproc, echo = FALSE-----------------------------------------------
nObs <- nrow(fish215)
nPop <- nlevels(fish215$Lake)
nAlleles <- length(table(c(as.matrix(fish215[,-1])))) - 1

## ----fish215-------------------------------------------------------------
head(fish215[sample(nObs),])

## ----setup2, ref.label = "table2", echo = FALSE, results = "hide"--------
popId <- c("Dickey", "Simcoe")          # lakes to compare
Xsuff <- UM.suff(fish215)             # summary statistics for dataset
ctab <- Xsuff$tab[popId,]             # contingency table
ctab <- ctab[,colSums(ctab) > 0] # remove alleles with no counts
#ctab
rbind(ctab, Total = colSums(ctab))

## ----table2--------------------------------------------------------------
popId <- c("Dickey", "Simcoe")          # lakes to compare
Xsuff <- UM.suff(fish215)             # summary statistics for dataset
ctab <- Xsuff$tab[popId,]             # contingency table
ctab <- ctab[,colSums(ctab) > 0] # remove alleles with no counts
#ctab
rbind(ctab, Total = colSums(ctab))

## ----gtype---------------------------------------------------------------
gtype <- colnames(ctab)[1]
gtype <- as.numeric(strsplit(gtype, "[.]")[[1]])
gtype
names(gtype) <- paste0("A", gtype)
sapply(gtype, function(ii) Xsuff$A[ii])

## ----pvasy---------------------------------------------------------------
# observed values of the test statistics
chi2.obs <- chi2.stat(ctab) # Pearson's chi^2
LRT.obs <- LRT.stat(ctab) # LR test statistic
T.obs <- c(chi2 = chi2.obs, LRT = LRT.obs)
# p-value with asymptotic calculation
C <- ncol(ctab)
pv.asy <- pchisq(q = T.obs, df = C-1, lower.tail = FALSE)
signif(pv.asy, 2)

## ----pvboot, cache = FALSE-----------------------------------------------
N1 <- sum(ctab[1,])                     # size of first sample
N2 <- sum(ctab[2,])                     # size of second sample
rho.hat <- colSums(ctab)/(N1+N2)        # common probability vector
# bootstrap distribution of the test statistics
# set verbose = TRUE for progress output
system.time({
  T.boot <- UM.eqtest(N1 = N1, N2 = N2, p0 = rho.hat, nreps =1e4,
                      verbose = FALSE)
})
# bootstrap p-value
pv.boot <- rowMeans(t(T.boot) >= T.obs)
signif(pv.boot, 2)

## ----table3--------------------------------------------------------------
itab1 <- colSums(ctab) == 1             # single count genotypes
cbind(ctab[,itab1],
      Other = rowSums(ctab[,!itab1]),
      Total = rowSums(ctab))

## ----setup4, echo = FALSE------------------------------------------------
c1 <- sum(itab1) # number of single-count columns
n1 <- sum(ctab[,itab1]) # number of single counts

## ----popId0--------------------------------------------------------------
popId                                   # equal lakes under H0
eqId0 <- paste0(popId, collapse = ".")  # merged lake name
popId0 <- as.character(fish215$Lake)    # all lake names
popId0[popId0 %in% popId] <- eqId0
table(popId0, dnn = NULL)               # merged lake counts

## ----stan, cache = TRUE--------------------------------------------------
X0 <- cbind(Id = popId0, fish215[-1])  # allele data with merged lakes

nsamples <- 1e4
fit0 <- hUM.post(nsamples = nsamples, X = X0,
                 rhoId = eqId0,     # output rho only for merged lakes
                 chains = 1,  # next two arguments are passed to rstan
                 warmup = min(1e4, floor(nsamples/10)),
                 full.stan.out = FALSE)


## ----setup3, ref.label = "bxp", echo = FALSE, fig.keep = "none"----------
rho.post <- fit0$rho[,1,]   # p(rho12 | Y)
# sort genotype counts by decreasing order
rho.count <- colSums(Xsuff$tab[popId,])
rho.ord <- order(colMeans(rho.post), decreasing = TRUE)

# plot
nbxp <- 50            # number of genotypes for which to make boxplots
clrs <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2",
          "#D55E00", "#CC79A7")
rho.ct <- rho.count[rho.ord[1:nbxp]]
rho.lgd <- unique(sort(rho.ct))
rho.box <- rho.post[,rho.ord[1:nbxp]]
par(mar = c(5,4.5,.5,.5)+.1, cex.axis = .7)
boxplot(x = rho.box,
        las = 2, col = clrs[rho.ct+1], pch = 16, cex = .2)
title(xlab = "Genotype", line = 4)
title(ylab = expression(p(bold(rho)[(12)]*" | "*bold(Y))))
legend("topright", legend = rev(rho.lgd), fill = rev(clrs[rho.lgd+1]),
       title = "Counts", ncol = 2, cex = .8)

## ----bxp, fig.width = 7, fig.height = 3.5--------------------------------
rho.post <- fit0$rho[,1,]   # p(rho12 | Y)
# sort genotype counts by decreasing order
rho.count <- colSums(Xsuff$tab[popId,])
rho.ord <- order(colMeans(rho.post), decreasing = TRUE)

# plot
nbxp <- 50            # number of genotypes for which to make boxplots
clrs <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2",
          "#D55E00", "#CC79A7")
rho.ct <- rho.count[rho.ord[1:nbxp]]
rho.lgd <- unique(sort(rho.ct))
rho.box <- rho.post[,rho.ord[1:nbxp]]
par(mar = c(5,4.5,.5,.5)+.1, cex.axis = .7)
boxplot(x = rho.box,
        las = 2, col = clrs[rho.ct+1], pch = 16, cex = .2)
title(xlab = "Genotype", line = 4)
title(ylab = expression(p(bold(rho)[(12)]*" | "*bold(Y))))
legend("topright", legend = rev(rho.lgd), fill = rev(clrs[rho.lgd+1]),
       title = "Counts", ncol = 2, cex = .8)

## ----pvpost, cache = FALSE-----------------------------------------------
system.time({
  T.post <- UM.eqtest(N1 = N1, N2 = N2, p0 = rho.post, nreps = 1e4,
                      verbose = FALSE)
})
# posterior p-value
pv.post <- rowMeans(t(T.post) >= T.obs)

## ----pvtable, echo = FALSE-----------------------------------------------
pv.tab <- cbind(asy = pv.asy, boot = pv.boot, post = pv.post)
pv.tab <- signif(pv.tab*100, 2)
colnames(pv.tab) <- c("Asymptotic", "Bootstrap", "Posterior")
rownames(pv.tab) <- c("$\\mathcal X$", "$\\Lambda$")
kable(pv.tab, digits = 2, caption = "p-value ($\\times100\\%$)")

