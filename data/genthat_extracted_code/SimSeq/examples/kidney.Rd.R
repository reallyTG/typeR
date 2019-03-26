library(SimSeq)


### Name: kidney
### Title: Kidney Renal Clear Cell Carcinoma [KIRC] RNA-Seq data
### Aliases: kidney
### Keywords: datasets

### ** Examples

data(kidney)

## Not run: 
##D ### Source code used to assemble KIRC dataset
##D 
##D ### load in SimSeq package for sorting counts matrix
##D library(SimSeq)
##D 
##D ### htmlToText function used to scrape barcode data from uuid
##D htmlToText <- function(input, ...) {
##D   ###---PACKAGES ---###
##D   library(RCurl)
##D   library(XML) 
##D   
##D   ###--- LOCAL FUNCTIONS ---###
##D   # Determine how to grab html for a single input element
##D   evaluate_input <- function(input) {    
##D     # if input is a .html file
##D     if(file.exists(input)) {
##D       char.vec <- readLines(input, warn = FALSE)
##D       return(paste(char.vec, collapse = ""))
##D     }
##D     
##D     # if input is html text
##D     if(grepl("</html>", input, fixed = TRUE)) return(input)
##D     
##D     # if input is a URL, probably should use a regex here instead?
##D     if(!grepl(" ", input)) {
##D       # downolad SSL certificate in case of https problem
##D       if(!file.exists("cacert.perm")) {
##D         download.file(url = "http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.perm")
##D       }
##D       return(getURL(input, followlocation = TRUE, cainfo = "cacert.perm"))
##D     }
##D     
##D     # return NULL if none of the conditions above apply
##D     return(NULL)
##D   }
##D   
##D   # convert HTML to plain text
##D   convert_html_to_text <- function(html) {
##D     doc <- htmlParse(html, asText = TRUE)
##D     text <- xpathSApply(doc, paste0("//text()",
##D                    "[not(ancestor::script)][not(ancestor::style)]",
##D                    "[not(ancestor::noscript)][not(ancestor::form)]"), xmlValue)
##D     return(text)
##D   }
##D   
##D   # format text vector into one character string
##D   collapse_text <- function(txt) {
##D     return(paste(txt, collapse = " "))
##D   }
##D   
##D   ###--- MAIN ---###
##D   # STEP 1: Evaluate input
##D   html.list <- lapply(input, evaluate_input)
##D   
##D   # STEP 2: Extract text from HTML
##D   text.list <- lapply(html.list, convert_html_to_text)
##D   
##D   # STEP 3: Return text
##D   text.vector <- sapply(text.list, collapse_text)
##D   return(text.vector)
##D }
##D 
##D ### Specify path name for folder containing raw counts for each sample
##D mainDir <- getwd()
##D folder.path <- "unc.edu_KIRC.IlluminaHiSeq_RNASeqV2.Level_3.1.5.0"
##D 
##D ### Determine list of files containing summarized raw counts
##D file.list <- dir(file.path(mainDir, folder.path))
##D keep <- grepl("genes.results", file.list)
##D file.list <- file.list[keep]
##D 
##D ### Create summarized count matrix.
##D ### Get n.row and n.col for summarized count matrix number of genes in first
##D ### sample and number of total samples from file.list
##D 
##D file.temp <- file.path(mainDir, folder.path, file.list[1])
##D n.row <- nrow(read.table(file = file.temp, header = TRUE))
##D n.col <- length(file.list)
##D 
##D ### initialize counts matrix
##D counts <- matrix(NA, nrow = n.row, ncol = n.col)
##D 
##D ### get gene id's
##D gene.id <- read.table(file.temp, header = TRUE, stringsAsFactors = FALSE)$gene_id
##D 
##D ### read in raw read counts from file.list
##D for(i in 1:n.col){
##D   file.temp <- file.path(mainDir, folder.path, file.list[i])
##D   counts[, i] <- read.table(file.temp, header = TRUE)$raw_count
##D }
##D 
##D ### Data was summarized using RSEM software which produces non_integer 
##D ### counts for ambiguous reads. Counts are rounded as a preprocessing
##D ### step.
##D counts <- round(counts)
##D 
##D ### Cast counts matrix as integer type
##D counts <- matrix(as.integer(counts), nrow = nrow(counts), ncol = ncol(counts))
##D 
##D ### Get uuid's for each sample
##D uuid <- substr(file.list, start = 9, stop = 44)
##D 
##D ### Create urls from uuid list
##D urls <- paste(rep("https://tcga-data.nci.nih.gov/uuid/uuidws/mapping/xml/uuid/",
##D                   length(uuid)), uuid, sep = "")
##D 
##D ### Scrape barcodes from urls
##D l <- length(urls)
##D barcodes <- vector("character", l)
##D for(i in 1:l){
##D   barcodes[i] <- htmlToText(urls[i])
##D }
##D 
##D 
##D barcodes <- substr(barcodes, start = 1, stop = 28)
##D 
##D ### Get metadata on which samples were taken from each individual, 
##D ### tumor type of sample, etc. from barcodes for each sample
##D metadata <- data.frame(barcodes, stringsAsFactors = FALSE)
##D 
##D ### Study Participant
##D metadata$participant <- substr(barcodes, start = 9, stop = 12)
##D 
##D ### Sample type code. See:
##D ### https://tcga-data.nci.nih.gov/datareports/codeTablesReport.htm?codeTable=Sample%20type
##D ### for full list of codes and details on TCGA barcodes.
##D ### 01: Primary Solid Tumor
##D ### 02: Recurrent Solid Tumor
##D ### 05: Additional New Primary
##D ### 06: Metastatic Tumor
##D ### 11: Solid Tissue Normal
##D metadata$type <- substr(barcodes, start = 14, stop = 15)
##D 
##D ### Only keep Primary Solid Tumor and Solid Tissue Normal
##D keep.metadata <- metadata$type == "01" | metadata$type == "11"
##D metadata <- metadata[keep.metadata, ]
##D counts <- counts[, keep.metadata]
##D 
##D ### Code from 01 to Tumor and 11 to Non-Tumor for easy identifiability
##D metadata$tumor <- "Non-Tumor"
##D metadata$tumor[metadata$type == "01"] <- "Tumor"
##D 
##D ### tag participant, type, and tumor as factors
##D metadata$participant <- as.factor(metadata$participant)
##D metadata$type <-as.factor(metadata$type)
##D metadata$tumor <- as.factor(metadata$tumor)
##D 
##D ### Sort and subset down to paired data
##D sorting <- 
##D   SortData(counts, treatment = metadata$tumor, 
##D            replic = metadata$participant, sort.method = "paired")$sorting
##D 
##D counts <- counts[, sorting]
##D metadata <- metadata[sorting, ]
##D metadata$participant <- factor(metadata$participant)
##D 
##D ### Add in attributes of counts matrix
##D dimnames(counts) <- list(gene.id, metadata$barcodes)
##D attr(counts, "uuid") <- uuid
##D 
##D kidney <- vector("list", 3)
##D kidney[[1]] <- counts
##D kidney[[2]] <- metadata$participant
##D kidney[[3]] <- metadata$tumor
##D names(kidney) <- c("counts", "replic", "treatment")
##D 
##D ###Save file
##D save(kidney, file = "kidney.rda")
## End(Not run)



