library(kernscr)


### Name: cancer_pathways
### Title: 70 pathways from MSigDB c2CP
### Aliases: cancer_pathways vijver
### Keywords: datasets

### ** Examples

data("cancer_pathways")

## Not run: 
##D ##get the data from Vijver publication
##D 
##D #clinical data
##D import_xls_from_zip <- function(urlPath, filename, zipname, skip=0){
##D  zipFile <- paste0(zipname, ".zip")
##D  download.file(paste0(urlPath, zipFile), zipFile)
##D  unzip(zipFile, exdir="./temp_unzip")
##D  xlsFile <- paste0("./temp_unzip/", filename, ".xls")
##D  res <- gdata::read.xls(xlsFile, skip=skip)
##D  unlink(zipFile)
##D  unlink("./temp_unzip", recursive=TRUE)
##D  return(res)
##D }
##D 
##D BC_dat_clin <- import_xls_from_zip(urlPath="http://ccb.nki.nl/data/",
##D                                   filename="Table1_ClinicalData_Table",
##D                                   zipname="nejm_table1",
##D                                   skip=2
##D                                   )
##D BC_dat_clin <- BC_dat_clin[order(BC_dat_clin$SampleID), ]
##D col2rmv <- 1:ncol(BC_dat_clin)
##D BC_dat_clin$ID <- paste0("S", BC_dat_clin$SampleID)
##D rownames(BC_dat_clin) <- BC_dat_clin$ID
##D BC_dat_clin$evdeath <- BC_dat_clin$EVENTdeath
##D BC_dat_clin$tsurv <- BC_dat_clin$TIMEsurvival
##D BC_dat_clin$evmeta <- BC_dat_clin$EVENTmeta
##D BC_dat_clin$tmeta<- pmin(BC_dat_clin$TIMEsurvival, BC_dat_clin$TIMEmeta, na.rm=TRUE)
##D samples2rmv <- c("S28", "S122", "S123", "S124", "S133", "S138", "S139", "S141", "S221", "S222",
##D                 "S224", "S226", "S227", "S228", "S229", "S230", "S231", "S237", "S238", "S240",
##D                 "S241", "S248", "S250", "S251", "S252", "S254", "S292", "S317", "S342", "S371",
##D                 "S379", "S380", "S397", "S398", "S401")
##D BC_dat_clin <- BC_dat_clin[-which(BC_dat_clin$ID %in% samples2rmv), -col2rmv]
##D head(BC_dat_clin)
##D 
##D 
##D 
##D #import genomics data
##D urlPath="http://ccb.nki.nl/data/"
##D zipFile <- paste0("ZipFiles295Samples", ".zip")
##D download.file(paste0(urlPath, zipFile), zipFile)
##D unzip(zipFile, exdir="./temp_unzip")
##D unlink(zipFile)
##D unlink("./temp_unzip/Readme.txt", recursive=FALSE)
##D txtfiles <- list.files("./temp_unzip/")
##D BC_dat_exp <- NULL
##D for(f in txtfiles){
##D  temp_exp <- read.delim(paste0("./temp_unzip/", f))
##D  if(f==txtfiles[1]){
##D    gene_id <- as.character(temp_exp[-1, 1])
##D    gene_symbol <- as.character(temp_exp[-1, 2])
##D  }
##D  temp_exp <- temp_exp[-1, grep("Sample.", colnames(temp_exp))]
##D  colnames(temp_exp) <- gsub("Sample.", "S", colnames(temp_exp))
##D  if(f==txtfiles[1]){
##D    BC_dat_exp <- temp_exp
##D  }else{
##D    BC_dat_exp <- cbind(BC_dat_exp, temp_exp)
##D  }
##D }
##D BC_dat_exp_all <- cbind.data.frame("SYMBOL"=gene_symbol, BC_dat_exp[,  BC_dat_clin$ID])
##D unlink("./temp_unzip", recursive=TRUE)
##D 
##D # translating the pathways from Entrez ID to gene symbol
##D library(org.Hs.eg.db)
##D x <- org.Hs.egSYMBOL
##D mapped_genes <- mappedkeys(x)
##D xx <- as.list(x[mapped_genes])
##D cancer_pathways_Symbol <- lapply(cancer_pathways, function(v){unlist(xx[v])})
##D sapply(cancer_pathways, function(x){length(intersect(x, rownames(BC_dat_exp)))/length(x)})
## End(Not run)




