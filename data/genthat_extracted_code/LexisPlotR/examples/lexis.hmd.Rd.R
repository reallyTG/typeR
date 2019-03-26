library(LexisPlotR)


### Name: lexis.hmd
### Title: Fill Lexis triangles by HMD data
### Aliases: lexis.hmd

### ** Examples

library(LexisPlotR)
lg <- lexis.grid(year.start = 1980, year.end = 1985, age.start = 0, age.end = 5)
# Load sample data
path <- system.file("extdata", "Deaths_lexis_sample.txt", package = "LexisPlotR")
deaths.triangles <- prepare.hmd(path)
lexis.hmd(lg = lg, hmd.data = deaths.triangles, column = "Total")

### Plot data not explicitly present in HMD data
deaths.triangles$RatioMale <- deaths.triangles$Male / deaths.triangles$Total
lexis.hmd(lg, deaths.triangles, "RatioMale")



