### R code from vignette source 'Howto.Rtex'

###################################################
### code chunk number 1: Howto.Rtex:24-25
###################################################
  library(Rgb)


###################################################
### code chunk number 2: Howto.Rtex:101-102 (eval = FALSE)
###################################################
##   help("Annotation")


###################################################
### code chunk number 3: Howto.Rtex:109-119 (eval = FALSE)
###################################################
##   download.file(
##     "http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/cytoBand.txt.gz",
##     destfile = "cytoBand.txt.gz"
##   )
##   track <- track.bands.UCSC(
##     file = "cytoBand.txt.gz",
##     .organism = "Human",
##     .assembly = "hg19"
##   )
##   saveRDT(track, file="cytoBands.rdt")


###################################################
### code chunk number 4: Howto.Rtex:124-125 (eval = FALSE)
###################################################
##   help("Annotation")


###################################################
### code chunk number 5: Howto.Rtex:138-141
###################################################
  file <- system.file("extdata/Cosmic_ATM.gtf.gz", package="Rgb")
  tt <- track.table.GTF(file)
  saveRDT(tt, file="custom.rdt")


###################################################
### code chunk number 6: Howto.Rtex:151-156
###################################################
  data(hsFeatures)
  class(hsGenes)
  head(hsGenes)
  tt <- track.table(hsGenes)
  saveRDT(tt, file="custom.rdt")


###################################################
### code chunk number 7: Howto.Rtex:163-169
###################################################
  track <- track.bam(
    bamPath = system.file("extdata/ATM.bam", package="Rgb"),
    .organism = "Human",
    .assembly = "hg19"
  )
  saveRDS(track, file="sequencing.rds")


###################################################
### code chunk number 8: Howto.Rtex:184-185 (eval = FALSE)
###################################################
##   tk.browse()


###################################################
### code chunk number 9: Howto.Rtex:208-213
###################################################
  data(hsFeatures)
  dl <- drawable.list()
  dl$add(file=NA, track=hsBands)
  dl$add(file=NA, track=track.table(hsGenes))
  browsePlot(dl, chrom="1", start=0, end=10e6)


###################################################
### code chunk number 10: Howto.Rtex:218-220 (eval = FALSE)
###################################################
##   dl$fix.files()
##   dl$fix.param()


###################################################
### code chunk number 11: Howto.Rtex:225-229
###################################################
  pdf("Rgb_tests.pdf")
  browsePlot(dl, chrom="1", start=0, end=10e6)
  browsePlot(dl, chrom="8", start=50e6, end=60e6)
  dev.off()


###################################################
### code chunk number 12: Howto.Rtex:243-249
###################################################
  data(hsFeatures)
  genes <- track.table(hsGenes)
  genes$slice(chrom="12", start=45e6, end=48e6)
  system.time(
    for(i in 1:10000) genes$slice("12", 25e6, 118e6)
  )


###################################################
### code chunk number 13: Howto.Rtex:256-262
###################################################
  data(hsFeatures)
  print(hsBands)
  genes <- track.table(hsGenes)
  hsBands$cross(genes, type="count")[1:5]
  hsBands$cross(genes, colname="genes", type="name", maxElements=5)
  print(hsBands)


###################################################
### code chunk number 14: Howto.Rtex:271-277
###################################################
  # Drawable data format
  data(hsFeatures)
  genes <- track.table(hsGenes)
  
  # Draw
  genes$draw(chrom="8", start=15e6, end=20e6)


###################################################
### code chunk number 15: Howto.Rtex:282-284
###################################################
  print(genes$defaultParams()[1:5])
  genes$draw(chrom="8", start=15e6, end=20e6, colorVal="blue")


###################################################
### code chunk number 16: Howto.Rtex:289-296
###################################################
  # Session persistent
  print(genes$defaultParams()[["mar"]])
  genes$setParam("mar", c(1.5, 5.0, 0.2, 1.0))
  genes$draw(chrom="8", start=15e6, end=20e6)
  
  # Save to file with custom parameters
  saveRDT(genes, file="genes.rdt")


