## ----setup, echo = FALSE, results = "hide"---------------------------------
options(signif = 3, digits = 3)
knitr::opts_chunk$set(tidy = FALSE, cache = TRUE, autodep = TRUE, fig.height = 5.5,
                      message = FALSE, error = FALSE, warning = TRUE)
set.seed(0xdada)

## ----overv1, results = "hide"----------------------------------------------
library("vsn")
data("kidney")
xnorm = justvsn(kidney)

## ----overv2----------------------------------------------------------------
M = exprs(xnorm)[,1] - exprs(xnorm)[,2]

## ----overv3, results = "hide"----------------------------------------------
fit = vsn2(kidney)
ynorm = predict(fit, kidney)

## ----overv4, echo = FALSE, results = "hide"--------------------------------
stopifnot(
  max(abs(exprs(xnorm) - exprs(ynorm))) < 1e-16, 
  max(abs(exprs(xnorm) - exprs(fit)))   < 1e-16,
  identical(dim(exprs(xnorm)), dim(exprs(ynorm))), 
  identical(dim(exprs(xnorm)), dim(exprs(fit))))

## ----nkid-scp, results = "hide", fig.cap = paste0("Scatterplots of the kidney example data, which were obtained from a two-color cDNA array by quantitating spots and subtracting a local background estimate. a) unnormalised and $\\log_2$-transformed. b) normalised and transformed with VSN. Panel b shows the data from the complete set of ", nrow(kidney), " spots on the array, Panel a only the ", sum(0==rowSums(exprs(kidney)<=0)), " spots for which both red and green net intensities were greater than 0. Those spots which are missing in Panel a are coloured in orange in Panel b."), fig.height = 4, fig.wide = TRUE----
library("ggplot2")
allpositive = (rowSums(exprs(kidney) <= 0) == 0)

df1 = data.frame(log2(exprs(kidney)[allpositive, ]),
                 type = "raw",
		 allpositive = TRUE)
df2 = data.frame(exprs(xnorm),
                 type = "vsn",
		 allpositive = allpositive)
df = rbind(df1, df2)
names(df)[1:2] = c("x", "y") 

ggplot(df, aes(x, y, col = allpositive)) + geom_hex(bins = 40) +
  coord_fixed() + facet_grid( ~ type)

## ----nkid-sdmean1, fig.cap = "Standard deviation versus rank of the mean", fig.height = 4, fig.small = TRUE----
meanSdPlot(xnorm, ranks = TRUE)

## ----nkid-sdmean2, fig.cap = "Standard deviation versus mean", fig.height = 4, fig.small = TRUE----
meanSdPlot(xnorm, ranks = FALSE) 

## ----nkid-histM, fig.cap = "Histogram of generalised log-ratios for the kidney example data.", fig.small = TRUE----
hist(M, breaks = 100, col = "#d95f0e")

## ----lymphoma--------------------------------------------------------------
data("lymphoma")
dim(lymphoma)

## ----pDatalym--------------------------------------------------------------
pData(lymphoma)

## ----lymjustvsn, results = "hide"------------------------------------------
lym = justvsn(lymphoma)

## ----lym-sdmean, fig.cap = "Standard deviation versus rank of the mean for the lymphoma example data", fig.height = 4, fig.small = TRUE----
meanSdPlot(lym)

## ----lym-M, fig.cap = "MA-plot for slide DLCL-0032 from the lymphoma example data. A false-colour representation of the data point density is used, in addition the 100 data points in the least dense regions are plotted as dots.", fig.small = TRUE----
iref = seq(1, 15, by=2)
ismp = seq(2, 16, by=2)
M = exprs(lym)[,ismp]-exprs(lym)[,iref] 
A =(exprs(lym)[,ismp]+exprs(lym)[,iref])/2
colnames(M) = lymphoma$sample[ismp]
colnames(A) = colnames(M)

j = "DLCL-0032"
smoothScatter(A[,j], M[,j], main=j, xlab="A", ylab="M", pch=".")
abline(h=0, col="red")

## ----loadaffy1, results = "hide", warning = FALSE--------------------------
library("affydata")
data("Dilution")
d_vsn = vsnrma(Dilution)

## ----loadaffy2, results = "hide"-------------------------------------------
d_rma = rma(Dilution)

## ----affy, fig.height=3.75, fig.wide = TRUE, fig.cap = paste0("Results of `vsnrma` and `rma` on the Dilution data. Array 1 was hybridised with ", pData(Dilution)$liver[1], "$\\mu$g RNA from liver, Array 3 with ", pData(Dilution)$liver[3], "$\\mu$g of the same RNA.")----
par(mfrow = c(1, 3))
ax = c(2, 16)

