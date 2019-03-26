## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ----env, include=FALSE, echo=FALSE, cache=FALSE---------------------------
library("knitr")
opts_chunk$set(stop_on_error = 1L)
suppressPackageStartupMessages(library("MSnbase"))
suppressWarnings(suppressPackageStartupMessages(library("pRoloc")))
suppressPackageStartupMessages(library("pRolocdata"))
suppressPackageStartupMessages(library("class"))
set.seed(1)
setStockcol(NULL)

## ----loadpkg---------------------------------------------------------------
library("pRoloc")

## ----loaddata--------------------------------------------------------------
library("pRolocdata")
data(andy2011)

## ----ap--------------------------------------------------------------------
ap <- setAnnotationParams(inputs =
                              c("Homo sapiens",
                                "UniProtKB/Swiss-Prot ID"))
ap

## ----pdata-----------------------------------------------------------------
data(andy2011)
head(featureNames(andy2011))

## ----andgoset--------------------------------------------------------------
andygoset <- makeGoSet(andy2011)
andygoset
exprs(andygoset)[1:7, 1:4]

## ----testandsamefeats, echo=FALSE------------------------------------------
stopifnot(all.equal(featureNames(andy2011), featureNames(andygoset)))

## ----hparprep, eval=TRUE---------------------------------------------------
andyhpa <- andy2011
fvarLabels(andyhpa)[1] <- "accession" ## for left_join matching
## convert protein accession numbers to ensembl gene identifiers

library("biomaRt")
mart <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

filter <- "uniprotswissprot"
attrib <- c("uniprot_gn", "uniprotswissprot", "ensembl_gene_id")
bm <- getBM(attributes = attrib,
            filters = filter,
            values = fData(andyhpa)[, "accession"],
            mart = mart)
head(bm)

## HPA data
library("hpar")

## using old version for traceability
setHparOptions(hpadata = "hpaSubcellularLoc14")
hpa <- getHpa(bm$ensembl_gene_id)
hpa$Reliability <- droplevels(hpa$Reliability)
colnames(hpa)[1] <- "ensembl_gene_id"

hpa <- dplyr::left_join(hpa, bm)
hpa <- hpa[!duplicated(hpa$uniprotswissprot), ]

## match HPA/LOPIT
colnames(hpa)[7] <- "accession"
fd <- dplyr::left_join(fData(andyhpa), hpa)
rownames(fd) <- featureNames(andyhpa)
fData(andyhpa) <- fd
stopifnot(validObject(andyhpa))

## Let's get rid of features without any hpa data
lopit <- andyhpa[!is.na(fData(andyhpa)$Main.location), ]

## ----hpadata, eval=TRUE----------------------------------------------------
## HPA localisation
hpalocs <- c(as.character(fData(lopit)$Main.location),
             as.character(fData(lopit)$Other.location))
hpalocs <- hpalocs[!is.na(hpalocs)]
hpalocs <- unique(unlist(strsplit(hpalocs, ";")))

makeHpaSet <- function(x, score2, locs = hpalocs) {
    hpamat <- matrix(0, ncol = length(locs), nrow = nrow(x))
    colnames(hpamat) <- locs
    rownames(hpamat) <- featureNames(x)
    for  (i in 1:nrow(hpamat)) {
        loc <- unlist(strsplit(as.character(fData(x)[i, "Main.location"]), ";"))
        loc2 <- unlist(strsplit(as.character(fData(x)[i, "Other.location"]), ";"))
        score <- score2[fData(x)[i, "Reliability"]]
        hpamat[i, loc] <- score
        hpamat[i, loc2] <- score
    }
    new("MSnSet", exprs = hpamat,
        featureData = featureData(x))
}

hpaset <- makeHpaSet(lopit,
                     score2 = c(Supportive = 1, Uncertain = 0))
hpaset <- filterZeroRows(hpaset)
dim(hpaset)
exprs(hpaset)[c(1, 6, 200), 1:3]

