## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE, include = FALSE--------------------------------------
if (getRversion() >= "3.6") {
  knitr::opts_chunk$set(eval = FALSE)
}
required <- c("faahKO")
if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE))))) {
  knitr::opts_chunk$set(eval = FALSE)
}

## ---- out.width = "700px", echo = FALSE----------------------------------
knitr::include_graphics("../man/figures/parallelAnnotation.png")

## ---- eval = FALSE-------------------------------------------------------
#  setRepositories(ind=1:4)
#  install.packages('faahKO')

## ---- echo = FALSE, include = FALSE--------------------------------------
# hide package load message
library(faahKO)

## ------------------------------------------------------------------------
library(faahKO)
## file paths
input_spectraPaths  <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko18.CDF', package = "faahKO"))
input_spectraPaths

## ---- eval = FALSE-------------------------------------------------------
#  # targetFeatTable
#  input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
#  input_targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
#  input_targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
#  input_targetFeatTable[,c(3:8)] <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)

## ---- results = "asis", echo = FALSE-------------------------------------
input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
input_targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_targetFeatTable[,c(3:8)] <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)
rownames(input_targetFeatTable) <- NULL
pander::pandoc.table(input_targetFeatTable, digits = 9)

## ---- eval = FALSE-------------------------------------------------------
#  # spectra Metadata
#  input_spectraMetadata  <- data.frame(matrix(c("sample type 1", "sample type 2", "sample type 1"), 3, 1, dimnames=list(c(), c("sampleType"))), stringsAsFactors=F)

## ---- results = "asis", echo = FALSE-------------------------------------
input_spectraMetadata  <- data.frame(matrix(c("sample type 1", "sample type 2", "sample type 1"), 3, 1, dimnames=list(c(), c("sampleType"))), stringsAsFactors=F)
pander::pandoc.table(input_spectraMetadata)

## ------------------------------------------------------------------------
library(peakPantheR)
init_annotation <- peakPantheRAnnotation(spectraPaths = input_spectraPaths,
                                         targetFeatTable = input_targetFeatTable,
                                         spectraMetadata = input_spectraMetadata)

## ------------------------------------------------------------------------
init_annotation

## ------------------------------------------------------------------------
# annotate files serially
annotation_result <- peakPantheR_parallelAnnotation(init_annotation, ncores=0, verbose=TRUE)

# successful fit
nbSamples(annotation_result$annotation)
data_annotation   <- annotation_result$annotation
data_annotation

# list failed fit
annotation_result$failures

## ------------------------------------------------------------------------
updated_annotation  <- annotationParamsDiagnostic(data_annotation, verbose=TRUE)

# uROI now exist
updated_annotation

## ---- eval = FALSE-------------------------------------------------------
#  # create a colourScale based on the sampleType
#  uniq_sType <- sort(unique(spectraMetadata(updated_annotation)$sampleType),na.last=TRUE)
#  col_sType  <- unname( setNames(c('blue', 'red'),c(uniq_sType))[spectraMetadata(updated_annotation)$sampleType] )
#  
#  # output fit diagnostic to disk
#  outputAnnotationDiagnostic(updated_annotation, saveFolder='/output_folder/', savePlots=TRUE, sampleColour=col_sType, verbose=TRUE)

