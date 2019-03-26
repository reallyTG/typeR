library(AnnotationDbi)


### Name: Bimap-toTable
### Title: Methods for manipulating a Bimap object in a data-frame style
### Aliases: Bimap-toTable toTable toTable,FlatBimap-method
###   toTable,Bimap-method as.data.frame,Bimap-method as.data.frame.Bimap
###   nrow nrow,Bimap-method nrow,FlatBimap-method nrow,AnnDbTable-method
###   nrow,AnnDbBimap-method nrow,Go3AnnDbBimap-method ncol
###   ncol,Bimap-method dim,Bimap-method head,FlatBimap-method
###   tail,FlatBimap-method links links,Bimap-method links,FlatBimap-method
###   links,AnnDbBimap-method links,Go3AnnDbBimap-method count.links
###   count.links,Bimap-method count.links,Go3AnnDbBimap-method nhit
###   nhit,Bimap-method nhit,environment-method nhit,list-method colnames
###   colnames,FlatBimap-method colnames,AnnDbBimap-method colmetanames
###   colmetanames,FlatBimap-method colmetanames,AnnDbBimap-method Lkeyname
###   Lkeyname,Bimap-method Lkeyname,AnnDbBimap-method Rkeyname
###   Rkeyname,Bimap-method Rkeyname,AnnDbBimap-method keyname
###   keyname,Bimap-method tagname tagname,Bimap-method
###   tagname,AnnDbBimap-method Rattribnames Rattribnames,Bimap-method
###   Rattribnames,AnnDbBimap-method Rattribnames<-
###   Rattribnames<-,FlatBimap-method Rattribnames<-,AnnDbBimap-method
###   Rattribnames<-,Go3AnnDbBimap-method
### Keywords: methods

### ** Examples

  library(GO.db)
  x <- GOSYNONYM
  x
  toTable(x)[1:4, ]
  toTable(x["GO:0007322"])
  links(x)[1:4, ]
  links(x["GO:0007322"])

  nrow(x)
  ncol(x)
  dim(x)
  colnames(x)
  colmetanames(x)
  Lkeyname(x)
  Rkeyname(x)
  tagname(x)
  Rattribnames(x)

  links(x)[1:4, ]
  count.links(x)

  y <- GOBPCHILDREN
  nhy <- nhit(y) # 'nhy' is a named integer vector
  identical(names(nhy), keys(y)) # TRUE
  table(nhy)
  sum(nhy == 0) # number of GO IDs with no children
  names(nhy)[nhy == max(nhy)] # the GO ID(s) with the most direct children

  ## Some sanity check
  sum(nhy) == count.links(y) # TRUE

  ## Changing the right attributes of the GOSYNONYM map (advanced
  ## users only)
  class(x) # GOTermsAnnDbBimap
  as.list(x)[1:3]
  colnames(x)
  colmetanames(x)
  tagname(x) # untagged map
  Rattribnames(x)
  Rattribnames(x) <- Rattribnames(x)[3:1]
  colnames(x)
  class(x) # AnnDbBimap
  as.list(x)[1:3]