plot(exprs(d_vsn)[,c(1,3)], main = "vsn: array 1 vs 3", asp = 1, xlim = ax, ylim = ax, pch = ".")

plot(exprs(d_rma)[,c(1,3)], main = "rma: array 1 vs 3", asp = 1, xlim = ax, ylim = ax, pch = ".")

plot(exprs(d_rma)[,1], exprs(d_vsn)[,1], 
     xlab = "rma", ylab = "vsn", asp = 1, xlim = ax, ylim = ax, main = "array 1", pch = ".")
abline(a = 0,  b =1, col = "#ff0000d0")

## ----loadlimma, results = "hide"-------------------------------------------
library("limma")
wg = which(lymphoma$dye=="Cy3")
wr = which(lymphoma$dye=="Cy5")

lymRG = new("RGList", list(
  R=exprs(lymphoma)[, wr],
  G=exprs(lymphoma)[, wg]))

lymNCS = justvsn(lymRG)

## ----lymNCS----------------------------------------------------------------
lymNCS

## ----addmeta---------------------------------------------------------------
vmd = data.frame(
  labelDescription = I(c("array ID", "sample in G", "sample in R")),
  channel = c("_ALL", "G", "R"),
  row.names = c("arrayID", "sampG", "sampR"))

arrayID = lymphoma$name[wr]
stopifnot(identical(arrayID, lymphoma$name[wg])) 

## remove sample number suffix 
sampleType = factor(sub("-.*", "", lymphoma$sample)) 

v = data.frame(
  arrayID = arrayID,
  sampG   = sampleType[wg],
  sampR   = sampleType[wr])
v
              
adf = new("AnnotatedDataFrame", 
  data = v,
  varMetadata = vmd)

phenoData(lymNCS) = adf 

## ----lymM------------------------------------------------------------------
lymM = (assayData(lymNCS)$R - 
        assayData(lymNCS)$G)

## ----design----------------------------------------------------------------
design = model.matrix( ~ lymNCS$sampR)
lf = lmFit(lymM, design[, 2, drop=FALSE])
lf = eBayes(lf)

## ----limma, fig.wide = TRUE, fig.cap = paste("Left: histogram of p-values from the moderated $t$-test between the",  levels(lymNCS$sampR)[1], "and",  levels(lymNCS$sampR)[2], "groups on the `lymM` values. Right: M-values for the 5 genes with the smallest p-values.")----
par(mfrow=c(1,2))
hist(lf$p.value, breaks = 100, col="orange") 
pdat = t(lymM[order(lf$p.value)[1:5],])
matplot(pdat, lty = 1, type = "b", lwd = 2, col=hsv(seq(0,1,length=5), 0.7, 0.8), 
  ylab = "M", xlab = "arrays")

## ----makebg----------------------------------------------------------------
rndbg = function(x, off, fac)
   array(off + fac * runif(prod(dim(x))), dim = dim(x))

lymRGwbg    = lymRG
lymRGwbg$Rb = rndbg(lymRG, 100, 30)
lymRGwbg$Gb = rndbg(lymRG,  50, 20)

## ----justvsnwbg, message = FALSE-------------------------------------------
lymESwbg = justvsn(lymRGwbg[, 1:3], backgroundsubtract=TRUE)

## ----pinId-----------------------------------------------------------------
ngr = ngc = 4L
nsr = nsc = 24L
arrayGeometry = data.frame(
  spotcol = rep(1:nsc, times = nsr*ngr*ngc),
  spotrow = rep(1:nsr, each = nsc, times=ngr*ngc),
  pin = rep(1:(ngr*ngc), each = nsr*nsc))

## ----strata, results = "hide"----------------------------------------------
EconStr = justvsn(lymRG[, 1], strata = arrayGeometry$pin)

## ----nostrata, results = "hide"--------------------------------------------
EsenzaStr = justvsn(lymRG[, 1])

## ----figstrata2, fig.small = TRUE, fig.cap = "Scatterplot of normalised and transformed intensities for the red channel of Array 1. Values on the $x$-axis correspond to normalisation without strata (`EsenzaStr`), values on the $y$-axis to normalisation with strata (`EconStr`). The different colours correspond to the 16 different strata."----
j = 1
plot(assayData(EsenzaStr)$R[,j],
     assayData(EconStr)$R[,j],
     pch = ".", asp = 1, 
     col = hsv(seq(0, 1, length=ngr*ngc), 
       0.8, 0.6)[arrayGeometry$pin], 
     xlab = "without strata", 
     ylab = "print-tip strata",
     main = sampleNames(lymNCS)$R[j])