###################################################
### code chunk number 17: Howto.Rtex:311-312 (eval = FALSE)
###################################################
##   help("setRefClass")


###################################################
### code chunk number 18: Howto.Rtex:316-319
###################################################
  data(hsFeatures)
  hsBands$fill(1:5, "stain", LETTERS[1:5])
  hsBands$getColNames()


###################################################
### code chunk number 19: Howto.Rtex:323-329
###################################################
  data(hsFeatures)
  a <- hsBands
  a$getColNames()
  a$delColumns("stain")
  hsBands$getColNames()
  hsCopy <- hsBands$copy()


###################################################
### code chunk number 20: Howto.Rtex:333-336
###################################################
  classDefinition <- getRefClass("sliceable")
  classDefinition$methods()
  classDefinition$help("draw")


###################################################
### code chunk number 21: Howto.Rtex:340-348
###################################################
  # All "track.table" objects are "drawable" objects
  class(hsBands)
  is(hsBands, "drawable")
  
  # Many "track.table" methods are defined by "drawable" class
  dw <- getRefClass("drawable")
  tl <- getRefClass("track.table")
  intersect(dw$methods(), tl$methods())


###################################################
### code chunk number 22: Howto.Rtex:379-384
###################################################
  library(Rgb)
  df <- data.frame(colA=letters[1:5], colB=5:1)
  rt <- refTable(df)
  rt <- refTable(colA=letters[1:5], colB=5:1)
  print(rt)


###################################################
### code chunk number 23: Howto.Rtex:389-396
###################################################
  library(Rgb)
  data(hsFeatures)
  rf <- refTable(hsGenes)
  rf$extract(1:5)
  rf$extract(c(TRUE, rep(FALSE, 799)))
  rf$extract(expression(name == "RDX"))
  rf$extract(expression(chrom == "X" & grepl("^AR", name)))


###################################################
### code chunk number 24: Howto.Rtex:401-402 (eval = FALSE)
###################################################
##   example(topic="refTable-class", package="Rgb")


###################################################
### code chunk number 25: Howto.Rtex:412-417
###################################################
  library(Rgb)
  tl <- track.table(name=letters[1:5], chrom=1:5, strand="+", start=1:5, end=2:6)
  df <- data.frame(chrom=1:5, strand="+", start=1:5, end=2:6)
  tl <- track.table(df, .makeNames=TRUE, .organism="Human", warn=FALSE)
  print(tl)


###################################################
### code chunk number 26: Howto.Rtex:429-432
###################################################
  library(Rgb)
  data(hsFeatures)
  hsBands$draw("1", 0, 150e6)


###################################################
### code chunk number 27: Howto.Rtex:435-438
###################################################
  hsBands$getParam("drawFun")
  hsBands$setParam("label", FALSE)
  hsBands$draw("1", 0, 150e6)


###################################################
### code chunk number 28: Howto.Rtex:445-449
###################################################
  library(Rgb)
  data(hsFeatures)
  hsBands$setParam("label", FALSE)
  hsBands$draw("1", 0, 150e6, label=TRUE)


###################################################
### code chunk number 29: Howto.Rtex:456-462
###################################################
  library(Rgb)
  data(hsFeatures)
  hsBands$getParam("drawFun")
  names(hsBands$defaultParams())
  hsBands$setParam("drawFun", "draw.points")
  names(hsBands$defaultParams())


###################################################
### code chunk number 30: Howto.Rtex:479-482
###################################################
  library(Rgb)
  system.file("extdata/ATM.bam", package="Rgb")
  system.file("extdata/ATM.bam.bai", package="Rgb")


