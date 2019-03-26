library(dicionariosIBGE)


### Name: le.pesquisa
### Title: Function that reads microdata from the IBGE survey
### Aliases: le.pesquisa
### Keywords: read.survey

### ** Examples

 ## Not run: 
##D      library(dicionariosIBGE)
##D      data(dicPNAD2009)
##D     
##D      # Set this \code{path} to point to the microdata file:
##D      dados <- le.pesquisa(dicionario=dicdom2009,
##D                           pathname.in=path,
##D                           codigos=dicdom2009[c(4:12),2], nlines = 1000)
##D 
##D      #with \code{rotulos} != NULL
##D      # Set this \code{path} to point to the microdata file:
##D      dados <- le.pesquisa(dicionario=dicdom2009,
##D                           pathname.in=path,
##D                           codigos=dicdom2009[c(4:12),2],rotulos=rotdom2009, nlines = 1000)
##D                            
##D                           
##D     
## End(Not run)



