library(baytrends)


### Name: importQW
### Title: Water-Quality Data
### Aliases: importQW
### Keywords: IO datasets internal

### ** Examples

## Not run: 
##D # Convert the stacked qw data supplied in smwrData
##D library(smwrData)
##D data(QWstacked)
##D QWstacked$result_va <- as.numeric(QWstacked$result_va) # raw data are character
##D # The units are both mg/l, no analyte name, generate column names from parameter codes
##D head(importQW(QWstacked, c("site_no", "sample_dt", "sample_tm", "medium_cd"),
##D  "result_va", "remark_cd", "val_qual_tx", "rpt_lev_va", "rpt_lev_cd", 
##D  "mg/l", "meth_cd", "", "parm_cd", "parm_cd"))
##D # A simple example having the minimum information
##D data(QW05078470)
##D importQW(QW05078470, c("DATES", "TIMES"), "P00665", "R00665", "", 0.005, "User", 
##D "mg/l", "Unk", "Dissolved Phosporus", "00665", "DissP")
## End(Not run)



