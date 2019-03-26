## ----echo = F------------------------------------------------------------
library(knitr)
hook1 <- function(x){ gsub("```\n*```r*\n*", "", x) }
knit_hooks$set(document = hook1)
opts_knit$set(width = 100)
library(mglR)

## ---- warning = FALSE, message = FALSE, eval = F-------------------------
#  # Load the library
#  library(mglR)
#  
#  # Build an empty list from gene names
#  buildFromNames(c("RP11-109G10.2", "RP11-481A12.2", "MSMB", "NCOA4", "TIMM23")) -> exampleMgl
#  
#  # Build an empty list from ENSG identifiers
#  buildFromEnsgs(c("ENSG00000228326", "ENSG00000230553", "ENSG00000138294", "ENSG00000138293", "ENSG00000138297")) -> exampleMgl
#  
#  # Build an empty list from a single gene region
#  buildFromRegion(10,51518775,51600147) -> exampleMgl

## ------------------------------------------------------------------------
# The output is a nested list
class(exampleMgl)
# 
# The length of the list corresponds to the number of candidate genes
length(exampleMgl)
names(exampleMgl)
#
# Each element corresponding to a gene is itself a list
class(exampleMgl[[1]])
names(exampleMgl[[1]])
#
# Currently these are empty placeholders for a particular data source
exampleMgl[[1]][2]

## ------------------------------------------------------------------------
# Load `myMgl`, example mgl list
exMgl() -> myMgl

## ---- eval = c(5)--------------------------------------------------------
# Add transcript information 
addEnst(myMgl) -> myMgl

# example mgl[[gene]][[datasource]]
myMgl[[1]][2]

## ---- eval = c(5)--------------------------------------------------------
# Add position information
addLoc(myMgl) -> myMgl

# example mgl[[gene]][[datasource]]
myMgl[[1]][3]

## ---- eval = c(5)--------------------------------------------------------
# Add information about transcripts in antisense position 
addAntisense(myMgl) -> myMgl

# example mgl[[gene]][[datasource]]. note: none of these genes have antisense transcripts
myMgl[[1]][4]

## ---- eval = c(5)--------------------------------------------------------
# Add gene ontology terms
addGo(myMgl) -> myMgl

# example mgl[[gene]][[datasource]]
myMgl[[3]][5]

## ---- eval = c(5)--------------------------------------------------------
# Add number of papers cataloged in PubMed
addPubmed(myMgl) -> myMgl

# example mgl[[gene]][[datasource]]
myMgl[[4]][6]

## ---- eval = c(6,8,10)---------------------------------------------------
# Add expression data from GTEx 
addExpression(myMgl, download = TRUE, saveDownload = FALSE, normalized = TRUE, xpGeneReads = TRUE, xpTranscriptReads = TRUE, xpGeneRpkm = TRUE, xpTranscriptRpkm = TRUE) -> myMgl

# examples mgl[[gene]][[datasource]][[tissue]][expression&covariates, people]
# normalized expression data
myMgl[[3]][[7]][[1]][1:3,1:3]
# gene reads
myMgl[[3]][[8]][[1]][,1:2]
# transcript RPKM
myMgl[[3]][[11]][[1]][,1:2]

## ---- eval = c(5)--------------------------------------------------------
# Add results from Maurano Nat. Genetics 2015
addDnase(myMgl) -> myMgl

# example mgl[[gene]][[datasource]]
myMgl[[3]][12]

## ---- eval = c(5)--------------------------------------------------------
# Add transEqtl data from GTEx
addTransEqtl(myMgl) -> myMgl

# example mgl[[gene]][[datasource]][[tissue]]
myMgl[[4]][[13]][20]

## ---- eval = c(5)--------------------------------------------------------
# Add cisEqtl data from GTEx
addCisEqtl(myMgl, download = TRUE, saveDownload = FALSE) -> myMgl

# example mgl[[gene]][[datasource]][[tissue]]
myMgl[[4]][[14]][[44]][1:3,]

## ---- eval = c(5)--------------------------------------------------------
# Add splicing QTL data from GTEx sqtlSeek algorithm
addSqtlSeek(myMgl) -> myMgl

# example mgl[[gene]][[datasource]][[tissue]]. note: none of these genes have splicing QTls as defined by sqtlSeek
myMgl[[1]][[15]][1]

## ---- eval = c(5)--------------------------------------------------------
# Add splicing QTL data from GTEx Altrans algorithm
addSqtlAltrans(myMgl) -> myMgl

# example mgl[[gene]][[datasource]][[tissue]]
myMgl[[4]][[16]][2]

## ---- eval = c(5)--------------------------------------------------------
# Add protein truncating variants from GTEx
addPtv(myMgl) -> myMgl

# example mgl[[gene]][[datasource]][[tissue]]
myMgl[[4]][[17]][[1]][1:2,]

