library(cabootcrs)


### Name: summaryca
### Title: Summarise results
### Aliases: summaryca
### Keywords: multivariate

### ** Examples

dreamdata <- t(matrix(c(7,4,3,7,10,15,11,13,23,9,11,7,28,9,12,10,32,5,4,3),4,5))
bd <- cabootcrs(dreamdata)
summaryca(bd, datasetname="Dreams")


## The function is currently defined as
function (x, datasetname = "") 
{
    colnames <- character(length = 9)
    colnames <- c("  Axis 1", "StDev", "Rep", "Ctr", "  Axis 2", 
        "StDev", "Rep", "Ctr", "Quality")
    colnamesnosd <- character(length = 7)
    colnamesnosd <- c("  Axis 1", "Rep", "Ctr", "  Axis 2", "Rep", 
        "Ctr", "Quality")
    cat("\n    SUMMARY RESULTS for Correspondence Analysis:", 
        datasetname, "\n\n")
    cat("Total inertia ", x@inertiasum, "\n\n")
    cat("Inertias, percent inertias and cumulative percent inertias \n\n")
    ins <- data.frame(x@inertias)
    names(ins) <- c("Inertia", "%  ", "Cum. %")
    print(ins, digits = 4)
    cat("\n")
    if (x@nboots > 0) {
        cat("Princ coords, std devs; rep and ctr (per mil); 2-d rep (per mil)\n\n")
    }
    else {
        cat("Princ coords; rep and ctr (per mil); 2-d rep (per mil)\n\n")
    }
    cat("Rows: \n")
    rop <- data.frame(round(x@Rowprinccoord[, 1] * 1000)/1000, 
        round(sqrt(x@RowVar[, 1]) * 1000)/1000, round(x@RowREP[, 
            1] * 1000), round(x@RowCTR[, 1] * 1000), round(x@Rowprinccoord[, 
            2] * 1000)/1000, round(sqrt(x@RowVar[, 2]) * 1000)/1000, 
        round(x@RowREP[, 2] * 1000), round(x@RowCTR[, 2] * 1000), 
        round(rowSums(x@RowREP[, 1:2] * 1000)), row.names = x@rowlabels)
    if (x@nboots == 0) {
        rop <- rop[, c(1, 3, 4, 5, 7, 8, 9)]
        names(rop) <- colnamesnosd
    }
    else {
        names(rop) <- colnames
    }
    print(rop, digits = 3)
    cat("\n")
    cat("Columns: \n")
    cop <- data.frame(round(x@Colprinccoord[, 1] * 1000)/1000, 
        round(sqrt(x@ColVar[, 1]) * 1000)/1000, round(x@ColREP[, 
            1] * 1000), round(x@ColCTR[, 1] * 1000), round(x@Colprinccoord[, 
            2] * 1000)/1000, round(sqrt(x@ColVar[, 2]) * 1000)/1000, 
        round(x@ColREP[, 2] * 1000), round(x@ColCTR[, 2] * 1000), 
        round(rowSums(x@ColREP[, 1:2] * 1000)), row.names = x@collabels)
    if (x@nboots == 0) {
        cop <- cop[, c(1, 3, 4, 5, 7, 8, 9)]
        names(cop) <- colnamesnosd
    }
    else {
        names(cop) <- colnames
    }
    print(cop, digits = 3)
    cat("\n")
  }



