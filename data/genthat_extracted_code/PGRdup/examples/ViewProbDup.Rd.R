library(PGRdup)


### Name: ViewProbDup
### Title: Visualize the probable duplicate sets retrieved in a 'ProbDup'
###   object
### Aliases: ViewProbDup

### ** Examples

## Not run: 
##D 
##D # Method "b and c"
##D #=================
##D 
##D # Load PGR passport databases
##D GN1 <- GN1000[!grepl("^ICG", GN1000$DonorID), ]
##D GN1$DonorID <- NULL
##D GN2 <- GN1000[grepl("^ICG", GN1000$DonorID), ]
##D GN2 <- GN2[!grepl("S", GN2$DonorID), ]
##D GN2$NationalID <- NULL
##D 
##D GN1$SourceCountry <- toupper(GN1$SourceCountry)
##D GN2$SourceCountry <- toupper(GN2$SourceCountry)
##D 
##D GN1$SourceCountry <- gsub("UNITED STATES OF AMERICA", "USA", GN1$SourceCountry)
##D GN2$SourceCountry <- gsub("UNITED STATES OF AMERICA", "USA", GN2$SourceCountry)
##D 
##D # Specify as a vector the database fields to be used
##D GN1fields <- c("NationalID", "CollNo", "OtherID1", "OtherID2")
##D GN2fields <- c("DonorID", "CollNo", "OtherID1", "OtherID2")
##D 
##D # Clean the data
##D GN1[GN1fields] <- lapply(GN1[GN1fields], function(x) DataClean(x))
##D GN2[GN2fields] <- lapply(GN2[GN2fields], function(x) DataClean(x))
##D y1 <- list(c("Gujarat", "Dwarf"), c("Castle", "Cary"), c("Small", "Japan"),
##D            c("Big", "Japan"), c("Mani", "Blanco"), c("Uganda", "Erect"),
##D            c("Mota", "Company"))
##D y2 <- c("Dark", "Light", "Small", "Improved", "Punjab", "SAM")
##D y3 <- c("Local", "Bold", "Cary", "Mutant", "Runner", "Giant", "No.",
##D         "Bunch", "Peanut")
##D GN1[GN1fields] <- lapply(GN1[GN1fields], function(x) MergeKW(x, y1, delim = c("space", "dash")))
##D GN1[GN1fields] <- lapply(GN1[GN1fields], function(x) MergePrefix(x, y2, delim = c("space", "dash")))
##D GN1[GN1fields] <- lapply(GN1[GN1fields], function(x) MergeSuffix(x, y3, delim = c("space", "dash")))
##D GN2[GN2fields] <- lapply(GN2[GN2fields], function(x) MergeKW(x, y1, delim = c("space", "dash")))
##D GN2[GN2fields] <- lapply(GN2[GN2fields], function(x) MergePrefix(x, y2, delim = c("space", "dash")))
##D GN2[GN2fields] <- lapply(GN2[GN2fields], function(x) MergeSuffix(x, y3, delim = c("space", "dash")))
##D 
##D # Remove duplicated DonorID records in GN2
##D GN2 <- GN2[!duplicated(GN2$DonorID), ]
##D 
##D # Generate KWIC index
##D GN1KWIC <- KWIC(GN1, GN1fields)
##D GN2KWIC <- KWIC(GN2, GN2fields)
##D 
##D # Specify the exceptions as a vector
##D exep <- c("A", "B", "BIG", "BOLD", "BUNCH", "C", "COMPANY", "CULTURE",
##D           "DARK", "E", "EARLY", "EC", "ERECT", "EXOTIC", "FLESH", "GROUNDNUT",
##D           "GUTHUKAI", "IMPROVED", "K", "KUTHUKADAL", "KUTHUKAI", "LARGE",
##D           "LIGHT", "LOCAL", "OF", "OVERO", "P", "PEANUT", "PURPLE", "R",
##D           "RED", "RUNNER", "S1", "SAM", "SMALL", "SPANISH", "TAN", "TYPE",
##D           "U", "VALENCIA", "VIRGINIA", "WHITE")
##D 
##D # Specify the synsets as a list
##D syn <- list(c("CHANDRA", "AH114"), c("TG1", "VIKRAM"))
##D 
##D GNdupc <- ProbDup(kwic1 = GN1KWIC, kwic2 = GN2KWIC, method = "c",
##D                   excep = exep, fuzzy = TRUE, phonetic = TRUE,
##D                   encoding = "primary", semantic = TRUE, syn = syn)
##D 
##D GNdupcView <- ViewProbDup(GNdupc, GN1, GN2, "SourceCountry", "SourceCountry",
##D                          max.count = 30, select = c("INDIA", "USA"), order = "type",
##D                          main = "Groundnut Probable Duplicates")
##D 
##D library(gridExtra)                                                    
##D grid.arrange(GNdupcView$SummaryGrob)                          
##D 
## End(Not run)       