## ---- eval = c(5)--------------------------------------------------------
# Add GWAS data from the NHGRI-EBI GWAS Catalog
addGwasCatalog(myMgl, range = 10, download = TRUE, saveDownload = FALSE) -> myMgl

# example mgl[[gene]][[datasource]][GWASEntry, Details]
myMgl[[3]][[18]][1:2,]

## ---- eval = F-----------------------------------------------------------
#  # Add GWAS data from GRASP
#  addGrasp(myMgl, range = 0) -> myMgl
#  
#  # example
#  #myMgl[[1]][[19]][1:3,]

## ---- eval = F-----------------------------------------------------------
#  # Add allelic ratios from GTEx
#  addAei(myMgl, fp = '~/Downloads') -> myMgl
#  
#  # example mgl[[gene]][[datasource]][[tissue]][SNP,Details]
#  myMgl[[4]][[20]][[1]][1:3,]

## ------------------------------------------------------------------------
# check class
class(myMgl[[3]][[12]])

# check dimensions
dim(myMgl[[3]][[12]])

# print subset
myMgl[[3]][[12]][1:3,]

## ------------------------------------------------------------------------
# display missing elements
listElements(exampleMgl, added = FALSE)
#
# display elements that have already been added
listElements(exampleMgl, added = TRUE)

## ------------------------------------------------------------------------
# subset the second element with ENST information
listSeparate(myMgl, 2) -> subset
#
subset

## ------------------------------------------------------------------------
# Build an empty list from gene names
buildFromNames(c("RP11-109G10.2", "RP11-481A12.2", "MSMB", "NCOA4", "TIMM23")) -> newMgl
#
# Gene name was not found by *biomaRt*
newMgl[[1]][1]
#
# Identify missing names
missNames(newMgl) 
#
# Fix missing names
fixNames(newMgl, c('ENSG00000228326', 'ENSG00000220508')) -> newMgl
#
# Gene names now filled in
newMgl[[1]][1]

## ---- eval = F-----------------------------------------------------------
#  # add rs Id
#  fixSnpIds(myMgl) -> myMgl

## ------------------------------------------------------------------------
# summarize gene ontology (GO) terms
makeGo(myMgl, saveFile = F) -> myGo
#
# output of makeGo is a list with three elements
class(myGo)
names(myGo)
#
#goRes is a list with GO terms for each gene (subset of element 5 from mgl)
myGo[[1]][[4]]
#
# goTable is a dataframe with GO term and gene
myGo[[2]][1:2,]
#
# goCount is a ranking of GO terms and the number of genes they are assigned to
myGo[[3]][1:2]
#
# to search for genes with a specific GO term
makeGoSearch(myMgl, 'nucleus', go = myGo, saveFile = F)

## ------------------------------------------------------------------------
# summarize phenotypes
makePhenotypes(myMgl, saveFile = F) -> myPhenotypes
#
# output of makePhenotypes is a list with four elements
class(myPhenotypes)
names(myPhenotypes)
#
# phenRes is a list with GWAS-based trait associations for each gene split by datasource (NHGRI-EBI GWAS Catalog and GRASP)
myPhenotypes[[1]][[5]]
#
# phenList is a list with GWAS-based trait associations for each gene 
myPhenotypes[[2]][[4]][1:5]
#
# phenTable is a dataframe with phenotype and gene
myPhenotypes[[3]][1:2,]
#
# phenCount is a ranking of phenotypes and the number of genes they are assigned to
myPhenotypes[[4]][1:2]
#
# to search for genes with a specific GO term
makePhenotypeSearch(myMgl, 'Mean corpuscular hemoglobin', phen = myPhenotypes, saveFile = F)

## ------------------------------------------------------------------------
# summarize SNPs
makeSnps(myMgl, saveFile = F) -> mySnps
#
# output of makeSnps is a list with four elements
class(mySnps)
names(mySnps)
#
# snpRes is a list with SNPs for each gene split by datasource
mySnps[[1]][[5]]
#
# snpList is a list with SNPs for each gene 
mySnps[[2]][[5]]
#
# snpTable is a dataframe with SNP and gene
mySnps[[3]][1:3,]
#
# snpCount is a ranking of SNPs and the number of genes they are assigned to
mySnps[[4]][1:3]
#
# to search for genes with a specific SNP
makeSnpSearch(myMgl, 'rs2611504', snp = mySnps, saveFile = F)

## ------------------------------------------------------------------------
# find SNPs that are both cis-eQTLs and GWAS-based variants
makeOverlap(myMgl, snpsA = 'cisEqtls', snpsB = 'gwasCatalog', saveFile = FALSE) -> myOverlap
#
myOverlap
# get details for these SNPs
makeOverlapTable(myMgl, myOverlap, saveFile = FALSE) -> myOverlapTable
#[[gene]][[snp]][[datasource]]
myOverlapTable[[1]][[1]][[1]][,1:3]
myOverlapTable[[1]][[1]][[2]][,1:3]