## ---- results = "asis", echo = FALSE-------------------------------------
tmp_csv      <- data.frame(matrix(nrow=2,ncol=21,dimnames=list(c(), c('cpdID', 'cpdName', 'X', 'ROI_rt', 'ROI_mz','ROI_rtMin', 'ROI_rtMax', 'ROI_mzMin', 'ROI_mzMax', 'X', 'uROI_rtMin', 'uROI_rtMax', 'uROI_mzMin', 'uROI_mzMax', 'uROI_rt', 'uROI_mz', 'X', 'FIR_rtMin', 'FIR_rtMax', 'FIR_mzMin', 'FIR_mzMax'))), stringsAsFactors=FALSE)
tmp_csv[1,]  <- c('ID-1', 'Cpd 1', '|', 3344.888, 522.2, 3310., 3390., 522.194778, 522.205222, '|', 3305.75893, 3411.436284, 522.194778, 522.205222, 3344.888, 522.2, '|', 3326.10635, 3407.272648, 522.194778, 522.205222)
tmp_csv[2,]  <- c('ID-2', 'Cpd 2', '|', 3385.577, 496.2, 3280., 3440., 496.195038, 496.204962, '|', 3337.376665, 3462.449033, 496.195038, 496.204962, 3385.577, 496.2, '|', 3365.023857, 3453.404957, 496.195038, 496.204962)
tmp_csv[,-c(1,2,3,10,17)]  <- sapply(tmp_csv[,-c(1,2,3,10,17)], as.numeric)
colnames(tmp_csv) <- c('cpdID', 'cpdName', 'X', 'ROI_rt', 'ROI_mz','ROI_rtMin', 'ROI_rtMax', 'ROI_mzMin', 'ROI_mzMax', 'X', 'uROI_rtMin', 'uROI_rtMax', 'uROI_mzMin', 'uROI_mzMax', 'uROI_rt', 'uROI_mz', 'X', 'FIR_rtMin', 'FIR_rtMax', 'FIR_mzMin', 'FIR_mzMax')
pander::pandoc.table(tmp_csv, digits=9)

## ---- out.width = "700px", echo = FALSE----------------------------------
knitr::include_graphics("../man/figures/parallel_annotation_diagnostic_cpd1.png")

## ---- eval = FALSE-------------------------------------------------------
#  update_csv_path <- '/path_to_new_csv/'
#  
#  # load csv
#  new_annotation <- peakPantheR_loadAnnotationParamsCSV(update_csv_path)
#  #> uROIExist set to TRUE
#  #> New peakPantheRAnnotation object initialised for 2 compounds
#  
#  new_annotation
#  #> An object of class peakPantheRAnnotation
#  #>  2 compounds in 0 samples.
#  #>   updated ROI exist (uROI)
#  #>   does not use updated ROI (uROI)
#  #>   does not use fallback integration regions (FIR)
#  #>   is not annotated

## ------------------------------------------------------------------------
## new files
new_spectraPaths  <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                       system.file('cdf/WT/wt15.CDF', package = "faahKO"),
                       system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                       system.file('cdf/WT/wt16.CDF', package = "faahKO"),
                       system.file('cdf/KO/ko18.CDF', package = "faahKO"),
                       system.file('cdf/WT/wt18.CDF', package = "faahKO"))

## ---- echo = FALSE-------------------------------------------------------
new_spectraPaths

## ------------------------------------------------------------------------
## new spectra metadata
new_spectraMetadata  <- data.frame(matrix(c("KO", "WT", "KO", "WT", "KO", "WT"), 6, 1, dimnames=list(c(), c("Group"))), stringsAsFactors=F)

## ---- results = "asis", echo = FALSE-------------------------------------
new_spectraMetadata  <- data.frame(matrix(c("KO", "WT", "KO", "WT", "KO", "WT"), 6, 1, dimnames=list(c(), c("Group"))), stringsAsFactors=F)
pander::pandoc.table(new_spectraMetadata)

## ---- echo=FALSE---------------------------------------------------------
new_annotation <- resetAnnotation(updated_annotation, spectraPaths=new_spectraPaths, spectraMetadata=new_spectraMetadata, useUROI=TRUE, useFIR=TRUE, verbose=FALSE) 

## ---- eval=FALSE---------------------------------------------------------
#  ## add new samples to the annotation loaded from csv, useUROI, useFIR
#  
#  new_annotation <- resetAnnotation(new_annotation, spectraPaths=new_spectraPaths, spectraMetadata=new_spectraMetadata, useUROI=TRUE, useFIR=TRUE)
#  #> peakPantheRAnnotation object being reset:
#  #>   Previous "ROI", "cpdID" and "cpdName" value kept
#  #>   Previous "uROI" value kept
#  #>   Previous "FIR" value kept
#  #>   Previous "cpdMetadata" value kept
#  #>   New "spectraPaths" value set
#  #>   New "spectraMetadata" value set
#  #>   Previous "uROIExist" value kept
#  #>   New "useUROI" value set
#  #>   New "useFIR" value set

