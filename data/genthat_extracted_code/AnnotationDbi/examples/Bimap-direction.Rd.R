library(AnnotationDbi)


### Name: Bimap-direction
### Title: Methods for getting/setting the direction of a Bimap object, and
###   undirected methods for getting/counting/setting its keys
### Aliases: Bimap-direction direction direction,FlatBimap-method
###   direction,AnnDbBimap-method direction<- direction<-,FlatBimap-method
###   direction<-,AnnDbBimap-method direction<-,AnnDbMap-method revmap
###   revmap,Bimap-method revmap,AnnDbBimap-method
###   revmap,environment-method revmap,list-method Lkeys
###   Lkeys,FlatBimap-method Lkeys,AnnDbBimap-method
###   Lkeys,ProbeAnnDbBimap-method Lkeys,ProbeAnnDbMap-method
###   Lkeys,ProbeGo3AnnDbBimap-method Lkeys,ProbeIpiAnnDbMap-method Rkeys
###   Rkeys,FlatBimap-method Rkeys,AnnDbBimap-method
###   Rkeys,Go3AnnDbBimap-method Rkeys,AnnDbMap-method Llength
###   Llength,Bimap-method Llength,AnnDbBimap-method
###   Llength,ProbeAnnDbBimap-method Llength,ProbeAnnDbMap-method
###   Llength,ProbeGo3AnnDbBimap-method Llength,ProbeIpiAnnDbMap-method
###   Rlength Rlength,Bimap-method Rlength,AnnDbBimap-method
###   Rlength,Go3AnnDbBimap-method Rlength,AnnDbMap-method mappedLkeys
###   mappedLkeys,FlatBimap-method mappedLkeys,AnnDbBimap-method
###   mappedLkeys,Go3AnnDbBimap-method mappedLkeys,AgiAnnDbMap-method
###   mappedRkeys mappedRkeys,FlatBimap-method
###   mappedRkeys,AnnDbBimap-method mappedRkeys,Go3AnnDbBimap-method
###   mappedRkeys,AnnDbMap-method count.mappedLkeys
###   count.mappedLkeys,Bimap-method count.mappedLkeys,AnnDbBimap-method
###   count.mappedLkeys,Go3AnnDbBimap-method
###   count.mappedLkeys,AgiAnnDbMap-method count.mappedRkeys
###   count.mappedRkeys,Bimap-method count.mappedRkeys,AnnDbBimap-method
###   count.mappedRkeys,Go3AnnDbBimap-method
###   count.mappedRkeys,AnnDbMap-method Lkeys<- Lkeys<-,FlatBimap-method
###   Lkeys<-,AnnDbBimap-method Rkeys<- Rkeys<-,FlatBimap-method
###   Rkeys<-,AnnDbBimap-method subset,Bimap-method
###   subset,AnnDbBimap-method
### Keywords: methods

### ** Examples

  library(hgu95av2.db)
  ls(2)
  x <- hgu95av2GO
  x
  summary(x)
  direction(x)

  length(x)
  Llength(x)
  Rlength(x)

  keys(x)[1:4]
  Lkeys(x)[1:4]
  Rkeys(x)[1:4]

  count.mappedkeys(x)
  count.mappedLkeys(x)
  count.mappedRkeys(x)

  mappedkeys(x)[1:4]
  mappedLkeys(x)[1:4]
  mappedRkeys(x)[1:4]

  y <- revmap(x)
  y
  summary(y)
  direction(y)

  length(y)
  Llength(y)
  Rlength(y)

  keys(y)[1:4]
  Lkeys(y)[1:4]
  Rkeys(y)[1:4]

  ## etc...

  ## Get rid of all unmapped keys (left and right)
  z <- subset(y, Lkeys=mappedLkeys(y), Rkeys=mappedRkeys(y))