## ------------------------------------------------------------------------
# plot co-expressions between genes using count normalized data
makeCoXpGene(myMgl, gene = c("RP11-109G10.2", "NCOA4"), makePlot = FALSE, saveFile = FALSE, data = 7, tissue = c('Prostate'))

## ---- echo = FALSE, fig.height = 4, fig.width = 6------------------------
# plot co-expressions between genes using count normalized data
mgl = myMgl
genes = c('RP11-109G10.2', 'NCOA4')
makePlot = TRUE
data = 7 
tissue = 'Prostate'

    ns <- combn(1:length(genes), 2)
    res <- list()
    for (x in 1:dim(ns)[2]) {
        res[[x]] <- list()
        for (t in 1:length(tissue)) {
            n1 <- ns[1, x]
            n2 <- ns[2, x]
            g1 <- as.numeric(as.character(mgl[[which(names(mgl) == 
                genes[n1])]][[data]][[which(names(mgl[[1]][[data]]) == 
                tissue[t])]][1, ]))
            g2 <- as.numeric(as.character(mgl[[which(names(mgl) == 
                genes[n2])]][[data]][[which(names(mgl[[1]][[data]]) == 
                tissue[t])]][1, ]))
            res[[x]][[t]] <- cor.test(g1, g2)
}}
    if (makePlot == TRUE) {
        for (x in 1:dim(ns)[2]) {
            for (t in 1:length(tissue)) {
                n1 <- ns[1, x]
                n2 <- ns[2, x]
                g1 <- as.numeric(as.character(mgl[[which(names(mgl) == 
                  genes[n1])]][[data]][[which(names(mgl[[1]][[data]]) == 
                  tissue[t])]][1, ]))
                g2 <- as.numeric(as.character(mgl[[which(names(mgl) == 
                  genes[n2])]][[data]][[which(names(mgl[[1]][[data]]) == 
                  tissue[t])]][1, ]))
                layout(rbind(1, 2), heights = c(7, 1))
                par(mar = c(5.1, 4.1, 4.1, 2.1))
                plot(g1, g2, main = paste("CoExpression of \n", 
                  genes[n1], " and ", genes[n2], "\n in ", tissue[t], 
                  sep = ""), xlab = paste(genes[n1], " (", names(mgl[[which(names(mgl) == 
                  genes[n1])]])[data], ")", sep = ""), ylab = paste(genes[n2], 
                  " (", names(mgl[[which(names(mgl) == genes[n1])]])[data], 
                  ")", sep = ""), cex = 0.7)
                par(mar = c(0, 0, 0, 0))
                plot.new()
                legend("center", legend = paste(res[[x]][[t]]$method, 
                  " estimate: ", round(res[[x]][[t]]$estimate, 
                    digits = 2), " , p-value: ", round(res[[x]][[t]]$p.value, 
                    digits = 4), sep = ""), cex = 0.7)
}}}

## ------------------------------------------------------------------------
# filter DNAse results for significant p-values
makeDnaseSig(myMgl) -> results
#
results

## ---- eval = F-----------------------------------------------------------
#  # plot allelic ratios
#  makeAeiPlot(myMgl, gene = c('NCOA4'), saveFile = FALSE) -> myAeiPlot

## ------------------------------------------------------------------------
# if there are no MultiEqtls in a given tissue an error message appears 
makeMultiEqtl(myMgl, makePlot = FALSE, saveFile = FALSE, cis = TRUE, trans = TRUE, tissue = c('All', 'Prostate')) -> myMultiEqtl
#
# summarize MultiEqtls
makeMultiEqtl(myMgl, makePlot = FALSE, saveFile = FALSE, cis = TRUE, trans = TRUE, tissue = c('All')) -> myMultiEqtl
#
# output of makeMultiEqtl is a list with four elements
# note in the event of multiple tissues the output is a list with length corresponding to the number tissues where each element is a list with four elements as described below
class(myMultiEqtl)
names(myMultiEqtl)
#
# fullTable is a dataframe where each row is an eQTL
myMultiEqtl[[1]][1:3,]
#
# ranking is a list of tables ranking the number of genes each eQTL is assigned to  
myMultiEqtl[[2]][[1]][1:3]
#
# topSnps is a list of vectors of eQTLs appearing for the maximum number of genes (i.e. if the most number of genes an eQTL applies to is 3 all eQTLs assinged to 3 genes will be displayed)
myMultiEqtl[[3]]
#
# topSummary shows the information from fullTable (gene, tissue, snp) for those snps included in topSnps
myMultiEqtl[[4]]

## ------------------------------------------------------------------------
# summarize associated SNPs
makeSummary(myMgl, saveFile = F) -> summary
#
summary

