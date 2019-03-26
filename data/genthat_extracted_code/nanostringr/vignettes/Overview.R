## ----setupQualityMeasures, message = FALSE, echo = FALSE, warning = FALSE----
library(knitr)
library(dplyr)
knitr::opts_chunk$set(
	echo = TRUE,
	fig.height = 6,
	fig.width = 7,
	message = FALSE,
	warning = FALSE,
	results = "asis"
)
# Define colors constants----
COL.OVD <- "#66C2A5"
COL.OVO <- "#A6D854"
COL.OVCL <- "#FC8D62"
COL.HLD <- "#8DA0CB"
COL.HLO <- "#E78AC3"
getNum <- function(str.vect) {
  sapply(strsplit(str.vect, "[_]"), "[[", 2)
}

## ----NanoStringQC, message=TRUE, echo=TRUE-------------------------------
library(nanostringr)
expOVD <- NanoStringQC(ovd.r, subset(expQC, OVD == "Yes"))
expOVO <- NanoStringQC(ovo.r, subset(expQC, OVO == "Yes"))
expOVCL <- NanoStringQC(ovc.r, subset(expQC, OVCL == "Yes"))
expHLD <- NanoStringQC(hld.r, subset(expQC, HLD == "Yes"))
expHLO <- NanoStringQC(hlo.r, subset(expQC, HLO == "Yes"))
expQC <- rbind(expHLD, expOVD, expHLO, expOVO, expOVCL)
expQC$cohort <- factor(c(rep("HLD", nrow(expHLD)), 
                rep("OVD", nrow(expOVD)), rep("HLO", nrow(expHLO)),
                rep("OVO", nrow(expOVO)), rep("OVCL", nrow(expOVCL))))
expQC <- expQC %>% 
  mutate(cohort = factor(stringr::str_replace_all(cohort,
                                                  c("HLD" = "HL",
                                                    "OVD" = "OC")),
                         levels = c("HL", "OC", "OVCL", "HLO", "OVO")))

## ----perFOVPlot, fig.cap="Samples that failed imaging QC based on percent fields of view (FOV) counted across cohorts."----
boxplot(perFOV ~ cohort, ylab = "% FOV", main = "% FOV by Cohort", data = expQC, pch = 20,
        col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO))
abline(h = 75, lty = 2, col = "red")
grid(NULL, NULL, lwd = 1)

## ----linPCPlot, fig.cap="Plot of $R^2$ of positive control probes from samples across all cohorts."----
boxplot(linPC ~ cohort, ylab = expression(R ^ 2), main = "Linearity of Positive Controls by Cohort",
        data = expQC, pch = 20, col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO), ylim = c(0, 1))
abline(h = 0.95, lty = 2, col = "red")
grid(NULL, NULL, lwd = 1)

## ----averageHKPlot, fig.cap="Average log expression of Housekeeping genes by Cohort."----
boxplot(averageHK ~ cohort, ylab = "Average log HK expression",
        main = "Average log expression of Housekeeping genes by Cohort", data = expQC, pch = 20,
        col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO))
abline(h = 50, lty = 2, col = "red")
grid(NULL, NULL, lwd = 1)

## ----lodPlot, fig.cap="Limit of detection by cohort."--------------------
boxplot(lod ~ cohort, ylab = "LOD", main = "Limit of detection (LOD) by Cohort",
        data = expQC, pch = 20, col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO))
abline(h = 50, lty = 2, col = "red")
grid(NULL, NULL, lwd = 1)

## ----pergdPlot, fig.cap="Percent genes of total (excluding controls) detected above the limit of detection."----
boxplot(pergd ~ cohort, data = expQC, border = "white",
       ylab = "% Genes Detected", 
       main = "Percent of Genes Detected Above \n the Limit of Detection", 
       pch = 20, col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO))
abline(h = 50, lty = 2, col = "red")
grid(NULL, NULL, lwd = 1)
stripchart(pergd ~ cohort, data = expQC, 
           vertical = TRUE, method = "jitter",  
           pch = 20, cex = 0.4 , col = "#3A6EE3", 
           add = TRUE) 

## ----snPlot, fig.cap="Signal to Noise versus % Gene Detected by cohort."----
sn <- 100
detect <- 60

