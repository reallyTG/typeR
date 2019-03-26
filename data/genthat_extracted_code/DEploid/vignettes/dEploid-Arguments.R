## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
library(DEploid)

vcfFile = system.file("extdata", "PG0390-C.test.vcf.gz", package = "DEploid")
PG0390 = extractCoverageFromVcf(vcfFile)
plotAltVsRef( PG0390$refCount, PG0390$altCount )

## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
obsWSAF = computeObsWSAF( PG0390$altCount, PG0390$refCount )
histWSAF(obsWSAF)

## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
plafFile = system.file("extdata", "labStrains.test.PLAF.txt", package = "DEploid")
plaf = extractPLAF(plafFile)
panelFile = system.file("extdata", "labStrains.test.panel.txt", package = "DEploid")

## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
set.seed(1)
PG0390.deconv = dEploid(paste("-vcf", vcfFile, "-plaf", plafFile, "-panel", panelFile))
prop = PG0390.deconv$Proportions[dim(PG0390.deconv$Proportions)[1],]
expWSAF = t(PG0390.deconv$Haps) %*% prop

## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
plotWSAFvsPLAF(plaf, obsWSAF, expWSAF)

## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
plotProportions(PG0390.deconv$Proportions)

## ---- fig.show='hold', fig.width=5, fig.height=5-------------------------
plotObsExpWSAF(obsWSAF, expWSAF)

