library(emuR)


### Name: convert_legacyEmuDB
### Title: Convert legacy EMU database to the emuDB format
### Aliases: convert_legacyEmuDB
### Keywords: Emu database emuDB schema

### ** Examples

## Not run: 
##D ## Convert legacy EMU database specified by EMU 
##D ## template file /mydata/EMU_legacy/ae/ae.tpl to directory /mydata/EMU/
##D ## and load it afterwards
##D 
##D convert_legacyEmuDB("/mydata/EMU_legacy/ae/ae.tpl","/mydata/EMU/")
##D ae=load_emuDB("/mydata/EMU/ae_emuDB")
##D 
##D ## Convert database "ae" and do not rewrite SSFF tracks 
##D 
##D convert_legacyEmuDB("/mydata/EMU_legacy/ae/ae.tpl",
##D "/mydata/EMU/",
##D options=list(rewriteSSFFTracks=FALSE))
##D 
##D ## Convert legacy database "ae" from emuR demo data and load converted emuDB
##D 
##D create_emuRdemoData()
##D demoTplPath=file.path(tempdir(),"emuR_demoData/legacy_ae/ae.tpl")
##D targetDir=file.path(tempdir(),"converted_to_emuR")
##D convert_legacyEmuDB(demoTplPath,targetDir)
##D dbHandle=load_emuDB(file.path(targetDir,"ae_emuDB"))
##D 
## End(Not run)




