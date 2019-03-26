library(FIACH)


### Name: fiach
### Title: FIACH
### Aliases: fiach

### ** Examples

## Not run: 
##D #### create the necessary files ###
##D 
##D dir.create("fiach_example/")
##D file<-system.file("extdata","motion_ex.nii.gz",package="FIACH")
##D arr<-readNii(file)
##D RNiftyReg::writeNifti(arr,"fiach_example/motion_ex.nii.gz",datatype = "short")
##D data(rp)
##D write.table(rp[1:13,],"fiach_example/rp.txt",col.names=FALSE,row.names=FALSE)
##D 
##D # running FIACH #
##D t<-boldContrast(1.5,30)
##D tr<-2.16
##D system.time(fiach("fiach_example/motion_ex.nii.gz", t=t,tr=tr, rp="fiach_example/rp.txt"))
##D 
##D ## Note that this is a toy example.
##D ## The results are meaningless.
##D ## This is only an example of how
##D ## one would use fiach in a script.
## End(Not run)



