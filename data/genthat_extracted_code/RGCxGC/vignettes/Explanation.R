## ----Fig 1, echo=FALSE, fig.cap= "Overview of general data processing in chromatography that is presented in the RGCxGC package. The double line between smooth andbaseline correction refers to the interchangeable pathway.", out.width= "80%",message=FALSE, warning=FALSE, paged.print=FALSE, fig.align='center'----
knitr::include_graphics("images/dataProcessing.png")

## ----Fig 2, echo=FALSE, fig.align="center", fig.cap="The basic workflow of RGCxGC package. The functions for each step are in parenthesis.", message=FALSE, warning=FALSE, out.width="80%", paged.print=FALSE----
knitr::include_graphics("images/basicWorkflow.png")

## ----Cran install, eval=FALSE, include=TRUE------------------------------
#  install.packages("RGCxGC")

## ----github install, eval=FALSE, include=TRUE----------------------------
#  library(devtools)
#  install_github("DanQui97/RGCxGC")

## ----library call--------------------------------------------------------
library(RGCxGC)

## ----Chrom import--------------------------------------------------------
chrom_08 <- system.file("extdata", "08GB.cdf", package = "RGCxGC")
MTBLS08 <- read_chrom(chrom_08, mod_time = 5L)
slotNames(MTBLS08)

## ----Chrom plot, message=FALSE, warning=FALSE, paged.print=FALSE, out.width= "60%"----
# nlevels: Number of levels
# color.palette: The color palette to employ
library(colorRamps)
plot(MTBLS08, nlevels = 100, color.palette = matlab.like)

## ----baseline correction, out.width= "60%"-------------------------------
MTBLS08_bc <- baseline_corr(MTBLS08)
plot(MTBLS08_bc, nlevels = 100, color.palette = matlab.like)

## ----smoothing, out.width= "60%"-----------------------------------------
# Linear penalty with lambda equal to 10
MTBLS08_sm1 <- wsmooth(MTBLS08_bc, penalty = 1, lambda = 1e1)
plot(MTBLS08_sm1, nlevels = 100, color.palette = matlab.like,
     main = expression(paste(lambda, "= 10, penalty = 1")) )

## ----smoothing 2, out.width= "60%"---------------------------------------
# Cuadratic penalty with lambda equal to 10
MTBLS08_sm2 <- wsmooth(MTBLS08_bc, penalty = 2, lambda = 1e1)
plot(MTBLS08_sm2, nlevels = 100, color.palette = matlab.like,
     main = expression(paste(lambda, "= 10, penalty = 2")) )

## ----2DCOW, out.width= "60%"---------------------------------------------
# Raw chromatogram
chrom_09 <- system.file("extdata", "09GB.cdf", package = "RGCxGC")
MTBLS09 <- read_chrom(chrom_09, mod_time = 5L)
# Baseline correction
MTBL09_bc <- baseline_corr(MTBLS09)
# Smoothing
MTBL09_sm2 <- wsmooth(MTBL09_bc, penalty = 2, lambda = 1e1)
# Alignment 
aligned <- twod_cow(sample_chrom = MTBLS08_sm2, ref_chrom =  MTBL09_sm2,
                   segments = c(10, 40), max_warp = c(1, 8))
plot(aligned, nlevels = 100, color.palette = matlab.like,
     main = "Aligned chromatogram")

## ----batch names---------------------------------------------------------
chrom_fl <- c(chrom_08, chrom_09)
chrom_fl

## ----batch alignment-----------------------------------------------------
St_carriege <- batch_2DCOW(chrom_fl, mod_time = 5L,
                           segments = c(20, 40),
                           max_warp = c(1, 8))

## ------------------------------------------------------------------------
allChrom <- join_chromatograms(MTBLS09, MTBLS08)

## ----metadata, message=FALSE, warning=FALSE, include=FALSE, paged.print=FALSE----
metadata <- data.frame(Names = c("08GB", "09GB", "14GB", "29GB", "34GB", "24GB"), stringsAsFactors = F)
metadata$Type = factor(c(rep("S. typhy Carriege", 3), rep("Control", 3)))

## ----print metadata, echo=FALSE------------------------------------------
knitr::kable(metadata)

## ----batch alignment 2---------------------------------------------------
data(MTBLS579)

## ----MPCA----------------------------------------------------------------
exp_MPCA <- m_prcomp(MTBLS579)
print(exp_MPCA)

## ----Scores, out.width= "60%"--------------------------------------------
scores(exp_MPCA)

## ----negative loadings, out.width= "60%"---------------------------------
# Negative loadings
plot_loading(exp_MPCA, type = "n", main = "Negative loadings",
             color.palette = matlab.like)

## ----positive loadings, out.width= "60%"---------------------------------
# Negative loadings
plot_loading(exp_MPCA, type = "p", main = "Positive loadings",
             color.palette = matlab.like)

