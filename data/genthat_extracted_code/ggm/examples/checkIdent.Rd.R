library(ggm)


### Name: checkIdent
### Title: Identifiability of a model with one latent variable
### Aliases: checkIdent
### Keywords: graphs models multivariate

### ** Examples

## See DAG in Figure 4 (a) in Stanghellini & Wermuth (2005)
d <- DAG(y1 ~ y3, y2 ~ y3 + y5, y3 ~ y4 + y5, y4 ~ y6)
checkIdent(d, "y3")  # Identifiable
checkIdent(d, "y4")  # Not identifiable?

## See DAG in Figure 5 (a) in Stanghellini & Wermuth (2005)
d <- DAG(y1 ~ y5+y4, y2 ~ y5+y4, y3 ~ y5+y4)
checkIdent(d, "y4")  # Identifiable
checkIdent(d, "y5")  # Identifiable

## A simple function to check identifiability for each node

is.ident <- function(amat){
### Check suff. conditions on each node of a DAG.
   p <- nrow(amat)
   ## Degrees of freedom
     df <- p*(p+1)/2 - p  - sum(amat==1) - p + 1
   if(df <= 0)
       warning(paste("The degrees of freedom are ", df))
    a <- rownames(amat)
    for(i in a) {
      b <- checkIdent(amat, latent=i)
      if(TRUE %in% b)
        cat("Node", i, names(b)[!is.na(b)], "\n")
      else
        cat("Unknown.\n")
    }
  }



