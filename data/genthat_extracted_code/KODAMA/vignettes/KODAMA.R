## ---- echo=FALSE---------------------------------------------------------
library("KODAMA")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(matrix(ncol=3,c("kNN","kNN","kNN","PLS-DA","PLS-DA","PLS-DA",2,5,10,2,3,4,9.371,9.362,9.381,9.976,9.933,9.977),dimnames = list(NULL,c("Classifier","parameter","Entropy"))))

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(matrix(ncol=3,c("kNN","kNN","kNN","kNN","kNN","kNN",
                             "PLS-DA","PLS-DA","PLS-DA","PLS-DA","PLS-DA","PLS-DA",
                             2,3,5,10,15,20,2,5,10,20,50,100,
                             13.460,13.428,13.425,13.420,13.426,13.451,13.493,13.509,13.497,13.445,13.245,13.093),
                    
                    dimnames = list(NULL,c("Classifier","parameter","Entropy"))))

