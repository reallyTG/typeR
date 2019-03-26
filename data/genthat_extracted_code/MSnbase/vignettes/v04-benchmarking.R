## ----env, echo=FALSE, message=FALSE----------------------------------------
suppressPackageStartupMessages(library("BiocStyle"))
suppressPackageStartupMessages(library("MSnbase"))
suppressPackageStartupMessages(library("BiocParallel"))

## ----msdata----------------------------------------------------------------
library("msdata")
f <- msdata::proteomics(full.names = TRUE,
                        pattern = "TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01.mzML.gz")
basename(f)

## ----verb------------------------------------------------------------------
library("MSnbase")
setMSnbaseVerbose(FALSE)

## ----read1-----------------------------------------------------------------
system.time(inmem <- readMSData(f, msLevel = 2,
                                mode = "inMemory",
                                centroided = TRUE))

## ----read2-----------------------------------------------------------------
system.time(ondisk <- readMSData(f, msLevel = 2,
                                  mode = "onDisk",
                                  centroided = TRUE))

## ----equal12---------------------------------------------------------------
all.equal(inmem, ondisk)

## --------------------------------------------------------------------------
library("pryr")
object_size(inmem)
object_size(ondisk)

## ----plot0, eval=FALSE-----------------------------------------------------
#  plot(inmem[[200]], full = TRUE)
#  plot(ondisk[[200]], full = TRUE)

## ----plot1, echo=FALSE, fig.wide=TRUE, fig.cap = "Plotting in-memory and on-disk spectra"----
suppressMessages(requireNamespace("gridExtra"))
gridExtra::grid.arrange(plot(inmem[[200]],  full = TRUE),
                        plot(ondisk[[200]], full = TRUE),
                        ncol = 2)


## ----mb, cache=TRUE--------------------------------------------------------
library("microbenchmark")
mb <- microbenchmark(spectra(inmem),
                     inmem[[200]],
                     spectra(ondisk),
                     ondisk[[200]],
                     times = 10)
mb

## ----subset----------------------------------------------------------------
i <- sample(length(inmem), 100)
system.time(inmem[i])
system.time(ondisk[i])

## ----qnt, cache=TRUE-------------------------------------------------------
system.time(eim <- quantify(inmem[1:100], reporters = TMT6,
                            method = "max"))
system.time(eod <- quantify(ondisk[1:100], reporters = TMT6,
                            method = "max"))
all.equal(eim, eod, check.attributes = FALSE)

## ----vigs, eval=FALSE------------------------------------------------------
#  vignette(package = "MSnbase")

