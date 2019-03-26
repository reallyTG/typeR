library(drsmooth)


### Name: expand
### Title: Expand Summarized Dichotomous Data for drsmooth
### Aliases: expand

### ** Examples

# Generates an expanded dataframe from the included data DIdata:
data(DIdata)
DIdata_expanded <- expand(dosecolumn = "Dose", targetcolumn = "Tumor", ncolumn = "n", data = DIdata)



