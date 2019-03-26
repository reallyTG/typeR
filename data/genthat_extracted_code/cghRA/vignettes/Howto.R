### R code from vignette source 'Howto.Rtex'

###################################################
### code chunk number 1: Howto.Rtex:125-132 (eval = FALSE)
###################################################
##   # Parse an Agilent TDT file
##   design <- Agilent.design(
##     file = "014950_D_DNABack_BCLeft_20111015.txt",
##     organism = "Human",
##     assembly = "GRCh37",
##     chromosomes = c(1:22, "X", "Y")
##   )


###################################################
### code chunk number 2: Howto.Rtex:135-137 (eval = FALSE)
###################################################
##   # Export as a cghRA-compliant file
##   saveRDT(design, file="design.rdt")


###################################################
### code chunk number 3: Howto.Rtex:182-189 (eval = FALSE)
###################################################
##   # Parse a manually edited ADF file
##   design <- custom.design(
##     file = "A-MEXP-1841.adf.csv",
##     organism = "Human",
##     assembly = "hg18",
##     chromosomes = c(1:22, "X", "Y")
##   )


###################################################
### code chunk number 4: Howto.Rtex:192-194 (eval = FALSE)
###################################################
##   # Export as a cghRA-compliant file
##   saveRDT(design, file="design.rdt")


###################################################
### code chunk number 5: Howto.Rtex:205-210 (eval = FALSE)
###################################################
##   # Import file
##   rawDesign <- read.table(
##     file="A-MEXP-1841.adf.txt", sep="\t", skip=18,
##     header=TRUE, quote=NULL, stringsAsFactors=FALSE
##   )


###################################################
### code chunk number 6: Howto.Rtex:213-218 (eval = FALSE)
###################################################
##   # Split coordinates
##   coords <- rawDesign$"Reporter.Database.Entry.chromosome_coordinate.unknown."
##   rawDesign$chrom <- sub("^chr(.+):([0-9]+)-([0-9]+)$", "\\1", coords)
##   rawDesign$start <- sub("^chr(.+):([0-9]+)-([0-9]+)$", "\\2", coords)
##   rawDesign$end <- sub("^chr(.+):([0-9]+)-([0-9]+)$", "\\3", coords)


###################################################
### code chunk number 7: Howto.Rtex:221-225 (eval = FALSE)
###################################################
##   # Rebuild FeatureNum
##   row <- rawDesign$Row
##   col <- rawDesign$Column
##   rawDesign$FeatureNum <- (row - 1L) * max(col) + col


###################################################
### code chunk number 8: Howto.Rtex:228-243 (eval = FALSE)
###################################################
##   # Build design
##   design <- cghRA.design(
##     name = rawDesign$Reporter.Name,
##     chrom = rawDesign$chrom,
##     strand = NA,
##     start = as.integer(rawDesign$start),
##     end = as.integer(rawDesign$end),
##     id = rawDesign$FeatureNum,
##     row = rawDesign$Row,
##     col = rawDesign$Column,
##     .name = "Agilent 014950",
##     .organism = "Human",
##     .assembly = "hg18",
##     .chromosomes = c(1:22, "X", "Y")
##   )


###################################################
### code chunk number 9: Howto.Rtex:246-248 (eval = FALSE)
###################################################
##   # Export as a cghRA-compliant file
##   saveRDT(design, file="design.rdt")


