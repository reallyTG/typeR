library(RNentropy)


### Name: RNentropy
### Title: RNentropy
### Aliases: RNentropy
### Keywords: RNentropy

### ** Examples

#load expression values and experiment design
data("RN_Brain_Example_tpm", "RN_Brain_Example_design")
#compute statistics and p-values (considering only a subset of genes due to
#examples running time limit of CRAN) 
Results <- RN_calc(RN_Brain_Example_tpm[1:10000,], RN_Brain_Example_design)
#select only genes with significant changes of expression
Results <- RN_select(Results)


## The function is currently defined as
function (file, tr.col, design, header = TRUE, skip = 0, skip.col = NULL, 
    col.names = NULL) 
{
    TABLE <- read.table(file, row.names = tr.col, header = header, 
        skip = skip, blank.lines.skip = TRUE, comment.char = "#")
    if (!is.null(skip.col)) {
        TABLE <- .RN_delete_col(TABLE, tr.col, skip.col)
    }
    if (!is.null(col.names)) {
        colnames(TABLE) <- col.names
    }
    return(RN_calc(TABLE, design))
  }