###################################################
### code chunk number 31: Howto.Rtex:495-501
###################################################
  track <- track.bam(
    bamPath = system.file("extdata/ATM.bam", package="Rgb"),
    .organism = "Human",
    .assembly = "hg19"
  )
  saveRDS(track, file="ATM.rds")


###################################################
### code chunk number 32: Howto.Rtex:506-507 (eval = FALSE)
###################################################
##   tk.browse()


###################################################
### code chunk number 33: Howto.Rtex:520-526
###################################################
  track <- track.bands.UCSC(
    file = "cytoBand.txt.gz",
    .organism = "Human",
    .assembly = "hg19"
  )
  saveRDT(track, file="cytoBands.rdt")


###################################################
### code chunk number 34: Howto.Rtex:531-537
###################################################
  track <- track.exons.CCDS(
    file = "CCDS.current.txt",
    .organism = "Human",
    .assembly = "hg19"
  )
  saveRDT(track, file="exons.rdt")


###################################################
### code chunk number 35: Howto.Rtex:563-565
###################################################
  file <- system.file("extdata/Cosmic_ATM.gtf.gz", package="Rgb")
  track <- track.table.GTF(file, .organism="Human", .assembly="hg19")


###################################################
### code chunk number 36: Howto.Rtex:570-572
###################################################
  print(track)
  track$draw("11", 108.5e6, 108.6e6)


###################################################
### code chunk number 37: Howto.Rtex:577-578
###################################################
  track$draw("11", 108.5e6, 108.6e6, maxElements=100)


###################################################
### code chunk number 38: Howto.Rtex:583-585
###################################################
  track$setParam("maxElements", 100)
  track$draw("11", 108.5e6, 108.6e6)


###################################################
### code chunk number 39: Howto.Rtex:590-593
###################################################
  newNames <- track$extract(,"gene_id")
  track$fill(, "name", newNames)
  track$draw("11", 108.5e6, 108.6e6)


###################################################
### code chunk number 40: Howto.Rtex:598-600
###################################################
  track$name <- "COSMIC ATM"
  track$draw("11", 108.5e6, 108.6e6)


###################################################
### code chunk number 41: Howto.Rtex:605-606
###################################################
  saveRDT(track, file="COSMIC_ATM.rdt")


###################################################
### code chunk number 42: Howto.Rtex:621-629
###################################################
  dl <- drawable.list(
    files = c(
      "cytoBands.rdt",
      "ATM.rds",
      "exons.rdt",
      "COSMIC_ATM.rdt"
    )
  )


###################################################
### code chunk number 43: Howto.Rtex:634-636 (eval = FALSE)
###################################################
##   dl$fix.param()
##   dl$fix.files()


###################################################
### code chunk number 44: Howto.Rtex:641-643
###################################################
  print(dl)
  dl$getByNames("UCSC bands")


###################################################
### code chunk number 45: Howto.Rtex:648-650
###################################################
  target <- dl$getByNames("UCSC bands")[[1]]
  names(target$defaultParams())


###################################################
### code chunk number 46: Howto.Rtex:655-659
###################################################
  dl$getByNames("CCDS exons")[[1]]$setParam("height", 0.5)
  target <- dl$getByNames("ATM.bam")[[1]]
  target$setParam("maxRange", 8000)
  target$setParam("ylim", c(0, 50))


###################################################
### code chunk number 47: Howto.Rtex:664-665
###################################################
  browsePlot(dl, chrom="11", start=108225450, end=108225660)


###################################################
### code chunk number 48: Howto.Rtex:670-671 (eval = FALSE)
###################################################
##   tk.browse(dl)


###################################################
### code chunk number 49: Howto.Rtex:680-682
###################################################
  exons <- readRDT("exons.rdt")
  print(exons)


###################################################
### code chunk number 50: Howto.Rtex:687-689
###################################################
  loci <- exons$extract(expression(grep("^ATM ", transcript)))
  print(head(loci))


