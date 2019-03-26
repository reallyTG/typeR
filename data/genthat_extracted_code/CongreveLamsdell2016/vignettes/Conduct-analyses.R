## ------------------------------------------------------------------------
# Directory in which to install MrBayes
BAYES_DIR <- "C:/Research/MrBayes"

# Directory in which to conduct parsimony analysis
HOME <- "C:/Research/iw" # Must not end in a trailing '/'

# GitHub remote
INST_ROOT <- "https://raw.githubusercontent.com/ms609/CongreveLamsdell2016/master/inst/"

## ----eval=FALSE----------------------------------------------------------
#  MRBAYES_RELEASE <- "https://github.com/NBISweden/MrBayes/releases/download/v3.2.6/MrBayes-3.2.6_WIN32_x64.zip"
#  zipFile <- paste0(BAYES_DIR, '/MrBayes.zip')
#  download.file(MRBAYES_RELEASE, destfile=zipFile, method='auto', mode='wb')
#  unzip(zipFile, c('MrBayes/mrbayes_x64.exe', 'MrBayes/mrbayes_x86.exe'),
#        exdir=BAYES_DIR, junkpaths=TRUE)
#  file.remove(zipFile)

## ----eval=FALSE----------------------------------------------------------
#  tempFile <- tempfile(fileext='.zip')
#  download.file("https://datadryad.org/bitstream/handle/10255/dryad.108351/S5%20-%20Character%20Weights%20Test%20NEXUS%20files.zip", tempFile)
#  unzip(tempFile, exdir=paste0(BAYES_DIR, '/iw'), junkpaths=TRUE,
#        files = paste0('Weights tests/', formatC(1:100, width=3, flag=0), '.txt.nex'))
#  file.remove(tempFile)

## ----eval=FALSE----------------------------------------------------------
#  download.file(paste0(INST_ROOT, "analysis-bayesian/mrbayesblock.nex"),
#                paste0(BAYES_DIR, '/iw/mrbayesblock.nex'))
#  
#  bayesGenPath <- paste0(BAYES_DIR, '/bayesgen.pl')
#  download.file(paste0(INST_ROOT, "analysis-bayesian/bayesgen.pl"), bayesGenPath)
#  bayesGen <- readLines(bayesGenPath)
#  bayesGen[5] <- paste0('$dir = "', BAYES_DIR, '/iw";')
#  bayesGen[6] <- paste0('$bayes_dir = "', BAYES_DIR, '";')
#  writeLines(bayesGen, bayesGenPath)
#  
#  t2nexPath <- paste0(BAYES_DIR, '/t2nex.pl')
#  download.file(paste0(INST_ROOT, "analysis-bayesian/t2nex.pl"), t2nexPath)
#  t2nex <- readLines(t2nexPath)
#  t2nex[2] <- paste0('$dir = "', BAYES_DIR, '/iw";')
#  writeLines(t2nex, t2nexPath)

## ----eval=FALSE----------------------------------------------------------
#  sapply(paste0(HOME, '/', c('', 'Matrices', 'Trees')), dir.create)
#  sapply(paste0(HOME, '/Trees/', c('eq', 'k1', 'k2', 'k3', 'k5', 'kX')), dir.create)

## ----eval=FALSE, message=FALSE-------------------------------------------
#  zipFile <- paste0(HOME, '/TNT.ZIP')
#  # This is the Windows path; use the appropriate path for your operating system
#  download.file("http://www.lillo.org.ar/phylogeny/tnt/ZIPCHTNT.ZIP",
#                destfile=zipFile, method='auto', mode='wb')
#  unzip(zipFile, 'tnt.exe', exdir=HOME)
#  file.remove(zipFile)

## ----eval=FALSE----------------------------------------------------------
#  tnt2nexPath <-  paste0(HOME, '/tnt2nex.pl')
#  mptgenPath <-  paste0(HOME, '/mptgen.pl')
#  
#  download.file(paste0(INST_ROOT, "analysis-parsimony/tnt2nex.pl"), tnt2nexPath)
#  tnt2nex <- readLines(tnt2nexPath)
#  tnt2nex[3] <- paste0('$dir = "', HOME, '/Trees";')
#  writeLines(tnt2nex, tnt2nexPath)
#  
#  download.file(paste0(INST_ROOT, "analysis-parsimony/mptgen.pl"), mptgenPath)
#  mptgen <- readLines(mptgenPath)
#  mptgen[3] <- paste0('$dir = "', HOME, '";')
#  writeLines(mptgen, mptgenPath)

## ----eval=FALSE----------------------------------------------------------
#  download.file(paste0(INST_ROOT, "analysis-parsimony/tnt_template.run"),
#                paste0(HOME, '/tnt_template.run'))

## ----eval=FALSE----------------------------------------------------------
#  tempFile <- tempfile(fileext='.zip')
#  download.file("https://datadryad.org/bitstream/handle/10255/dryad.101095/S1%20-%20TNT%20files.zip", tempFile)
#  unzip(tempFile, exdir=paste0(HOME, '/Matrices'))

