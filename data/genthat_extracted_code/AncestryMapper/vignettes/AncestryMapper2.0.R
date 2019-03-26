## ---- eval=FALSE---------------------------------------------------------
#  $plink --bfile All-00
#   --bmerge Prep.bed Prep.bim Prep.fam
#   --make-bed --out PrepMerge

## ---- eval=FALSE---------------------------------------------------------
#  $plink --bfile Prep --flip PrepMerge-merge.missnp --make-bed --out PrepFlipped
#  
#  $plink --bfile All-00
#   --bmerge PrepFlipped.bed PrepFlipped.bim PrepFlipped.fam
#   --make-bed --out PrepMerge

## ---- eval=FALSE---------------------------------------------------------
#  $plink --bfile PrepMerge --remove IndRm --make-bed --out PrepMerge

## ---- eval=FALSE---------------------------------------------------------
#   $plink --bfile PrepMerge --transpose --recode --write-snplist --out PrepFinal

## ---- eval=FALSE---------------------------------------------------------
#  library(AncestryMapper)
#  
#  #Path to folder containing population references
#  Refs <- system.file('data', package = 'AncestryMapper')
#  
#  #Path to folder containing samples in tPED format
#  tpeds <- system.file('extdata', package = 'AncestryMapper')
#  
#  #Path to CorPheno file
#  Corpheno <- system.file('extdata', 'CorPheno', package = 'AncestryMapper')
#  
#  #Path to dbSNP allele data file
#  All00Frq <- system.file('data', 'MinMaxFreq.rda', package = 'AncestryMapper')
#  

## ---- eval=FALSE---------------------------------------------------------
#  genetic.distance <- calculateAMidsArith(pathTotpeds = tpeds,
#         NameOut = 'Example',
#         pathToAriMedoids = Refs,
#         pathAll00 = All00Frq)

## ---- eval=FALSE---------------------------------------------------------
#  plotAMids(AMids = genetic.distance, phenoFile = Corpheno, columnPlot = 'I')

## ---- eval=FALSE---------------------------------------------------------
#  #Path to folder containing samples for each population in tPED format
#  tpeds <- system.file("extdata", package = "AncestryMapper")
#  
#  #Path to dbSNP allele data file
#  All00Frq <- system.file("data", "MinMaxFreq.rda", package = "AncestryMapper")
#  
#  createMedoid(pathTotpeds = tpeds, pathAll00 = All00Frq)