###################################################
### code chunk number 51: Howto.Rtex:694-697
###################################################
  exonTable <- exons$extract()
  print(head(exonTable))
  loci <- subset(exonTable, grepl("^ATM ", transcript))


###################################################
### code chunk number 52: Howto.Rtex:702-711 (eval = FALSE)
###################################################
##   pdf("ATM.pdf", width=12)
##   for(i in 1:nrow(loci)) {
##     browsePlot(dl,
##       chrom = loci[i,"chrom"],
##       start = loci[i,"start"] - 150,
##       end = loci[i,"end"] + 150
##     )
##   }
##   dev.off()


###################################################
### code chunk number 53: Howto.Rtex:740-752
###################################################
  gpl <- read.table(
    file = "GPL10855-34953.txt",
    sep = "\t",
    header = TRUE,
    stringsAsFactors = FALSE
  )
  gsm <- read.table(
    file = "GSM589609-38201.txt",
    sep = "\t",
    header = TRUE,
    stringsAsFactors = FALSE
  )


###################################################
### code chunk number 54: Howto.Rtex:757-759
###################################################
  head(gpl)
  head(gsm)


###################################################
### code chunk number 55: Howto.Rtex:764-766
###################################################
  nrow(gpl) == nrow(gsm)
  all(gpl$ID == gsm$ID_REF)


###################################################
### code chunk number 56: Howto.Rtex:771-782
###################################################
  cgh <- track.table(
    name = gpl$ID,
    chrom = gpl$RANGE_GB,
    start = as.integer(gpl$RANGE_START),
    end = as.integer(gpl$RANGE_END),
    strand = gpl$RANGE_STRAND,
    value = gsm$VALUE,
    .name = "GSM589609",
    .organism = "Arabidopsis thaliana",
    .assembly = "TAIR9"
  )


###################################################
### code chunk number 57: Howto.Rtex:787-788
###################################################
  cgh


###################################################
### code chunk number 58: Howto.Rtex:793-798
###################################################
  cgh$getLevels("chrom")
  cgh$chromosomes()
  cgh$setLevels("chrom", newLevels=c(1:5, "C", "M"))
  cgh$chromosomes()
  cgh


###################################################
### code chunk number 59: Howto.Rtex:805-806
###################################################
  cgh$draw(chrom="1", start=16125e3, end=16127e3)


###################################################
### code chunk number 60: Howto.Rtex:811-815 (eval = FALSE)
###################################################
##   help(draw.boxes)
##   help(draw.points)
##   help(draw.hist)
##   help(draw.bg)


###################################################
### code chunk number 61: Howto.Rtex:820-822
###################################################
  cgh$setParam("drawFun", "draw.points")
  cgh$draw(chrom="1", start=16125e3, end=16127e3)


###################################################
### code chunk number 62: Howto.Rtex:827-828
###################################################
  cgh$defaultParams()$ylim


###################################################
### code chunk number 63: Howto.Rtex:833-834
###################################################
  cgh$draw(chrom="1", start=16125e3, end=16127e3, ylim=c(0, 500))


###################################################
### code chunk number 64: Howto.Rtex:839-841
###################################################
  cgh$setParam("ylim", c(0, 500))
  cgh$draw(chrom="1", start=16125e3, end=16127e3)


###################################################
### code chunk number 65: Howto.Rtex:846-848
###################################################
  cgh$setParam("yaxt", "s")
  cgh$draw(chrom="1", start=16125e3, end=16127e3)


###################################################
### code chunk number 66: Howto.Rtex:853-854
###################################################
  saveRDT(cgh, file="GSM589609.rdt")


###################################################
### code chunk number 67: Howto.Rtex:871-877
###################################################
  tab <- read.table(
    file = "TAIR9_AGI_marker.data",
    sep = "\t",
    header = FALSE,
    stringsAsFactors = FALSE
  )


