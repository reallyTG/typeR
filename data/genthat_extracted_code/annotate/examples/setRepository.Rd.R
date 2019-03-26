library(annotate)


### Name: setRepository
### Title: Functions to add arbitrary repositories
### Aliases: setRepository getRepositories clearRepository
### Keywords: manip

### ** Examples


## A simple fake URI
repofun <- function(ids, ...)
paste("http://www.afakeuri.com/", ids, sep = "")

setRepository("simple", repofun)

## More complicated, we want to make sure that
## NAs get converted to empty cells

repofun <- function(ids, ...){
bIDs <- which(is.na(ids))
out <- paste("http://www.afakeuri.com/", ids, sep = "")
out[bIDs] <- "&nbsp;"
out
}

setRepository("complex", repofun)

## More complicated URI where we need to pass more information
## An example is Ensembl, which requires a species as part of the URI
## Since htmlpage() has an '...' argument, we can pass arbitrary
## arguments to this function that will be passed down to our
## repfun. Here we assume the argument species="Homo_sapiens" has been
## included in the call to htmlpage().


repofun <- function(ids, ...){
if(!is.null(list(...)$species))
      species <- list(...)$species
  else
      stop("To make links for Ensembl, you need to pass a 'species' argument.",
           call. = FALSE)
out <- paste("http://www.ensembl.org/", species, "/Search/Summary?species=",
              species, ";idx=;q=", ids, sep = "")
out
}

setRepository("species_arg", repofun)