## ----miss1-----------------------------------------------------------------
lym2 = lymphoma
nfeat = prod(dim(lym2))
wh = sample(nfeat, nfeat/10)
exprs(lym2)[wh] = NA
table(is.na(exprs(lym2)))

## ----miss2, results = "hide"-----------------------------------------------
fit1 = vsn2(lymphoma, lts.quantile=1)
fit2 = vsn2(lym2, lts.quantile=1)

## ----miss, fig.wide = TRUE, fig.cap="Scatterplots of fitted parameters, values on the $x$-axis correspond to normalisation without missing data (`fit1`), values on the $y$-axis to normalisation with around 10% missing data (`fit2`)."----
par(mfrow=c(1,2))
for(j in 1:2){
  p1 = coef(fit1)[,,j]
  p2 = coef(fit2)[,,j]
  d  = max(abs(p1-p2))
  stopifnot(d < c(0.05, 0.03)[j])
  plot(p1, p2, pch = 16, asp = 1,
    main = paste(letters[j], 
      ": max diff=", signif(d,2), sep = ""),
    xlab = "no missing data",
    ylab = "10% of data missing")
  abline(a = 0, b = 1, col = "blue")
}

## ----spikein, warning = FALSE, message = FALSE-----------------------------
spikeins = 100:200
spfit = vsn2(kidney[spikeins,], lts.quantile=1)
nkid = predict(spfit, newdata=kidney)

## ----ref1, results = "hide"------------------------------------------------
ref = vsn2(lymphoma[, ismp[1:7]])

## ----ref2, results = "hide"------------------------------------------------
f8 = vsn2(lymphoma[, ismp[8]], reference = ref)

## ----ref3, results = "hide"------------------------------------------------
fall = vsn2(lymphoma[, ismp])

## ----ref4------------------------------------------------------------------
coefficients(f8)[,1,]
coefficients(fall)[,8,]

## ----ref, fig.small = TRUE, fig.cap = "Scatterplot of normalised intensities after normalisation by reference ($x$-axis, `f8`) and joint normalisation ($y$-axis, `fall`). There is good agreement."----
plot(exprs(f8), exprs(fall)[,8], pch = ".", asp = 1)
abline(a = 0, b = 1, col = "red")

## ----hiddenchecks, echo = FALSE--------------------------------------------
stopifnot(length(ismp)==8L)
maxdiff = max(abs(exprs(f8) - exprs(fall)[,8])) 
if(maxdiff>0.3)
  stop(sprintf("maxdiff is %g", maxdiff))

## ----nkid-calib1-----------------------------------------------------------
coef(fit)[1,,]

## ----nkid-calib2-----------------------------------------------------------
bkid = kidney
exprs(bkid)[,1] = 0.25*(500+exprs(bkid)[,1])

## ----nkid-calib3, results = "hide"-----------------------------------------
bfit = vsn2(bkid)

## ----nkid-calib4, warning = FALSE, fig.cap = "Scatterplot for the badly biased `bkid` data: log-log scale.", fig.small = TRUE----
plot(exprs(bkid), main = "raw", pch = ".", log = "xy")

## ----nkid-calib5, warning = FALSE, fig.cap = "Scatterplot for the badly biased `bkid` data: after calibration and transformation with vsn.", fig.small = TRUE----
plot(exprs(bfit), main = "vsn", pch = ".")
coef(bfit)[1,,]

## ----vsnQ1, results = "hide", fig.cap = "Scatterplot between the red and green intensities of the array of the lymphoma dataset after quantile normalisation followed by VSN variance stabilisation without calibration. ", fig.small = TRUE----
lym_q = normalizeQuantiles(exprs(lymphoma))
lym_qvsn = vsn2(lym_q, calib="none")
plot(exprs(lym_qvsn)[, 1:2], pch=".", main="lym_qvsn")

## ----vsnQ2, results = "hide", fig.cap = "Comparison of the values calculated in this section, for CH1 of the first array, to those of VSN variance stabilisation with affine calibration (`lym` was computed in Section \\@ref(sec:lymphoma)).", fig.small = TRUE----
plot(exprs(lym)[,1], exprs(lym_qvsn)[, 1], 
  main="lym_qvsn vs lym", pch=".", 
  ylab="lym_qvsn[,1]", xlab="lym[,1]")