## ----tabdelim--------------------------------------------------------------
ppif <- system.file("extdata/tabdelimited._gHentss2F9k.txt.gz", package = "pRolocdata")
ppidf <- read.delim(ppif, header = TRUE, stringsAsFactors = FALSE)
head(ppidf)

## ----ppiset----------------------------------------------------------------
uid <- unique(c(ppidf$X.node1, ppidf$node2))
ppim <- diag(length(uid))
colnames(ppim) <- rownames(ppim) <- uid

for (k in 1:nrow(ppidf)) {
    i <- ppidf[[k, "X.node1"]]
    j <- ppidf[[k, "node2"]]
    ppim[i, j] <- ppidf[[k, "combined_score"]]
}

ppim[1:5, 1:8]

## ----ppiset2---------------------------------------------------------------
andyppi <- andy2011
featureNames(andyppi) <- sub("_HUMAN", "", fData(andyppi)$UniProtKB.entry.name)
cmn <- intersect(featureNames(andyppi), rownames(ppim))
ppim <- ppim[cmn, ]
andyppi <- andyppi[cmn, ]

ppi <- MSnSet(ppim, fData = fData(andyppi),
              pData = data.frame(row.names = colnames(ppim)))
ppi <- filterZeroCols(ppi)

## ----mclasses, echo=FALSE--------------------------------------------------
data(andy2011) ## load clean LOPIT data
## marker classes for andy2011
m <- unique(fData(andy2011)$markers.tl)
m <- m[m != "unknown"]

## ----andypca, echo=FALSE, fig.cap = "PCA plot of `andy2011`. The multivariate protein profiles are summarised along the two first principal components. Proteins of unknown localisation are represented by empty grey points. Protein markers, which are well-known residents of specific sub-cellular niches are colour-coded and form clusters on the figure."----
setStockcol(paste0(getStockcol(), "80"))
plot2D(andy2011, fcol = "markers.tl")
setStockcol(NULL)
addLegend(andy2011, fcol = "markers.tl",
          where = "topright", bty = "n", cex = .7)

## ----thetas0, echo=TRUE----------------------------------------------------
head(thetas(3, by = 0.5))
dim(thetas(3, by = 0.5))

## ----thetas1, echo=TRUE----------------------------------------------------
dim(thetas(5, length.out = 4))

## ----thetaandy-------------------------------------------------------------
## marker classes for andy2011
m <- unique(fData(andy2011)$markers.tl)
m <- m[m != "unknown"]
th <- thetas(length(m), length.out=4)
dim(th)

## ----thetaopt0, eval=FALSE-------------------------------------------------
#  topt <- knntlOptimisation(andy2011, andygoset,
#                            th = th,
#                            k = c(3, 3),
#                            fcol = "markers.tl",
#                            times = 50)

## ----thetaopt, eval=TRUE---------------------------------------------------
set.seed(1)
i <- sample(nrow(th), 12)
topt <- knntlOptimisation(andy2011, andygoset,
                          th = th[i, ],
                          k = c(3, 3),
                          fcol = "markers.tl",
                          times = 5)
topt

## ----getParam--------------------------------------------------------------
getParams(topt)

## ----besttheta-------------------------------------------------------------
(bw <- experimentData(andy2011)@other$knntl$thetas)

## ----tlclass---------------------------------------------------------------
andy2011 <- knntlClassification(andy2011, andygoset,
                                bestTheta = bw,
                                k = c(3, 3),
                                fcol = "markers.tl")

## ----tlpreds---------------------------------------------------------------
andy2011 <- getPredictions(andy2011, fcol = "knntl")

## ----andypca2, fig.width=6, fig.height=6, fig.cap = "PCA plot of `andy2011` after transfer learning classification. The size of the points is proportional to the classification scores."----
setStockcol(paste0(getStockcol(), "80"))
ptsze <- exp(fData(andy2011)$knntl.scores) - 1
plot2D(andy2011, fcol = "knntl", cex = ptsze)
setStockcol(NULL)
addLegend(andy2011, where = "topright",
          fcol = "markers.tl",
          bty = "n", cex = .7)

## ----sessioninfo, echo=FALSE-----------------------------------------------
sessionInfo()

