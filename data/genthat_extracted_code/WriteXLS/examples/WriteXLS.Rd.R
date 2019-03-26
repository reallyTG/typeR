library(WriteXLS)


### Name: WriteXLS
### Title: Cross-platform Perl based R function to create Excel 2003 (XLS)
###   or Excel 2007 (XLSX) files
### Aliases: WriteXLS
### Keywords: file

### ** Examples

  ## Only run the examples if Perl and all modules are present
  if (testPerl(verbose = FALSE))
  {
    ## Examples using built-in data frames
    ## Create XLS (Excel 2003) files 
    WriteXLS("iris", "iris.xls")

    WriteXLS(c("iris", "infert", "esoph"), "Example.xls")

    iris.split <- split(iris, iris$Species)
    WriteXLS("iris.split", "irissplit.xls")

    ## Example using comment()
    ## Commented cells with have a small red triangle in the
    ## upper right hand corner of the cell. Click on the cell
    ## or place the cursor over the cell to see the pop-up
    ## containing the comment text.
    ## Create an XLSX (Excel 2007) file
    ## Adjust the column widths
    ## Bold the header row
    comment(iris$Sepal.Length) <- "Length of the sepals (cm)"
    comment(iris$Sepal.Width) <- "Width of the sepals (cm)"
    comment(iris$Petal.Length) <- "Length of the petals (cm)"
    comment(iris$Petal.Width) <- "Width of the petals (cm)"
    comment(iris$Species) <- "Species of the flowers"
    WriteXLS("iris", "iriscomments.xlsx",
             AdjWidth = TRUE, BoldHeaderRow = TRUE)

    ## Add row names
    WriteXLS("iris", "irisrownames.xlsx",
             AdjWidth = TRUE, BoldHeaderRow = TRUE, row.names = TRUE)

    ## Use latin1 Encoding
    WriteXLS("iris", "irisLatin1.xls", Encoding = "latin1")

    ## Write a 0 row data frame
    ## Worksheet will contain header row only
    DF0 <- data.frame("A" = numeric(), "B" = numeric(), "C" = numeric())
    WriteXLS("DF0", "DF0.xls", AdjWidth = TRUE, BoldHeaderRow = TRUE)

    ## 'x' is a single data frame object
    WriteXLS(iris, "irisDF.xls")

    ## 'x' is a list object containing data frames
    WriteXLS(iris.split, "irisList.xls")

    ## Clean up and delete XLS files
    rm(iris.split)
    rm(DF0)
    unlink("iris.xls")
    unlink("Example.xls")
    unlink("irissplit.xls")
    unlink("iriscomments.xlsx")
    unlink("irisrownames.xlsx")
    unlink("irisLatin1.xls")
    unlink("DF0.xls")
    unlink("irisDF.xls")
    unlink("irisList.xls")
  }