###################################################
### code chunk number 10: Howto.Rtex:257-300 (eval = FALSE)
###################################################
##   ADF.design <- function(
##     file,
##     name = "Custom ADF file",
##     organism = as.character(NA),
##     assembly = as.character(NA),
##     chromosomes = NULL,
##     ...
##   ) {
##     # Import file
##     rawDesign <- read.table(
##       file=file, sep="\t", skip=18,
##       header=TRUE, quote=NULL, stringsAsFactors=FALSE
##     )
##     
##     # Split coordinates
##     coords <- rawDesign$"Reporter.Database.Entry.chromosome_coordinate.unknown."
##     rawDesign$chrom <- sub("^chr(.+):([0-9]+)-([0-9]+)$", "\\1", coords)
##     rawDesign$start <- sub("^chr(.+):([0-9]+)-([0-9]+)$", "\\2", coords)
##     rawDesign$end <- sub("^chr(.+):([0-9]+)-([0-9]+)$", "\\3", coords)
##     
##     # Rebuild FeatureNum
##     row <- rawDesign$Row
##     col <- rawDesign$Column
##     rawDesign$FeatureNum <- (row - 1L) * max(col) + col
##     
##     # Build design
##     design <- cghRA.design(
##       name = rawDesign$Reporter.Name,
##       chrom = rawDesign$chrom,
##       strand = NA,
##       start = as.integer(rawDesign$start),
##       end = as.integer(rawDesign$end),
##       id = rawDesign$FeatureNum,
##       row = rawDesign$Row,
##       col = rawDesign$Column,
##       .name = name,
##       .organism = organism,
##       .assembly = assembly,
##       .chromosomes = chromosomes
##     )
##     
##     return(design)
##   }


###################################################
### code chunk number 11: Howto.Rtex:309-316 (eval = FALSE)
###################################################
##   design <- ADF.design(
##     file = "A-MEXP-1841.adf.txt",
##     name = "Agilent 014950",
##     organism = "Human",
##     assembly = "hg18",
##     chromosomes = c(1:22, "X", "Y")
##   )


###################################################
### code chunk number 12: Howto.Rtex:332-334 (eval = FALSE)
###################################################
##   # On Windows
##   blatInstall(blat="blat.exe", cygwin="cygwin1.dll")


###################################################
### code chunk number 13: Howto.Rtex:337-339 (eval = FALSE)
###################################################
##   # On Linux or MacOS
##   blatInstall(blat="blat")


###################################################
### code chunk number 14: Howto.Rtex:362-364 (eval = FALSE)
###################################################
##   # Import the design we previously built
##   design <- readRDT(file="design.rdt")


###################################################
### code chunk number 15: Howto.Rtex:367-372 (eval = FALSE)
###################################################
##   # Apply remapping
##   design$remap(
##     probeFile = "014950_D_Fasta_20111015.txt",
##     chromFiles = dir("hg38", full.names=TRUE)
##   )


###################################################
### code chunk number 16: Howto.Rtex:375-377 (eval = FALSE)
###################################################
##   # Update assembly name
##   design$assembly <- "GRCh38"


###################################################
### code chunk number 17: Howto.Rtex:380-382 (eval = FALSE)
###################################################
##   # Export the remapped design
##   saveRDT(design, file="design_hg38.rdt")


###################################################
### code chunk number 18: Howto.Rtex:403-405 (eval = FALSE)
###################################################
##   # Import the previously remapped design
##   design <- readRDT(file="design_hg38.rdt")


###################################################
### code chunk number 19: Howto.Rtex:408-413 (eval = FALSE)
###################################################
##   # Apply WACA bias computation
##   design$bias(
##     chromFiles = dir("hg38", full.names=TRUE),
##     fragSites = c(AluI="AG|CT", RsaI="GT|AC")
##   )


###################################################
### code chunk number 20: Howto.Rtex:416-418 (eval = FALSE)
###################################################
##   # Export the remapped / WACA compliant design
##   saveRDT(design, file="design_hg38_WACA.rdt")


###################################################
### code chunk number 21: Howto.Rtex:428-430 (eval = FALSE)
###################################################
##   # Import a cytoband file to use for split
##   bands <- readRDT(file="GRCh37.UCSC_bands.rdt")


###################################################
### code chunk number 22: Howto.Rtex:433-435 (eval = FALSE)
###################################################
##   # Import an annotation file to arm-split
##   genes <- readRDT(file="GRCh37.NCBI_genes.rdt")


###################################################
### code chunk number 23: Howto.Rtex:438-440 (eval = FALSE)
###################################################
##   # Add arms
##   genes$addArms(bands)