## ----calcshrink, echo = FALSE, results = "hide"----------------------------
log2.na = function(x){
  w = which(x>0)
  res = rep(as.numeric(NA), length(x))
  res[w] = log2(x[w])
  return(res)
}
  
fc = 0.5                    ## true fold change
x2 = seq(0.5, 15, by=0.5)   ## 'true values' in sample 1
x1 = x2/fc                  ## 'true values' in sample 2
m = s = numeric(length(x1))
n  = 10000
sa = 1
b  = 1
sb = 0.1
sdeta = 0.1
for(i in 1:length(x1)){
  z1 = sa*rnorm(n)+x1[i]*b*exp(sb*rnorm(n))
  z2 = sa*rnorm(n)+x2[i]*b*exp(sb*rnorm(n))
  if(i%%2==1) {
    q = log2.na(z1/z2)
    m[i] = mean(q, na.rm=TRUE)
    s[i] = sd(q, na.rm=TRUE)
  } else {
    h = (asinh(z1/(sa*b/sb))-asinh(z2/(sa*b/sb)))/log(2)
    m[i] = mean(h)
    s[i] = sd(h)
  }
}

colq = c("black", "blue")
lty  = 1
pch  = c(20,18)
cex  = 1.4
lwd  = 2

## ----shrink, results = "hide", echo = FALSE, fig.cap = "The shrinkage property of the generalised log-ratio.  Blue diamonds and error bars correspond to mean and standard deviation of the generalised log-ratio $h$, as obtained from VSN, and black dots and error bars to the standard log-ratio $q$ (both base 2).", fig.small = TRUE----
mai = par("mai"); mai[3]=0; par(mai)
plot(x2, m, ylim=c(-2, 3.5), type="n", xlab=expression(x[2]), ylab="")
abline(h=-log2(fc), col="red", lwd=lwd, lty=1)
abline(h=0, col="black", lwd=1, lty=2)
points(x2, m, pch=pch, col=colq, cex=cex)
segments(x2, m-2*s, x2, m+2*s, lwd=lwd, col=colq, lty=lty)
legend(8.75, -0.1, c("q","h"), col=colq, pch=pch, lty=lty, lwd=lwd)

## ----figgraph, results = "hide", echo = FALSE, fig.cap = "Graphs of the functions. $y=\\log_2(x)$, $y=$glog$_2(x,c)=\\log_2(x+\\sqrt{x^2+c^2})-1$, and $y=\\log_2(x+x_{\\text{off}})$, where $c=50$ and $x_{\\text{off}}=50$.", fig.height = 5, fig.small = TRUE----
par(mai = c(0.8, 0.6, 0.01, 0.01))
x = seq(-70.5, 170.5, by=1)
cols = c("black", "blue", "darkgrey")
xoff = cc = 50
ymat = cbind(log2.na(x), log2( (x+sqrt(x^2+cc^2))/2 ), log2.na(x+xoff))
ylim = range(ymat, na.rm=TRUE)
matplot(x, ymat, 
        lty=c(1,1,2), col=cols, lwd=3, type="l", ylim=ylim, ylab="")
abline(v = 0, col = "#80808080", lty = 2)
legend(x = par("usr")[2], y = par("usr")[3], 
       legend = c(expression(y = log[2](x)), expression(y = glog[2](x,c)), expression(y = log[2](x+x[off]))), 
       fill=cols, density = c(NA, NA, 50), xjust=1.1, yjust=-0.1)

## ----lymbox, fig.cap = "Boxplot of A values of array CLL-13 stratified by within-sector row. The features in rows 22 and 23 are all very dim."----
colours = hsv(seq(0,1, length = nsr), 0.6, 1)
j = "CLL-13"
boxplot(A[, j] ~ arrayGeometry$spotrow, col = colours, main = j, ylab = "A", xlab = "spotrow")

## ----lymquscp, fig.cap = "MA-plot of the data from array `r j`. Dots coloured in orange are from rows 22 and 23. A possible explanation may be as follows (although I do not know for sure that this is the right explanation): The PCR product (cDNA) that is spotted on these arrays is put on by a print head that sucks cDNA out of microtitre plates and deposits them in spots one after another, row by row. If the content of one plate is faulty, this results in a set of subsequent spots that are faulty. Because the 16 print-tip sectors are spotted in parallel, this affects all sectors in the same way.", fig.small = TRUE----
plot(A[,j], M[,j], pch = 16, cex = 0.3,
  col = ifelse(arrayGeometry$spotrow%in%(22:23), "orange", "black"))
abline(h = 0, col = "blue")

## ----sessionInfo-----------------------------------------------------------
sessionInfo()

