library(PTXQC)


### Name: plotTable
### Title: Plot a table with row names and title
### Aliases: plotTable

### ** Examples

  data = data.frame(raw.file = letters[1:4],
                    id.rate = 3:6)
  plotTable(data, 
            title = "Bad files",
            footer = "bottom", 
            col_names = c("first col", "second col"),
            col=c("red", "green"))