###################################################
### code chunk number 24: Howto.Rtex:443-445 (eval = FALSE)
###################################################
##   # Save as RDT with a distinct name
##   saveRDT(genes, file="GRCh37.arm.NCBI_genes.rdt")


###################################################
### code chunk number 25: Howto.Rtex:457-459 (eval = FALSE)
###################################################
##   # Import the previously remapped / WACA compliant design
##   design <- readRDT(file="design_hg38_WACA.rdt")


###################################################
### code chunk number 26: Howto.Rtex:462-464 (eval = FALSE)
###################################################
##   # Import the cytoband annotation
##   bands <- readRDT(file="GRCh38.UCSC_bands.rdt")


###################################################
### code chunk number 27: Howto.Rtex:467-469 (eval = FALSE)
###################################################
##   # Add arm information
##   design$addArms(bands)


###################################################
### code chunk number 28: Howto.Rtex:472-474 (eval = FALSE)
###################################################
##   # Export the remapped / WACA compliant design
##   saveRDT(design, file="design_hg38_WACA_arm.rdt")


###################################################
### code chunk number 29: Howto.Rtex:558-563 (eval = FALSE)
###################################################
##   # Import file
##   rawFile <- read.table(
##     file="DLBCL_Feb2016_CHB02048.txt", sep="\t", skip=9,
##     header=TRUE, quote=NULL, stringsAsFactors=FALSE
##   )


###################################################
### code chunk number 30: Howto.Rtex:566-568 (eval = FALSE)
###################################################
##   # Select columns
##   rawFile <- rawFile[, c(2, 16, 53, 54, 57:64) ]


###################################################
### code chunk number 31: Howto.Rtex:571-575 (eval = FALSE)
###################################################
##   # Rename columns
##   colnames(rawFile)[ colnames(rawFile) == "FeatureNum" ] <- "id"
##   colnames(rawFile)[ colnames(rawFile) == "LogRatio" ] <- "logRatio"
##   colnames(rawFile)[3:12] <- sprintf("flag_%s", colnames(rawFile)[3:12])


###################################################
### code chunk number 32: Howto.Rtex:578-583 (eval = FALSE)
###################################################
##   # Build probes
##   probes <- cghRA.probes(
##     rawFile,
##     .name = "CHB02048"
##   )


###################################################
### code chunk number 33: Howto.Rtex:586-588 (eval = FALSE)
###################################################
##   # Export as a cghRA-compliant file
##   saveRDT(probes, file="DLBCL_Feb2016_CHB02048.probes.rdt")


###################################################
### code chunk number 34: Howto.Rtex:597-630 (eval = FALSE)
###################################################
##   example.probes <- function(
##     file,
##     columns = NULL,
##     ...
##   ) {
##     # Import file
##     rawFile <- read.table(
##       file=file, sep="\t", skip=9,
##       header=TRUE, quote=NULL, stringsAsFactors=FALSE
##     )
##     
##     # Select columns
##     rawFile <- rawFile[, c(2, 16, 53, 54, 57:64) ]
##     
##     # Rename columns
##     colnames(rawFile)[ colnames(rawFile) == "FeatureNum" ] <- "id"
##     colnames(rawFile)[ colnames(rawFile) == "LogRatio" ] <- "logRatio"
##      
##     # Rename only flag columns mentioned in the interface
##     if(length(columns) > 0L) {
##       for(i in 1:length(columns)) {
##         colnames(dat)[ colnames(dat) == columns[i] ] <- names(columns)[i]
##       }
##     }
##     
##     # Build probes
##     probes <- cghRA.probes(
##       rawFile,
##       .name = basename(file)
##     )
##     
##     return(probes)
##   }


###################################################
### code chunk number 35: Howto.Rtex:696-697 (eval = FALSE)
###################################################
##   process.default("segmentArgs", "fastest")


