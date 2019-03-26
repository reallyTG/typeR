library(EcoGenetics)


### Name: eco.format
### Title: Format tool for genetic data
### Aliases: eco.format

### ** Examples

## Not run: 
##D 
##D data(eco.test)
##D 
##D # Adding zeros
##D 
##D example <- as.matrix(genotype[1:10,])
##D mode(example) <- "character"
##D # example data
##D example                
##D recoded <- eco.format(example, ncod = 1, ploidy = 2, nout = 3)
##D # recoded data
##D recoded
##D 
##D 
##D # Tetraploid data, separating alleles with a "/"
##D tetrap <- as.matrix(example)
##D # simulated tetraploid example data
##D tetrap <- matrix(paste(example,example, sep = ""), ncol = ncol(example)) 
##D recoded <- eco.format(tetrap, ncod = 1, ploidy = 4, sep.out = "/")
##D # recoded data
##D recoded
##D 
##D # Example with a single character
##D ex <- c("A","T","G","C")
##D ex <- sample(ex, 100, rep= T)
##D ex <- matrix(ex, 10, 10)
##D colnames(ex) <- letters[1:10]
##D rownames(ex) <- LETTERS[1:10]
##D # example data
##D ex  
##D recoded <- eco.format(ex, ploidy = 1, nout = 1,  recode = "all", show.codes = TRUE) 
##D # recoded data 
##D recoded
##D 
##D # Example using values-replacement pairs
##D samp1 <- sample(c("A","T","G","C"), 100, replace = TRUE)
##D samp2 <- sample(c("A","T","G","C"), 100, replace = TRUE)
##D paired <- matrix(paste0(samp1, samp2), 10, 10)
##D # Generate some NAs
##D paired[sample(1:100, 10)]<-NA
##D out <- eco.format(paired, recode = "paired", replace_in = c("A", "T", "G", "C"),
##D replace_out = c(1, 2, 3, 4))
##D out
##D 
##D 
##D # Example with two strings per cell and missing values:
##D ex <- c("Ala", "Asx", "Cys", "Asp", "Glu", "Phe", "Gly", "His", "Ile", 
##D "Lys", "Leu", "Met", "Asn", "Pro", "Gln", "Arg", "Ser", "Thr", 
##D "Val", "Trp")
##D ex1 <- sample(ex, 100, rep= T)
##D ex2 <- paste(ex1, ex1, sep="")
##D missing.ex2 <- sample(1:100, 20)
##D ex2[missing.ex2] <-NA
##D ex2 <- matrix(ex2, 10, 10)
##D colnames(ex2) <- letters[1:10]
##D rownames(ex2) <- LETTERS[1:10]
##D # example data
##D ex2
##D recoded <- eco.format(ex2, ncod = 3, ploidy = 2, 
##D                       nout = 2, recode = "column")
##D # recoded data
##D recoded
##D 
##D # Example with a vector, following the latter example:
##D ex1 <- as.data.frame(ex1)
##D # example data
##D ex1
##D recoded <- eco.format(ex1, ploidy = 1, recode = "all")
##D # recoded data
##D recoded
##D 
## End(Not run)




