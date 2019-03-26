library(PTXQC)


### Name: getHTMLTable
### Title: Create an HTML table with an extra header row
### Aliases: getHTMLTable

### ** Examples

  data = data.frame(raw.file = letters[1:4],
                    id.rate = 3:6)
  getHTMLTable(data, 
               header = "some header line", 
               font_size = 11)




