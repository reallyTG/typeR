## ----echo=FALSE----------------------------------------------------------
library("knitr")
hook_output <- knitr::knit_hooks$get("output")
knitr::knit_hooks$set(output = function(x, options) {
   lines <- options$output.lines
   if (is.null(lines)) {
     return(hook_output(x, options))  # pass to default hook
   }
   x <- unlist(strsplit(x, "\n"))
   more <- "..."
   if (length(lines)==1) {        # first n lines
     if (length(x) > lines) {
       # truncate the output, but add ....
       x <- c(head(x, lines), more)
     }
   } else {
     x <- c(if (abs(lines[1])>1) more else NULL,
            x[lines],
            if (length(x)>lines[abs(length(lines))]) more else NULL
           )
   }
   # paste these lines together
   x <- paste(c(x, ""), collapse = "\n")
   hook_output(x, options)
 })

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE
)

## ----eval=FALSE----------------------------------------------------------
#  
#  # install.packages("devtools")
#  devtools::install_github("rOpenSci/helminthR")
#  library("helminthR")
#  

## ----eval=FALSE----------------------------------------------------------
#  
#  install.packages("helminthR")
#  

## ----eval=TRUE-----------------------------------------------------------

library(helminthR)

gorillaParasites <- findHost(genus='Gorilla', species='gorilla', 
	hostState=1, speciesOnly=TRUE, citation=TRUE)

dim(gorillaParasites)


## ------------------------------------------------------------------------

head(gorillaParasites)


## ----eval=FALSE----------------------------------------------------------
#  
#  hosts <- c('Gorilla gorilla', 'Peromyscus leucopus')
#  plyr::ldply(hosts,
#  	function(x){
#  		findHost(unlist(strsplit(x, ' '))[1],
#  			unlist(strsplit(x,' '))[2])})
#  	}
#  

## ----eval=TRUE-----------------------------------------------------------

strongHosts <- findParasite(genus='Strongyloides')
dim(strongHosts)


## ------------------------------------------------------------------------

head(strongHosts)


## ----eval=FALSE----------------------------------------------------------
#  
#  montanaOcc <- findLocation(location='Montana')
#  dim(montanaOcc)
#  

## ----eval=FALSE----------------------------------------------------------
#  
#  head(montanaOcc)
#  

## ----eval=FALSE----------------------------------------------------------
#  
#  g <- igraph::graph.incidence(table(montanaOcc[,1:2]))
#  igraph::V(g)$name <- NA
#  igraph::E(g)$color <- 'black'
#  
#  plot(g,
#  	vertex.color=c("black","dodgerblue")[igraph::V(g)$type+1],
#  	vertex.size=5
#  )
#  