###################################################
### code chunk number 68: Howto.Rtex:882-892
###################################################
  mrk <- track.table(
    name = tab$V2,
    chrom = tab$V5,
    start = tab$V3,
    end = tab$V4,
    strand = NA,
    .name = "Genetic markers",
    .organism = "Arabidopsis thaliana",
    .assembly = "TAIR9"
  )


###################################################
### code chunk number 69: Howto.Rtex:897-900
###################################################
  mrk$setLevels("chrom", newLevels=c(1:5, "C", "M"))
  mrk$draw(chrom="1", start=16124e3, end=16130e3)
  saveRDT(mrk, file="GeneticMarkers.rdt")


###################################################
### code chunk number 70: Howto.Rtex:912-915
###################################################
  gtf <- read.gtf("TAIR9_GFF3_genes.gff")
  head(gtf)
  dim(gtf)


###################################################
### code chunk number 71: Howto.Rtex:920-921
###################################################
  table(gtf$feature)


###################################################
### code chunk number 72: Howto.Rtex:926-936
###################################################
  gtf <- read.gtf("TAIR9_GFF3_genes.gff", features="exon")
  trk <- track.table.GTF(
    file = "TAIR9_GFF3_genes.gff",
    name = "Exons",
    attr = "split",
    features = "exon",
    .organism = "Arabidopsis thaliana",
    .assembly = "TAIR9"
  )
  trk


###################################################
### code chunk number 73: Howto.Rtex:941-943
###################################################
  trk$delColumns(c("source","feature","score","frame"))
  trk


###################################################
### code chunk number 74: Howto.Rtex:948-949
###################################################
  trk$setLevels("chrom", c(1:5, "C", "M"))


###################################################
### code chunk number 75: Howto.Rtex:954-955
###################################################
  trk$draw(chrom="1", start=16150e3, end=16158e3)


###################################################
### code chunk number 76: Howto.Rtex:968-971
###################################################
  exn <- new("track.exons")
  exn$import(trk)
  exn


###################################################
### code chunk number 77: Howto.Rtex:976-979
###################################################
  exn$buildGroupSize("Parent", "exonCount")
  exn$buildGroupPosition("Parent", "exonNumber")
  exn


###################################################
### code chunk number 78: Howto.Rtex:984-986
###################################################
  newNames <- paste(exn$extract(,"Parent"), exn$extract(,"exonNumber"), sep="#")
  exn$fill(, "name", newNames)


###################################################
### code chunk number 79: Howto.Rtex:991-997
###################################################
  exn$setParam("groupBy", "Parent")
  exn$setParam("groupPosition", "exonNumber")
  exn$setParam("groupSize", "exonCount")

  exn$draw(chrom="1", start=16150e3, end=16158e3)
  saveRDT(exn, file="TAIR9 exons.rdt")


###################################################
### code chunk number 80: Howto.Rtex:1006-1011
###################################################
  dl <- drawable.list()
  dl$add(file="GeneticMarkers.rdt")
  dl$add(file="TAIR9 exons.rdt")
  dl$add(file="GSM589609.rdt")
  browsePlot(dl, chrom="1", start=16123e3, end=16158e3)


###################################################
### code chunk number 81: Howto.Rtex:1014-1015 (eval = FALSE)
###################################################
##   tk.browse(dl)


###################################################
### code chunk number 82: Howto.Rtex:1022-1028
###################################################
  gsm <- readRDT("GSM589609.rdt")
  exn <- readRDT("TAIR9 exons.rdt")
  gen <- gsm$extract(expression(which.max(value)), asObject=TRUE)
  gen$cross(exn, type="Parent", colname="gene")
  gen
  exn$extract(expression(Parent == gen$extract(,"gene")))


###################################################
### code chunk number 83: Howto.Rtex:1033-1037
###################################################
  atg <- exn$extract(expression(Parent == gen$extract(,"gene")), asObject=TRUE)
  atg$cross(gsm, type="count")
  atg$cross(gsm, type="count", colname="probeCount")
  atg


