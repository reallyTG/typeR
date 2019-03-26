library(erah)


### Name: computeRIerror
### Title: Retention Index Error Computation
### Aliases: computeRIerror

### ** Examples

## No test: 

#Option A: (The RT and RI of an external calibration is provided)

ex <- computeRIerror(ex, mslib, reference.list=list(RT=c(4.4683, 7.4402, 8.8121, 11.5103), 
RI=c(1081.68, 1251.31, 1346.8, 1456.8)))
id.list <- idList(ex)

#Option B: (The AlignID of internally identified metabolites by
# eRah are provided, and used as a reference. )

ex <- computeRIerror(ex, mslib, reference.list=list(AlignID = c(45,67,92,120)))
id.list <- idList(ex) 

#Please, see Vignette for extended details, usage and advices!
## End(No test)


