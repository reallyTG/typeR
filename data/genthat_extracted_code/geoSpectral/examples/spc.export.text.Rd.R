library(geoSpectral)


### Name: spc.export.text
### Title: Exporting into text format
### Aliases: spc.export.text spc.export.text,Spectra-method
###   spc.export.text,SpcHeader-method spc.import.text

### ** Examples

x=spc.example_spectra()
spc.export.text(x,filename="anap.txt")
aa=spc.import.text("anap.txt")
dev.new()
spc.plot(aa)

#Export the SpcHeader object
spc.export.text(x@header,filename="anap_header.txt")
hdr=spc.import.text("anap_header.txt")
class(hdr)