###################################################
### code chunk number 84: Howto.Rtex:1042-1055
###################################################
  atg$addColumn(
    content = rep(as.double(NA), atg$getRowCount()),
    name = "expr"
  )
  for(i in 1:atg$getRowCount()) {
    probes <- gsm$slice(
      chrom = atg$extract(i, "chrom"),
      start = atg$extract(i, "start"),
      end = atg$extract(i, "end")
    )
    atg$fill(i, "expr", mean(probes$value))
  }
  atg


###################################################
### code chunk number 85: Howto.Rtex:1060-1070
###################################################
  expr <- list()
  for(i in 1:atg$getRowCount()) {
    probes <- gsm$slice(
      chrom = atg$extract(i, "chrom"),
      start = atg$extract(i, "start"),
      end = atg$extract(i, "end")
    )
    expr[[i]] <- probes$value
  }
  boxplot(expr, varwidth=TRUE, log="y")


###################################################
### code chunk number 86: Howto.Rtex:1093-1105
###################################################
  # Really simple drawing function, just drawing lines
  draw.custom <- function(slice, start, end, ...) {
     draw.bg(start=start, end=end, ...)
  	segments(x0=slice$start, x1=slice$end, y0=0:1, y1=1:0)
  }
    
  # Edit a track to use it
  data(hsFeatures)
  hsBands$setParam("drawFun", "draw.custom")
  
  # Let's draw
  hsBands$draw("1", 0, 100e6)


###################################################
### code chunk number 87: Howto.Rtex:1118-1139
###################################################
  # Define a new class, just drawing red boxes
  setRefClass(
    Class = "track.custom",
    contains = "track.bands",
    methods = list(
      defaultParams = function(...) {
        params <- callSuper(...)
        params$colorVal <- "red"
        params$colorFun <- function(slice) NULL
        return(params)
      }
    )
  )
  
  # Class switch
  data(hsFeatures)
  obj <- new("track.custom")
  obj$import(hsBands)
  
  # Let's draw
  obj$draw("1", 0, 100e6)


###################################################
### code chunk number 88: Howto.Rtex:1158-1188
###################################################
  setRefClass(
    Class = "track.scale",
    contains = "drawable",
    methods = list(
      defaultParams = function(...) {
        # Define new class defaults
        params <- callSuper(...)
        params$col <- "lightblue"
        params$points <- 500L
        return(params)
      },
      draw = function(chrom, start=NA, end=NA, ...) {
        # Aggregate and prioritize drawing parameters
        argList <- callParams(chrom, start, end, ...)
        
        # Plot background, using drawing parameters
        do.call(what=draw.bg, args=argList)
        
        # Data points
        x <- seq(from=start, to=end, length.out=argList$points)
        y <- cos(x)
        
        # Plot, using drawing parameters
        lines(x=x, y=y, col=argList$col)
      }
    )
  )
  object <- new("track.scale")
  object$draw("11", 0, 10e6)
  object$defaultParams()


###################################################
### code chunk number 89: Howto.Rtex:1193-1208 (eval = FALSE)
###################################################
## defaultParams = function(...) {
##   # Get inherited defaults
##   params <- callSuper(...)
##   
##   # Get draw.bg defaults
##   form <- formals("draw.bg")
##   form <- form[ setdiff(names(form), c("start", "end", "...")) ]
##   for(fname in names(form)) params[[ fname ]] <- eval(form[[ fname ]])
##   
##   # Define new class defaults
##   params$col <- "lightblue"
##   params$points <- 500L
##   
##   return(params)
## }


###################################################
### code chunk number 90: Howto.Rtex:1217-1220
###################################################
  saveRDS(object, "custom.rds")
  dl <- drawable.list(files="custom.rds")
  browsePlot(dl, chrom="1", start=10e6, end=100e6)


