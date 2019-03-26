library(rdiversity)


### Name: similarity_shimatani
### Title: Taxonomic similarity matrix
### Aliases: similarity_shimatani

### ** Examples

pop <- sample(1:50, 4)
lookup <- data.frame(Subclass=c("Sapindales", "Malvales", "Fabales", 
                                  "Fabales"),      
                     Family=c("Burseraceae", "Bombacaceae", "Fabaceae", 
                              "Fabaceae"), 
                     Genus=c("Protium", "Quararibea", "Swartzia", 
                             "Swartzia"),       
                     Species= c("tenuifolium", "asterolepis",
                                    "simplex var.grandiflora",
                                    "simplex var.ochnacea"))
similarity <- similarity_shimatani(pop, lookup)




