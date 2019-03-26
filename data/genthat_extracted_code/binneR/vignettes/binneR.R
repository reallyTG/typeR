## ----echo = FALSE, message = TRUE----------------------------------------
hasData <- requireNamespace("metaboData", quietly = TRUE) 
if (!hasData) {
knitr::opts_chunk$set(eval = FALSE) 
msg <- paste("Note: Examples in this vignette require that the",
"`metaboData` package be installed. The system",
"currently running this vignette does not have that package",
"installed, so code examples will not be evaluated.")
msg <- paste(strwrap(msg), collapse = "\n")
message(msg)
}

## ----libraryLoad,echo=FALSE,include=FALSE--------------------------------
packages <- c('binneR','metaboData','mzR','ggplot2','dplyr','magrittr')
lapply(packages,library,character.only = T)

## ----sticker, echo=FALSE-------------------------------------------------
htmltools::img(src = knitr::image_uri(system.file('sticker/binneRsticker.png',package = 'binneR')),
  style = 'display:block;margin-left:auto;margin-right:auto; height:200px;') 

## ----FIEfingerprint, echo=FALSE, fig.width=7,fig.height=5,fig.align='center',fig.show='animate',animation.hook = 'gifski',interval=0.1,dev='png',aniopts=('controls,loop')----

file <- filePaths('FIE-HRMS','BdistachyonEcotypes')[1]
ms <- openMSfile(file)
chrom <- mzR::header(ms)

is <- detectInfusionScans(file)
buffer <- 10
is <- c(1,is[2] + buffer)

spectrum <- peaks(ms) %>%
	purrr::map(as_tibble) %>%
	bind_rows(.id = 'seqNum') %>%
	rename(`m/z` = V1,Abundance = V2) %>%
	mutate(seqNum = as.numeric(seqNum)) %>%
	left_join(chrom %>%
							select(seqNum,polarity),by = 'seqNum') %>%
	filter(polarity == 0) %>%
	left_join(tibble(seqNum = unique(.$seqNum),Scan = 1:length(unique(.$seqNum))),by = 'seqNum') %>%
	filter(Scan >= is[1] & Scan <= is[2]) %>%
	mutate(Bin = `m/z` %>% round(2)) %>%
	group_by(Scan,Bin) %>%
	summarise(Abundance = sum(Abundance))

lim <- max(spectrum$Abundance) + 1000

chrom <- chrom %>%
	filter(polarity == 0)
chrom$acquisitionNum <- 1:nrow(chrom)

	for (i in is[1]:is[2]) {
	p <- list()
	
	p$chromatogram <- ggplot(chrom,aes(x = acquisitionNum,y = totIonCurrent)) + 
		geom_line() +
		geom_vline(xintercept = i, linetype = "dashed",colour = 'red') +
		theme_bw(base_size = 10) +
		xlab('Scan Number') +
		ylab('Total Ion Count') +
		ggtitle('Chromatogram')
	
	p$spectrum <- spectrum %>%
		filter(Scan == i) %>%
		{
			ggplot(.,aes(x = Bin, y = 0, xend = Bin, yend = Abundance)) +
				geom_segment() +
				theme_bw() +
				labs(title = 'Spectrum',
						 x = 'm/z',
						 y = 'Abundance') +
				ylim(0,lim) +
				xlim(0,1000)
		}
	
	gridExtra::grid.arrange(gridExtra::arrangeGrob(p$chromatogram,p$spectrum))
}

## ----libraryLoads,eval=FALSE---------------------------------------------
#  library(binneR)
#  library(metaboData)

## ----infusionScanDetection-----------------------------------------------
infusionScans <- detectInfusionScans(
		metaboData::filePaths('FIE-HRMS','BdistachyonEcotypes')[1],
	sranges = list(c(70,1000)),
	thresh = 0.5
)
infusionScans

## ----exampleChromatograms, fig.width=7,fig.height=5,fig.align='center'----
plotChromFromFile(
	metaboData::filePaths('FIE-HRMS','BdistachyonEcotypes')[1],
	sranges = list(c(70,1000)),
	scans = infusionScans
)

## ----fileList------------------------------------------------------------
file <- metaboData::filePaths('FIE-HRMS','BdistachyonEcotypes')[1]

## ----readFilesExample----------------------------------------------------
res <- readFiles(file,
								 dp = 2,
								 scans = infusionScans,
								 sranges = list(c(50, 1000)),
								 modes = c("n","p"),
								 nCores = 1)

## ----readFiles-----------------------------------------------------------
str(res)

## ----binParameterExample-------------------------------------------------
binParameters()

## ----parameterChangeExample----------------------------------------------
binParameters(scans = 6:14)

## ----parameterChangeExample2---------------------------------------------
parameters <- binParameters()
parameters@scans <- 6:14
parameters

## ----exampleFiles--------------------------------------------------------
files <-  metaboData::filePaths('FIE-HRMS','BdistachyonEcotypes')

