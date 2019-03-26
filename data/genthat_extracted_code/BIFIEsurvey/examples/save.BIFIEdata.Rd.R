library(BIFIEsurvey)


### Name: save.BIFIEdata
### Title: Saving, Writing and Loading 'BIFIEdata' Objects
### Aliases: save.BIFIEdata load.BIFIEdata write.BIFIEdata
###   load.BIFIEdata.files
### Keywords: BIFIEdata

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Saving and loading BIFIE data objects
##D #############################################################################
##D data(data.timss1)
##D data(data.timssrep)
##D 
##D bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
##D                  wgtrep=data.timssrep[, -1 ] )
##D summary(bifieobj)
##D 
##D # save bifieobj in a compact way
##D BIFIEsurvey::save.BIFIEdata( BIFIEdata=bifieobj, name.BIFIEdata="timss1_cdata" )
##D # save bifieobj in a non-compact way
##D BIFIEsurvey::save.BIFIEdata( BIFIEdata=bifieobj, name.BIFIEdata="timss1_data", cdata=FALSE)
##D 
##D # load this object with object name "bdat2"
##D bdat2 <- BIFIEsurvey::load.BIFIEdata( filename="timss1_data.Rdata" )
##D summary(bdat2)
##D 
##D # save bifieobj with selected variables
##D BIFIEsurvey::save.BIFIEdata( bifieobj, name.BIFIEdata="timss1_selectvars_cdata",
##D                      varnames=bifieobj$varnames[ c(1:7,13,12,9) ] )
##D # the same object, but use the non-compact way of saving
##D BIFIEsurvey::save.BIFIEdata( bifieobj, name.BIFIEdata="timss1_selectvars_data", cdata=FALSE,
##D                      varnames=bifieobj$varnames[ c(1:7,13,12,9) ] )
##D 
##D # load object timss1_cdata (in compact data format)
##D bdat3 <- BIFIEsurvey::load.BIFIEdata( filename="timss1_cdata.Rdata" )
##D summary(bdat3)
##D # save selected variables of object bdat3
##D BIFIEsurvey::save.BIFIEdata( bdat3, name.BIFIEdata="timss1_selectvars2_cdata",
##D                      varnames=bifieobj$varnames[ c(1:4,12,8) ] )
##D 
##D #############################################################################
##D # EXAMPLE 2: Writing BIFIEdata objects
##D #############################################################################
##D 
##D data(data.timss2)
##D data(data.timssrep)
##D 
##D # create compactBIFIEdata
##D bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss2, wgt=data.timss2[[1]]$TOTWGT,
##D                 wgtrep=data.timssrep[, -1 ], cdata=TRUE)
##D summary(bifieobj)
##D 
##D # save imputed datasets in format csv2
##D BIFIEsurvey::write.BIFIEdata( bifieobj, name.BIFIEdata="timss2_save1", type="csv2", row.names=FALSE)
##D 
##D # save imputed datasets of BIFIEdata object in format table without column names
##D # and code missings as "."
##D BIFIEsurvey::write.BIFIEdata( bifieobj, name.BIFIEdata="timss2_save2", type="table",
##D                   col.names=FALSE, row.names=FALSE, na="." )
##D 
##D # save imputed datasets of  BIFIEdata object in format csv and select some variables
##D # and only the first three datasets
##D varnames <- c("IDSTUD","TOTWGT","female","books","lang","ASMMAT")
##D BIFIEsurvey::write.BIFIEdata( bifieobj, name.BIFIEdata="timss2_save3", type="csv",
##D                    impdata.index=1:3, varnames=varnames)
##D 
##D # save imputed datasets of BIFIEdata object in format Rdata, the R binary format
##D BIFIEsurvey::write.BIFIEdata( bifieobj, name.BIFIEdata="timss2_save4", type="Rdata"  )
##D 
##D # save imputed datasets in sav (SPSS) format
##D BIFIEsurvey::write.BIFIEdata( bifieobj, name.BIFIEdata="timss2_save5", type="sav" )
##D 
##D #############################################################################
##D # EXAMPLE 3: Loading BIFIEdata objects saved in separate files
##D #                   (no indicator dataset)
##D #############################################################################
##D 
##D # We assume that Example 2 is applied and we build on the saved files
##D # from this example.
##D 
##D #***--- read Rdata format
##D # extract files with imputed datasets and replicate weights
##D files.imp <- miceadds::grep.vec( c("timss2_save4__IMP", ".Rdata" ),
##D             list.files(getwd())  )$x
##D file.wgtrep <- miceadds::grep.vec( c("timss2_save4__WGTREP", ".Rdata" ),
##D             list.files(getwd())  )$x
##D # select some variables in varnames
##D varnames <- scan( nlines=1, what="character")
##D    IDSTUD   TOTWGT books lang migrant likesc  ASMMAT
##D 
##D # load files and create BIFIEdata object
##D bifieobj1 <- BIFIEsurvey::load.BIFIEdata.files( files.imp, wgt="TOTWGT", file.wgtrep,
##D                         type="Rdata", varnames=varnames )
##D summary(bifieobj1)
##D 
##D #***--- read csv2 format
##D files.imp <- miceadds::grep.vec( c("timss2_save1__IMP", ".csv" ),
##D                         list.files(getwd()) )$x
##D file.wgtrep <- miceadds::grep.vec( c("timss2_save1__WGTREP", ".csv" ),
##D                         list.files(getwd()) )$x
##D bifieobj2 <- BIFIEsurvey::load.BIFIEdata.files( files.imp, wgt="TOTWGT",
##D                     file.wgtrep, type="csv2" )
##D summary(bifieobj2)
##D 
##D #***--- read sav format
##D files.imp <- miceadds::grep.vec( c("timss2_save5__IMP", ".sav" ),
##D                         list.files(getwd()) )$x
##D file.wgtrep <- miceadds::grep.vec( c("timss2_save5__WGTREP", ".sav" ),
##D                         list.files(getwd()) )$x
##D bifieobj3 <- BIFIEsurvey::load.BIFIEdata.files( files.imp, wgt="TOTWGT",
##D                 file.wgtrep, type="sav", to.data.frame=TRUE, use.value.labels=FALSE)
##D summary(bifieobj3)
##D 
##D #############################################################################
##D # EXAMPLE 4: Loading BIFIEdata objects saved in separate files
##D #                   (with an indicator dataset)
##D #############################################################################
##D 
##D data(data.timss1)
##D data(data.timss1.ind)
##D data(data.timssrep)
##D 
##D # create BIFIEdata object at first
##D bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt="TOTWGT",
##D             wgtrep=data.timssrep[, -1 ] )
##D summary(bifieobj)
##D 
##D #--- save datasets for the purpose of the following example
##D write.BIFIEdata( BIFIEdata=bifieobj, name.BIFIEdata="timss1_ex", type="Rdata" )
##D # save indicator dataset
##D save( data.timss1.ind, file="timss1_ex__IND.Rdata" )
##D 
##D # grep file names
##D files.imp <- miceadds::grep.vec( c("timss1_ex__IMP", ".Rdata" ),
##D                       list.files(getwd()) )$x
##D file.wgtrep <- miceadds::grep.vec( c("timss1_ex__WGTREP", ".Rdata" ),
##D                       list.files(getwd()) )$x
##D file.ind <- miceadds::grep.vec( c("timss1_ex__IND", ".Rdata" ),
##D                       list.files(getwd()) )$x
##D # define variables for selection
##D varnames <- c("IDSTUD","TOTWGT","female","books","lang","ASMMAT")
##D # read files using indicator dataset
##D bifieobj2 <- BIFIEsurvey::load.BIFIEdata.files( files.imp, wgt="TOTWGT",
##D                   file.wgtrep=file.wgtrep, file.ind=file.ind, type="Rdata",
##D                   varnames=varnames)
##D summary(bifieobj2)
##D 
##D # read files without indicator dataset
##D bifieobj3 <- BIFIEsurvey::load.BIFIEdata.files( files.imp, wgt="TOTWGT",
##D                 file.wgtrep=file.wgtrep, type="Rdata", varnames=varnames)
##D summary(bifieobj3)
##D 
##D # compare some descriptive statistics
##D res2 <- BIFIEsurvey::BIFIE.univar( bifieobj2, vars=c("books", "ASMMAT", "lang") )
##D res3 <- BIFIEsurvey::BIFIE.univar( bifieobj3, vars=c("books", "ASMMAT", "lang") )
##D summary(res2)
##D summary(res3)
## End(Not run)



