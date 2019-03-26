library(rsurfer)


### Name: adni.mergewithfreesurferoutput
### Title: ADNI Merge With 'Freesurfer' Output
### Aliases: adni.mergewithfreesurferoutput

### ** Examples

## Not run: 
##D setfshome("/Applications/freesurfer")
##D df <- fsimport.serialise("~/CADDementiaSubjects/", "~/CADSubjects.rds", verbose = T)
##D adni.setfiles("DXSUM_PDXCONV_ADNIALL.csv", "ADNIMERGE.csv")
##D df <- adni.mergewithfreesurferoutput(df)
## End(Not run)