###################################################
### code chunk number 36: Howto.Rtex:724-726 (eval = FALSE)
###################################################
##   regions <- readRDT(file="DLBCL_Feb2016_CHB02048.regions.rdt")
##   regions$model.test()


###################################################
### code chunk number 37: Howto.Rtex:731-733 (eval = FALSE)
###################################################
##   regions$model.auto()
##   regions$model.auto(minWidth=0.5, maxWidth=0.7)


###################################################
### code chunk number 38: Howto.Rtex:840-843 (eval = FALSE)
###################################################
##   # Import files to process
##   bands <- readRDT("GRCh37.UCSC_bands.rdt")
##   regions <- readRDT("DLBCL_Feb2016_CHB02048.copies.rdt")


###################################################
### code chunk number 39: Howto.Rtex:846-848 (eval = FALSE)
###################################################
##   # Before annotation
##   print(regions$extract(1:3))


###################################################
### code chunk number 40: Howto.Rtex:851-857 (eval = FALSE)
###################################################
##   # Annotate
##   regions$cross(
##     annotation = bands,
##     colname = "UCSC banding",
##     type = "cytoband"
##   )


###################################################
### code chunk number 41: Howto.Rtex:860-862 (eval = FALSE)
###################################################
##   # After annotation
##   print(regions$extract(1:3))


###################################################
### code chunk number 42: Howto.Rtex:889-892 (eval = FALSE)
###################################################
##   # Import files to process
##   genes <- readRDT("GRCh37.NCBI_genes.rdt")
##   regions <- readRDT("DLBCL_Feb2016_CHB02048.copies.rdt")


###################################################
### code chunk number 43: Howto.Rtex:895-897 (eval = FALSE)
###################################################
##   # Before annotation
##   print(regions$extract(1:3))


###################################################
### code chunk number 44: Howto.Rtex:900-906 (eval = FALSE)
###################################################
##   # Annotate using HGNC symbols
##   regions$cross(
##     annotation = genes,
##     colname = "NCBI gene symbols",
##     type = "name"
##   )


###################################################
### code chunk number 45: Howto.Rtex:909-915 (eval = FALSE)
###################################################
##   # Annotate using GeneID
##   regions$cross(
##     annotation = genes,
##     colname = "NCBI gene IDs",
##     type = "GeneID"
##   )


###################################################
### code chunk number 46: Howto.Rtex:918-920 (eval = FALSE)
###################################################
##   # After annotation
##   print(regions$extract(1:3))


###################################################
### code chunk number 47: Howto.Rtex:949-953 (eval = FALSE)
###################################################
##   # Import files to process
##   dgv <- readRDT("GRCh37.DGV_supp.rdt")
##   design <- readRDT(file="design.rdt")
##   target <- readRDT(file="DLBCL_Feb2016_CHB02048.copies.rdt")


###################################################
### code chunk number 48: Howto.Rtex:956-958 (eval = FALSE)
###################################################
##   # Remap the polymorphism bank
##   dgvMap <- map2design(dgv, design)


###################################################
### code chunk number 49: Howto.Rtex:961-964 (eval = FALSE)
###################################################
##   # Compute cnvScore for a sample
##   sampleMap <- map2design(target, design)
##   score <- cnvScore(sampleMap, dgvMap)


###################################################
### code chunk number 50: Howto.Rtex:967-970 (eval = FALSE)
###################################################
##   # Add cnvScore in sample table
##   target$addColumn(content=score, name="cnvScore")
##   print(target)


###################################################
### code chunk number 51: Howto.Rtex:973-976 (eval = FALSE)
###################################################
##   # Filter using cnvScore
##   target$rowOrder(which(target$extract(,"cnvScore") < 1))
##   print(target)


###################################################
### code chunk number 52: Howto.Rtex:1001-1004 (eval = FALSE)
###################################################
##   object <- readRDT(file="DLBCL_Feb2016_CHB02048.copies.rdt")
##   content <- object$extract()
##   write.csv(content, file="DLBCL_Feb2016_CHB02048.copies.csv")


