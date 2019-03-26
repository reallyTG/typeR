library(ade4)


### Name: score.coa
### Title: Reciprocal scaling after a correspondence analysis
### Aliases: score.coa reciprocal.coa
### Keywords: multivariate hplot

### ** Examples

layout(matrix(c(1,1,2,3), 2, 2), resp = FALSE)
data(aviurba)
dd1 <- dudi.coa(aviurba$fau, scan = FALSE)
score(dd1, clab.r = 0, clab.c = 0.75)
recscal <- reciprocal.coa(dd1)
head(recscal)
abline(v = 1, lty = 2, lwd = 3)
sco.distri(dd1$l1[,1], aviurba$fau)
sco.distri(dd1$c1[,1], data.frame(t(aviurba$fau)))

# 1 reciprocal scaling correspondence score -> species amplitude + sample diversity
# 2 sample score -> averaging -> species amplitude
# 3 species score -> averaging -> sample diversity

layout(matrix(c(1,1,2,3), 2, 2), resp = FALSE)
data(rpjdl)
rpjdl1 <- dudi.coa(rpjdl$fau, scan = FALSE)
score(rpjdl1, clab.r = 0, clab.c = 0.75)
if (requireNamespace("MASS", quietly = TRUE)) {
   data(caith, package = "MASS")
   score(dudi.coa(caith, scan = FALSE), clab.r = 1.5, clab.c = 1.5, cpoi = 3)
   data(housetasks)
   score(dudi.coa(housetasks, scan = FALSE), clab.r = 1.25, clab.c = 1.25, 
        csub = 0, cpoi = 3)
}
par(mfrow = c(1,1))
score(rpjdl1, dotchart = TRUE, clab.r = 0)



