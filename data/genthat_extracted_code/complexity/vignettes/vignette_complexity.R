## ---- message=FALSE, warning=FALSE,echo=FALSE----------------------------
library(complexity)
complexity(4,1,2,3,4)

## ---- echo=FALSE---------------------------------------------------------
complexity(6, 1,2,4,2,4,3,4,6,5,6)

#`total number of permutations'
#[1] 720

#$`number true'
#[1] 66

#$`complexity (proportion)'
#[1] 0.09166667

## ---- eval=FALSE,tidy=TRUE-----------------------------------------------
#  complexity <- function(npar,...){
#  
#    require(combinat)
#    values <- c(1:npar)                       #the parameters to permute
#    perm <- permn(values)                     #all permutations in a list
#    length <- length(perm)                    #number of permutations
#    perm.matrix <- matrix(unlist(perm),length, byrow=TRUE)
#                                              #permutations in rows of matrix
#    dim <- dim(perm.matrix)                   #length and width of permutation matrix
#    z <- matrix(unlist(list(...)),ncol=2,byrow=TRUE)
#                                              #one set of restriction values in each row
#    dimz <- dim(z)
#    n <- dimz[1]                              #number of restrictions
#    logical <- logical.last <- rep(0, nrow=dimz[1], ncol=1)
#                                              #empty vectors with length perm.matrix
#  
#    for (i in 1:n){
#      logical <- logical.last                 #fill logical with logical.last
#      z1<- z[i,1]                             #get first restriction value
#      z2<- z[i,2]                             #get second restriction value
#      logical <-                              #restrictions, TRUEs and FALSES saved in logical
#        perm.matrix[,z1]<perm.matrix[,z2]     #see if 1st restr. value column < 2nd restr.
#      perm.matrix <- matrix(perm.matrix[logical],ncol=dim[2])
#                                              #save TRUE selection in perm.matrix
#      dimp <- dim(perm.matrix)                #dimensions of new matrix
#      logical.last <- rep(0,nrow=dimp[1],ncol=1)
#                                              #new empty vector with length new matrix
#    }
#  
#    y <- sum(logical)                         #number of TRUEs in set
#    true <- perm.matrix                       #matrix with TRUE permutations
#    prop <- y/length                          #TRUE n / total n = complexity
#  
#    list("true permutations" = true,
#         "total number of permutations"=length,
#         "number true"=y, "complexity (proportion)"=prop)}

