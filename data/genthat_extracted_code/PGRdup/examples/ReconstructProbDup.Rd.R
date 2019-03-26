library(PGRdup)


### Name: ReconstructProbDup
### Title: Reconstruct an object of class ProbDup
### Aliases: ReconstructProbDup

### ** Examples

## Not run: 
##D 
##D # Load PGR passport database
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
##D # Get disjoint probable duplicate sets of each kind
##D disGNdup <- DisProbDup(GNdup, combine = NULL)
##D 
##D # Get the data frame for reviewing the duplicate sets identified
##D RevGNdup <- ReviewProbDup(pdup = disGNdup, db1 = GN1000,
##D                           extra.db1 = c("SourceCountry", "TransferYear"), 
##D                           max.count = 30, insert.blanks = TRUE)
##D # Examine and review the duplicate sets using edit function
##D RevGNdup <- edit(RevGNdup)
##D 
##D # Examine and make changes to a set
##D subset(RevGNdup, SET_NO==12 & TYPE=="P", select= c(IDKW, DEL, SPLIT))
##D RevGNdup[c(110, 112, 114, 118, 121, 122, 124), 6] <- "Y"
##D RevGNdup[c(111, 115, 128), 7] <- 1
##D RevGNdup[c(113, 117, 120), 7] <- 2
##D RevGNdup[c(116, 119), 7] <- 3
##D RevGNdup[c(123, 125), 7] <- 4
##D RevGNdup[c(126, 127), 7] <- 5
##D subset(RevGNdup, SET_NO==12 & TYPE=="P", select= c(IDKW, DEL, SPLIT))
##D 
##D # Reconstruct ProDup object
##D GNdup2 <- ReconstructProbDup(RevGNdup)
##D lapply(disGNdup, nrow)
##D lapply(GNdup2, nrow)
##D 
## End(Not run)