## ------------------------------------------------------------------------
new_annotation

## ------------------------------------------------------------------------
# annotate files serially
new_annotation_result <- peakPantheR_parallelAnnotation(new_annotation, ncores=0, verbose=FALSE)

# successful fit
nbSamples(new_annotation_result$annotation)

final_annotation      <- new_annotation_result$annotation
final_annotation

# list failed fit
new_annotation_result$failures

## ---- eval = FALSE-------------------------------------------------------
#  # create a colourScale based on the sampleType
#  uniq_group <- sort(unique(spectraMetadata(final_annotation)$Group),na.last=TRUE)
#  col_group  <- unname( setNames(c('blue', 'red'),c(uniq_sType))[spectraMetadata(final_annotation)$Group] )
#  
#  # output fit diagnostic to disk
#  outputAnnotationDiagnostic(final_annotation, saveFolder='/final_output_folder/', savePlots=TRUE, sampleColour=col_group, verbose=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # peakTables for the first sample
#  peakTables(final_annotation)[[1]]

## ---- results = "asis", echo = FALSE-------------------------------------
pander::pandoc.table(peakTables(final_annotation)[[1]])

## ---- eval=FALSE---------------------------------------------------------
#  # Extract the found peak area for all compounds and all samples
#  annotationTable(final_annotation, column='peakArea')

## ---- results = "asis", echo = FALSE-------------------------------------
pander::pandoc.table(annotationTable(final_annotation, column='peakArea'))

## ---- eval=FALSE---------------------------------------------------------
#  # save
#  outputAnnotationResult(final_annotation, saveFolder='/final_output_folder/', annotationName='ProjectName', verbose=TRUE)
#  #> Compound metadata saved at /final_output_folder/ProjectName_cpdMetadata.csv
#  #> Spectra metadata saved at /final_output_folder/ProjectName_spectraMetadata.csv
#  #> Peak measurement "found" saved at /final_output_folder/ProjectName_found.csv
#  #> Peak measurement "rtMin" saved at /final_output_folder/ProjectName_rtMin.csv
#  #> Peak measurement "rt" saved at /final_output_folder/ProjectName_rt.csv
#  #> Peak measurement "rtMax" saved at /final_output_folder/ProjectName_rtMax.csv
#  #> Peak measurement "mzMin" saved at /final_output_folder/ProjectName_mzMin.csv
#  #> Peak measurement "mz" saved at /final_output_folder/ProjectName_mz.csv
#  #> Peak measurement "mzMax" saved at /final_output_folder/ProjectName_mzMax.csv
#  #> Peak measurement "peakArea" saved at /final_output_folder/ProjectName_peakArea.csv
#  #> Peak measurement "maxIntMeasured" saved at /final_output_folder/ProjectName_maxIntMeasured.csv
#  #> Peak measurement "maxIntPredicted" saved at /final_output_folder/ProjectName_maxIntPredicted.csv
#  #> Peak measurement "is_filled" saved at /final_output_folder/ProjectName_is_filled.csv
#  #> Peak measurement "ppm_error" saved at /final_output_folder/ProjectName_ppm_error.csv
#  #> Peak measurement "rt_dev_sec" saved at /final_output_folder/ProjectName_rt_dev_sec.csv
#  #> Peak measurement "tailingFactor" saved at /final_output_folder/ProjectName_tailingFactor.csv
#  #> Peak measurement "asymmetryFactor" saved at /final_output_folder/ProjectName_asymmetryFactor.csv
#  #> Summary saved at /final_output_folder/ProjectName_summary.csv

