library(HelpersMG)


### Name: IC_threshold_matrix
### Title: Calculate correlation matrix
### Aliases: IC_threshold_matrix

### ** Examples

## Not run: 
##D library("HelpersMG")
##D es <- matrix(c("e1", "52", "12", "12", "5",
##D "e2", "59", "12.5", "9", "5",
##D "e3", "55", "13", "15", "9",
##D "e4", "58", "14.5", "5", "5",
##D "e5", "66", "15.5", "11", "13.5",
##D "e6", "62", "16", "15", "18",
##D "e7", "63", "17", "12", "18",
##D "e8", "69", "18", "9", "18"), ncol=5, byrow = TRUE)
##D colnames(es) <- c("Élève", "Poids", "Âge", "Assiduité", "Note")
##D es <- as.data.frame(es, stringsasFactor=FALSE)
##D es[, 2] <- as.numeric(as.character(es[, 2]))
##D es[, 3] <- as.numeric(as.character(es[, 3]))
##D es[, 4] <- as.numeric(as.character(es[, 4]))
##D es[, 5] <- as.numeric(as.character(es[, 5]))
##D 
##D es
##D 
##D df <- IC_clean_data(es, debug = TRUE)
##D cor_matrix <- IC_threshold_matrix(data=df, threshold = NULL, progress=FALSE)
##D cor_threshold <- IC_threshold_matrix(data=cor_matrix, threshold = 0.3)
##D par(mar=c(1,1,1,1))
##D set.seed(4)
##D plot(cor_threshold)
##D cor_threshold_Note <- IC_correlation_simplify(matrix=cor_threshold, variable="Note")
##D plot(cor_threshold_Note)
##D 
##D # Using the model All at a time
##D 
##D cor_threshold_AAT <- IC_threshold_matrix(data=df, threshold = 0.3, model="AAT")
##D par(mar=c(1,1,1,1))
##D set.seed(4)
##D plot(cor_threshold_AAT, show.legend.strength="bottomleft")
##D 
##D 
##D 
##D ############
##D dta <- structure(list(Élève = structure(1:8, .Label = c("e1", "e2", 
##D "e3", "e4", "e5", "e6", "e7", "e8"), class = "factor"), Poids = c(52L, 
##D 59L, 55L, 58L, 66L, 62L, 63L, 69L), Âge = c(12, 12.5, 13, 14.5, 
##D 15.5, 16, 17, 18), Assiduité = c(12L, 9L, 15L, 5L, 11L, 15L, 
##D 12L, 9L), Note = c(5, 5, 9, 5, 13.5, 18, 18, 18), e1 = c(1L, 
##D 0L, 0L, 0L, 0L, 0L, 0L, 0L), e2 = c(0L, 1L, 0L, 0L, 0L, 0L, 0L, 
##D 0L), e3 = c(0L, 0L, 1L, 0L, 0L, 0L, 0L, 0L), e4 = c(0L, 0L, 0L, 
##D 1L, 0L, 0L, 0L, 0L), e5 = c(0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L), 
##D     e6 = c(0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L), e7 = c(0L, 0L, 0L, 
##D     0L, 0L, 0L, 1L, 0L), e8 = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L
##D     )), .Names = c("Élève", "Poids", "Âge", "Assiduité", 
##D "Note", "e1", "e2", "e3", "e4", "e5", "e6", "e7", "e8"), class = "data.frame", row.names = c(NA, 
##D -8L))
##D 
##D dta0 <- dta[, 2:ncol(dta)]
##D ic0 <- IC_threshold_matrix(data = dta0)
##D cor_threshold <- IC_threshold_matrix(data=ic0, threshold = 0.3)
##D par(mar=c(1,1,1,1))
##D set.seed(4)
##D library("igraph")
##D 
##D plot(cor_threshold, vertex.color="red", show.legend.strength = FALSE)
##D plot(IC_correlation_simplify(matrix=cor_threshold), 
##D      show.legend.strength = FALSE, show.legend.direction = FALSE)
##D 
## End(Not run)