plot(expOVD$sn, expOVD$pergd, pch = 20, col = COL.OVD, xaxt = "n", ylim = c(0, 100), xlim = range(expOVD$sn),
     xlab = "Signal to Noise Ratio", ylab = "% Genes Detected")
points(expOVO$sn, expOVO$pergd, pch = 20, col = COL.OVO)
points(expOVCL$sn, expOVCL$pergd, pch = 20, col = COL.OVCL)
points(expHLD$sn, expHLD$pergd, pch = 20, col = COL.HLD)
points(expHLO$sn, expHLO$pergd, pch = 20, col = COL.HLO)
axis(1, at = seq(0, max(expQC$sn) + 1, 300))
abline(v = sn, col = "red", lwd = 2)
abline(h = detect, lty = 2)
title("Signal to Noise vs \n Ratio of Genes Detected")
legend("bottomright", c("HL", "OC", "OVCL", "HLO", "OVO"), pch = 20, bty = 'n',
       col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO))

## ----snZoom, fig.cap="Signal to Noise versus % Gene Detected by cohort zoomed in to the area of possible failures."----
plot(expOVD$sn, expOVD$pergd, pch = 20, col = COL.OVD, xaxt = "n", ylim = c(0, 100), xlim = c(0, 6000),
     xlab = "Signal to Noise Ratio ", ylab = "Ratio of Genes Detected")
points(expOVO$sn, expOVO$pergd, pch = 20, col = COL.OVO)
points(expOVCL$sn, expOVCL$pergd, pch = 20, col = COL.OVCL)
points(expHLD$sn, expHLD$pergd, pch = 20, col = COL.HLD)
points(expHLO$sn, expHLO$pergd, pch = 20, col = COL.HLO)
axis(1, at = seq(0, max(expQC$sn) + 1, 300))

abline(v = sn, col = "red", lwd = 2)
abline(h = detect, lty = 2)
title("Signal to Noise vs \n Ratio of Genes Detected (Zooming-in)")
legend("bottomright", c("HL", "OC", "OVCL", "HLO", "OVO"), pch = 20, bty = 'n',
       col = c(COL.HLD, COL.OVD, COL.OVCL, COL.HLO, COL.OVO))

## ----HKnorm--------------------------------------------------------------
expHLD0 <- expHLD
any(expHLD0$QCFlag == "Failed")
expHLD0$sampleID[which(expHLD0$QCFlag == "Failed")]

## ----remove_samples------------------------------------------------------
expHLD <- filter(expHLD0, sampleID != "HL1_18" & sampleID != "HL2_18")
hld <- hld.r[, !colnames(hld.r) %in% c("HL1_18", "HL2_18")]

## ----normalize_HK--------------------------------------------------------
# If data already log normalized
hld.n <- HKnorm(hld, is.logged = TRUE)

# Otherwise, normalize to HK 
hld.n <- HKnorm(hld)
hld1 <- hld.n[, grep("HL1", colnames(hld.n))]
exp.hld1 <- subset(expHLD, geneRLF == "HL1")

hld2 <- hld.n[, grep("HL2", colnames(hld.n))]
exp.hld2 <- subset(expHLD, geneRLF == "HL2")

## ----refMethod-----------------------------------------------------------
r <- 3 # The number of references to use
choice.refs <- exp.hld1$sampleID[sample((1:dim(exp.hld1)[1]), r, replace = F)] # select reference samples randomly
R1 <- t(hld1[, choice.refs])
R2 <- t(hld2[, paste("HL2", getNum(choice.refs), sep = "_")])
Y <- t(hld2[, !colnames(hld2) %in% paste("HL2", getNum(choice.refs), sep = "_")])
S2.r <- t(refMethod(Y, R1, R2)) # Data from CodeSet 2 now calibrated for CodeSet 1

## ----plot_gene-----------------------------------------------------------
set.seed(2016)
gene <- sample(1:nrow(hld1), 1)
par(mfrow = c(1, 2))
plot(t(hld1[gene, ]), t(hld2[gene, ]), xlab = "HL1", ylab = "HL2",
     main = "No Correction")
abline(0, 1)

plot(t(hld1[gene, !(colnames(hld1) %in% choice.refs)]), t(S2.r[gene, ]),
     xlab = "HL1", ylab = "HL2", main = "Corrected")
abline(0, 1)

