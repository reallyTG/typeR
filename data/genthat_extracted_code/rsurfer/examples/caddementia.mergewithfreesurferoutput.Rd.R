library(rsurfer)


### Name: caddementia.mergewithfreesurferoutput
### Title: CAD Dementia Merge With 'Freesurfer' Output
### Aliases: caddementia.mergewithfreesurferoutput

### ** Examples

## Not run: 
##D setfshome("/Applications/freesurfer")
##D df <- fsimport.serialise("~/CADDementiaSubjects/", "~/CADSubjects.rds", verbose = T)
##D caddementia.setfiles("train.txt", "test.txt")
##D df <- caddementia.mergewithfreesurferoutput(df)
## End(Not run)



