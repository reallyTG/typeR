library(edgarWebR)


### Name: filing_filers
### Title: SEC Filing Included Filers
### Aliases: filing_filers filing_filers.character filing_filers.xml_node

### ** Examples

# Typically you'd get the URL from one of the search functions
x <- paste0("https://www.sec.gov/Archives/edgar/data/",
            "712515/000071251517000063/0000712515-17-000063-index.htm")
filing_filers(x)



