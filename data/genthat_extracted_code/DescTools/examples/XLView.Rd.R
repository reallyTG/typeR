library(DescTools)


### Name: XLView
### Title: Use MS-Excel as Viewer for a Data.Frame
### Aliases: XLView XLKill ToXL ToXL.data.frame ToXL.matrix ToXL.default
### Keywords: manip

### ** Examples

## Not run: 
##D # Windows-specific example
##D XLView(d.diamonds)
##D 
##D # edit an existing data.frame in MS-Excel, make changes and save there, return the filename
##D fn <- XLView(d.diamonds)
##D # read the changed file and store in new data.frame
##D d.frm <- read.table(fn, header=TRUE, quote="", sep=";")
##D 
##D # Create a new file, edit it in MS-Excel...
##D fn <- XLView()
##D # ... and read it into a data.frame when in R again
##D d.set <- read.table(fn, header=TRUE, quote="", sep=";")
##D 
##D # Export a ftable object, quite elegant...
##D XLView(format(ftable(Titanic), quote=FALSE), row.names = FALSE, col.names = FALSE)
##D 
##D 
##D # Export a data.frame directly to XL, combined with subsequent formatting
##D 
##D xl <- GetNewXL()
##D owb <- xl[["Workbooks"]]$Add()
##D sheet <- xl$Sheets()$Add()
##D sheet[["name"]] <- "pizza"
##D 
##D ToXL(d.pizza[1:10, 1:10], xl$Cells(1,1))
##D 
##D obj <- xl$Cells()$CurrentRegion()
##D obj[["VerticalAlignment"]] <- xlConst$xlTop
##D 
##D row <- xl$Cells()$CurrentRegion()$rows(1)
##D # does not work:   row$font()[["bold"]] <- TRUE
##D # works:
##D obj <- row$font()
##D obj[["bold"]] <- TRUE
##D 
##D obj <- row$borders(xlConst$xlEdgeBottom)
##D obj[["linestyle"]] <- xlConst$xlContinuous
##D 
##D cols <- xl$Cells()$CurrentRegion()$columns(1)
##D cols[["HorizontalAlignment"]] <- xlConst$xlLeft
##D 
##D xl$Cells()$CurrentRegion()[["EntireColumn"]]$AutoFit()
##D cols <- xl$Cells()$CurrentRegion()$columns(4)
##D cols[["WrapText"]] <- TRUE
##D cols[["ColumnWidth"]] <- 80
##D xl$Cells()$CurrentRegion()[["EntireRow"]]$AutoFit()
##D 
##D sheet <- xl$Sheets()$Add()
##D sheet[["name"]] <- "whisky"
##D ToXL(d.whisky[1:10, 1:10], xl$Cells(1,1))
##D 
## End(Not run)



