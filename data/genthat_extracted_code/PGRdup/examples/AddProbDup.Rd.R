library(PGRdup)


### Name: AddProbDup
### Title: Add probable duplicate sets fields to the PGR passport database
### Aliases: AddProbDup

### ** Examples

## Not run: 
##D 
##D #' # Load PGR passport database
##D GN <- GN1000
##D 
##D # Specify as a vector the database fields to be used
##D GNfields <- c("NationalID", "CollNo", "DonorID", "OtherID1", "OtherID2")
##D 
##D # Clean the data
##D GN[GNfields] <- lapply(GN[GNfields], function(x) DataClean(x))
##D y1 <- list(c("Gujarat", "Dwarf"), c("Castle", "Cary"), c("Small", "Japan"),
##D c("Big", "Japan"), c("Mani", "Blanco"), c("Uganda", "Erect"),
##D c("Mota", "Company"))
##D y2 <- c("Dark", "Light", "Small", "Improved", "Punjab", "SAM")
##D y3 <- c("Local", "Bold", "Cary", "Mutant", "Runner", "Giant", "No.",
##D         "Bunch", "Peanut")
##D GN[GNfields] <- lapply(GN[GNfields], function(x) MergeKW(x, y1, delim = c("space", "dash")))
##D GN[GNfields] <- lapply(GN[GNfields], function(x) MergePrefix(x, y2, delim = c("space", "dash")))
##D GN[GNfields] <- lapply(GN[GNfields], function(x) MergeSuffix(x, y3, delim = c("space", "dash")))
##D 
##D # Generate KWIC index
##D GNKWIC <- KWIC(GN, GNfields)
##D 
##D # Specify the exceptions as a vector
##D exep <- c("A", "B", "BIG", "BOLD", "BUNCH", "C", "COMPANY", "CULTURE", 
##D          "DARK", "E", "EARLY", "EC", "ERECT", "EXOTIC", "FLESH", "GROUNDNUT", 
##D          "GUTHUKAI", "IMPROVED", "K", "KUTHUKADAL", "KUTHUKAI", "LARGE", 
##D          "LIGHT", "LOCAL", "OF", "OVERO", "P", "PEANUT", "PURPLE", "R", 
##D          "RED", "RUNNER", "S1", "SAM", "SMALL", "SPANISH", "TAN", "TYPE", 
##D          "U", "VALENCIA", "VIRGINIA", "WHITE")
##D           
##D # Specify the synsets as a list
##D syn <- list(c("CHANDRA", "AH114"), c("TG1", "VIKRAM"))
##D 
##D # Fetch probable duplicate sets
##D GNdup <- ProbDup(kwic1 = GNKWIC, method = "a", excep = exep, fuzzy = TRUE,
##D                  phonetic = TRUE, encoding = "primary", 
##D                  semantic = TRUE, syn = syn)
##D 
##D # Add the duplicates sets to the original database                 
##D GNwithdup <-  AddProbDup(pdup = GNdup, db = GN1000, addto = "I")                  
##D 
## End(Not run)