###################################################
### code chunk number 53: Howto.Rtex:1048-1051 (eval = FALSE)
###################################################
##   # Aggregate sample files as a series object
##   files <- dir(pattern=".copies.rdt$")
##   series <- cghRA.series(files, .name="cghRA vignette")


###################################################
### code chunk number 54: Howto.Rtex:1054-1057 (eval = FALSE)
###################################################
##   # Produce and export a copy-number matrix
##   mtx <- series$parallelize(value="copies")
##   write.csv(mtx, file="CN_matrix.csv")


###################################################
### code chunk number 55: Howto.Rtex:1060-1066 (eval = FALSE)
###################################################
##   # Produce and export a penetrance track (deletion)
##   pen <- series$penetrance(
##     value = "copies",
##     states = list(deletion=c(-Inf, -0.5))
##   )
##   saveRDT(pen$del, file="Penetrance_del.rdt")


###################################################
### code chunk number 56: Howto.Rtex:1069-1075 (eval = FALSE)
###################################################
##   # Produce and export an altered segment pool
##   pool <- series$pool(
##     value = "copies",
##     states = list(deletion=c(-Inf, -0.5), gain=c(0.5, Inf))
##   )
##   saveRDT(pool, file="Segment_pool.rdt")


###################################################
### code chunk number 57: Howto.Rtex:1106-1109 (eval = FALSE)
###################################################
##   # Aggregate sample files as a series object
##   files <- dir(pattern=".copies.rdt$")
##   series <- cghRA.series(files, .name="cghRA vignette")


###################################################
### code chunk number 58: Howto.Rtex:1112-1118 (eval = FALSE)
###################################################
##   # Produce and export STEPS (deletion)
##   steps <- series$STEPS(
##     value = "copies",
##     states = list(deletion=c(-Inf, 0))
##   )
##   saveRDT(steps$del, file="STEPS_del.rdt")


###################################################
### code chunk number 59: Howto.Rtex:1121-1127 (eval = FALSE)
###################################################
##   # Produce and export SRA (deletion)
##   sra <- series$SRA(
##     value = "copies",
##     states = list(deletion=c(-Inf, 0))
##   )
##   saveRDT(sra$del, file="SRA_del.rdt")


###################################################
### code chunk number 60: Howto.Rtex:1130-1136 (eval = FALSE)
###################################################
##   # Produce and export LRA (deletion)
##   lra <- series$LRA(
##     value = "copies",
##     states = list(deletion=c(-Inf, 0))
##   )
##   saveRDT(lra$del, file="LRA_del.rdt")


###################################################
### code chunk number 61: Howto.Rtex:1178-1181 (eval = FALSE)
###################################################
##   # Import some data tracks into R memory
##   design <- readRDT(file="design.rdt")
##   sample <- readRDT(file="DLBCL_Feb2016_CHB05212.copies.rdt")


###################################################
### code chunk number 62: Howto.Rtex:1184-1186 (eval = FALSE)
###################################################
##   # Create an empty drawable list
##   dl <- drawable.list()


###################################################
### code chunk number 63: Howto.Rtex:1189-1192 (eval = FALSE)
###################################################
##   # Bind tracks from R memory
##   dl$add(file=NA, track=design)
##   dl$add(file=NA, track=sample)


###################################################
### code chunk number 64: Howto.Rtex:1195-1197 (eval = FALSE)
###################################################
##   # Bind tracks from file
##   dl$add(file="GRCh37.NCBI_genes.rdt")


###################################################
### code chunk number 65: Howto.Rtex:1200-1203 (eval = FALSE)
###################################################
##   # Or use the interactive interface
##   dl$fix.files()
##   dl <- tk.tracks()


###################################################
### code chunk number 66: Howto.Rtex:1208-1210 (eval = FALSE)
###################################################
##   # Visualize a region
##   browsePlot(dl, chrom=9, start=19.18e6, end=23.76e6)


