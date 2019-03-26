library(seedy)


### Name: librtoDNA
### Title: Convert simulation objects to DNA sequences or Nexus/Fasta
###   files.
### Aliases: librtoDNA

### ** Examples

data(withinhost)
G <- librtoDNA(sampleID=withinhost$obs.strain, libr=withinhost$libr, nuc=withinhost$nuc, 
               ref.strain=withinhost$ref.strain, key=withinhost$librstrains, strings=TRUE)



