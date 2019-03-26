library(MSnbase)


### Name: readMzIdData
### Title: Import peptide-spectrum matches
### Aliases: readMzIdData coerce,mzRident,data.frame-method

### ** Examples

idf <- "TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01-20141210.mzid"
f <- msdata::ident(full.names = TRUE, pattern = idf)
basename(f)
readMzIdData(f)



