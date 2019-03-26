library(openxlsx)


### Name: setHeaderFooter
### Title: Set document headers and footers
### Aliases: setHeaderFooter

### ** Examples

wb <- createWorkbook()

addWorksheet(wb, "S1")
addWorksheet(wb, "S2")
addWorksheet(wb, "S3")
addWorksheet(wb, "S4")

writeData(wb, 1, 1:400)
writeData(wb, 2, 1:400)
writeData(wb, 3, 3:400)
writeData(wb, 4, 3:400)

setHeaderFooter(wb, sheet = "S1",  
                header = c("ODD HEAD LEFT", "ODD HEAD CENTER", "ODD HEAD RIGHT"),
                footer = c("ODD FOOT RIGHT", "ODD FOOT CENTER", "ODD FOOT RIGHT"),
                evenHeader = c("EVEN HEAD LEFT", "EVEN HEAD CENTER", "EVEN HEAD RIGHT"),
                evenFooter = c("EVEN FOOT RIGHT", "EVEN FOOT CENTER", "EVEN FOOT RIGHT"),
                firstHeader = c("TOP", "OF FIRST", "PAGE"),
                firstFooter = c("BOTTOM", "OF FIRST", "PAGE"))

setHeaderFooter(wb, sheet = 2,  
                header = c("&[Date]", "ALL HEAD CENTER 2", "&[Page] / &[Pages]"),
                footer = c("&[Path]&[File]", NA, "&[Tab]"),
                firstHeader = c(NA, "Center Header of First Page", NA),
                firstFooter = c(NA, "Center Footer of First Page", NA))

setHeaderFooter(wb, sheet = 3,  
                header = c("ALL HEAD LEFT 2", "ALL HEAD CENTER 2", "ALL HEAD RIGHT 2"),
                footer = c("ALL FOOT RIGHT 2", "ALL FOOT CENTER 2", "ALL FOOT RIGHT 2"))

setHeaderFooter(wb, sheet = 4,  
                firstHeader = c("FIRST ONLY L", NA, "FIRST ONLY R"),
                firstFooter = c("FIRST ONLY L", NA, "FIRST ONLY R"))


saveWorkbook(wb, "setHeaderFooterExample.xlsx", overwrite = TRUE)