###################################################
### code chunk number 67: Howto.Rtex:1215-1219 (eval = FALSE)
###################################################
##   # Export into a PNG file
##   png("export.png", width=800, height=600, res=100)
##   browsePlot(dl, chrom=9, start=19.18e6, end=23.76e6)
##   dev.off()


###################################################
### code chunk number 68: Howto.Rtex:1224-1226 (eval = FALSE)
###################################################
##   # Visualize the drawable list in Rgb
##   tk.browse(dl)


###################################################
### code chunk number 69: Howto.Rtex:1231-1233 (eval = FALSE)
###################################################
##   # Select a gene track stored in the list
##   genes <- dl$getByClasses("track.genes")[[1]]


###################################################
### code chunk number 70: Howto.Rtex:1236-1244 (eval = FALSE)
###################################################
##   # Visualize CDKN2A locus
##   locus <- genes$extract(expression(name == "CDKN2A"))
##   browsePlot(
##   	drawables = dl,
##   	chrom = locus$chrom,
##   	start = locus$start - 1e5,
##   	end = locus$end + 1e5
##   )


###################################################
### code chunk number 71: Howto.Rtex:1253-1255 (eval = FALSE)
###################################################
##   # Update parameters of an existing list using the interface
##   dl$fix.param()


###################################################
### code chunk number 72: Howto.Rtex:1258-1261 (eval = FALSE)
###################################################
##   # Update parameters of a specific track from the list
##   genes <- dl$getByClasses("track.genes")[[1]]
##   genes$setParam("colorVal", "#FF8888")


###################################################
### code chunk number 73: Howto.Rtex:1266-1269 (eval = FALSE)
###################################################
##   # Import a track and "copy" it
##   genes <- readRDT(file="GRCh37.NCBI_genes.rdt")
##   copy <- genes


###################################################
### code chunk number 74: Howto.Rtex:1272-1275 (eval = FALSE)
###################################################
##   # Add it to a drawable list
##   dl <- drawable.list()
##   dl$add(file=NA, track=genes)


###################################################
### code chunk number 75: Howto.Rtex:1278-1280 (eval = FALSE)
###################################################
##   # Update one of the copies
##   genes$setParam("ylab", "Updated gene list name")


###################################################
### code chunk number 76: Howto.Rtex:1283-1287 (eval = FALSE)
###################################################
##   # All copies were updated
##   print(genes$getParam("ylab"))
##   print(copy$getParam("ylab"))
##   print(dl$get(1)$getParam("ylab"))


###################################################
### code chunk number 77: Howto.Rtex:1294-1299 (eval = FALSE)
###################################################
##   # Create a drawable list
##   dl <- drawable.list()
##   dl$add("cghRA vignette penetrance (deletion).rdt")
##   dl$add("GRCh37.UCSC_bands.rdt")
##   dl$add("cghRA vignette penetrance (gain).rdt")


###################################################
### code chunk number 78: Howto.Rtex:1302-1306 (eval = FALSE)
###################################################
##   # Tune cytoband track parameters
##   bands <- dl$getByClasses("track.bands")[[1]]
##   bands$setParam("height", 0.5)
##   bands$setParam("label", FALSE)


###################################################
### code chunk number 79: Howto.Rtex:1309-1313 (eval = FALSE)
###################################################
##   # Produce penetrance summary plot
##   png("Penetrance summary.png", width=1600, height=800, res=100)
##   singlePlot(dl)
##   dev.off()


###################################################
### code chunk number 80: Howto.Rtex:1320-1323 (eval = FALSE)
###################################################
##   # Replace penetrance tracks with the pool track
##   dl$remove(c(1, 3))
##   dl$add("cghRA vignette pool (copies).rdt")


###################################################
### code chunk number 81: Howto.Rtex:1326-1330 (eval = FALSE)
###################################################
##   # Produce altered pool summary plot
##   png("Pool summary.png", width=1600, height=800, res=100)
##   singlePlot(dl)
##   dev.off()