info <- metaboData::runinfo('FIE-HRMS','BdistachyonEcotypes')

## ----infoMatchFiles------------------------------------------------------
TRUE %in% (info$fileName != basename(files))

## ----exampleProcessing,eval=FALSE----------------------------------------
#  analysis <- binneRlyse(files,info,binParameters(scans = detectInfusionScans(files),cls = 'class'))

## ----processing,echo=FALSE-----------------------------------------------
analysis <- binneRlyse(files,info,binParameters(scans = detectInfusionScans(files),cls = 'class',nCores = 2,clusterType = 'PSOCK'))

## ----printAnalysis,echo=FALSE--------------------------------------------
analysis

## ----analysisChromatogram, fig.width=7,fig.height=5,fig.align='center'----
plotChromatogram(analysis)

## ----analysisFingerprints, fig.width=7,fig.height=5,fig.align='center'----
plotFingerprint(analysis)

## ----analysisTICs, fig.width=7,fig.height=5,fig.align='center'-----------
plotTIC(analysis)

## ----plotBin, fig.width=7,fig.height=5,fig.align='center'----------------
plotBin(analysis,'n133.01',cls = TRUE)

## ----measuresPrep, echo=FALSE--------------------------------------------
dat <- readFiles(files[1],scans = detectInfusionScans(files[1]),sranges = list(c(70,1000)),dp = 5)$n
dat <- tidyr::gather(tibble::as_tibble(dat),'mz','Intensity')
dat <- mutate(dat,mz = as.numeric(stringr::str_replace(mz,'[:alpha:]','')))
dat <- mutate(dat,bin = round(mz,2))
measures <- group_by(dat,bin)
measures <- summarise(measures,purity = binneR:::binPurity(mz,Intensity),centrality = binneR:::binCentrality(mz,Intensity),Intensity = mean(Intensity))

## ----binPurity, echo=FALSE,fig.width=7,fig.height=5,fig.align='center'----
Pure <- filter(measures,bin == 133.01)
Pure <-	mutate(Pure,purity = paste('Purity = ',round(purity,3), sep = ''))
pure <- filter(dat,bin == Pure$bin)
pure <- tibble::tibble(mz = unlist(apply(pure,1,function(x){rep(x[1],x[2])})))


Impure <- filter(measures,bin == 98.96)
Impure <- mutate(Impure, purity = paste('Purity = ',round(purity,3), sep = ''))
impure <- filter(dat,bin == Impure$bin)
impure <- tibble::tibble(mz = unlist(apply(impure,1,function(x){rep(x[1],x[2])})))

p <- list()

p$pure <- ggplot(pure,aes(x = mz)) +
	geom_density() +
	theme_bw() +
	xlim(Pure$bin - 0.005,Pure$bin + 0.005) +
	ggtitle(paste('n',Pure$bin,'\t',Pure$purity,sep = '')) +
	xlab('m/z') +
	ylab('Density')

p$impure <- ggplot(impure,aes(x = mz)) +
	geom_density() +
	theme_bw() +
	xlim(Impure$bin - 0.005,Impure$bin + 0.005) +
	ggtitle(paste('n',Impure$bin,'\t',Impure$purity,sep = '')) +
	xlab('m/z') +
	ylab('Density')

gridExtra::grid.arrange(gridExtra::arrangeGrob(p$pure,p$impure))

## ----binCentrality, echo=FALSE,fig.width=7,fig.height=5,fig.align='center'----
Pure <- filter(measures,bin == 88.04)
Pure <- mutate(Pure, centrality = paste('Centrality = ',round(centrality,3), sep = ''))
pure <- filter(dat,bin == Pure$bin)
pure <- tibble::tibble(mz = unlist(apply(pure,1,function(x){rep(x[1],x[2])})))


Impure <- filter(measures,bin == 104.03)
Impure <- mutate(Impure, centrality = paste('Centrality = ',round(centrality,3), sep = ''))
impure <- filter(dat,bin == Impure$bin)
impure <- tibble::tibble(mz = impure %>%
												 	split(1:nrow(.)) %>%
												 	purrr::map(~{rep(.$mz,.$Intensity)}) %>%
												 	unlist())

p <- list()

p$pure <- ggplot(pure,aes(x = mz)) +
	geom_density() +
	theme_bw() +
	xlim(Pure$bin - 0.005,Pure$bin + 0.005) +
	ggtitle(paste('n',Pure$bin,'\t',Pure$centrality,sep = '')) +
	xlab('m/z') +
	ylab('Density')

p$impure <- ggplot(impure,aes(x = mz)) +
	geom_density() +
	theme_bw() +
	xlim(Impure$bin - 0.005,Impure$bin + 0.005) +
	ggtitle(paste('n',Impure$bin,'\t',Impure$centrality,sep = '')) +
	xlab('m/z') +
	ylab('Density')

gridExtra::grid.arrange(gridExtra::arrangeGrob(p$pure,p$impure))

