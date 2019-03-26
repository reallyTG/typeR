library(helminthR)


### Name: findParasite
### Title: Find host-parasite interactions for a given parasite species.
### Aliases: findParasite

### ** Examples


## No test: 
strongHosts <- helminthR::findParasite(genus = "Strongyloides")
## End(No test)

# An example of how to query multiple parasite species when 
# you have a vector of parasite species names

parasites <- c("Ascaris aculeati", "Oxyuris flagellum")
## No test: 
 plyr::ldply(parasites, 
   function(x){
     helminthR::findParasite(unlist(strsplit(x, " "))[1], 
       unlist(strsplit(x," "))[2])
   }
 )
## End(No test)



