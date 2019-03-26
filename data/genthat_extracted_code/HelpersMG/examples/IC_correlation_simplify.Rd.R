library(HelpersMG)


### Name: IC_correlation_simplify
### Title: Simplify the correlation matrix
### Aliases: IC_correlation_simplify

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
##D cor_threshold <- IC_threshold_matrix(data=df, threshold = 0.3)
##D par(mar=c(1,1,1,1))
##D set.seed(4)
##D plot(cor_threshold)
##D cor_threshold_Note <- IC_correlation_simplify(matrix=cor_threshold, variable="Note")
##D plot(cor_threshold_Note)
## End(Not run)



