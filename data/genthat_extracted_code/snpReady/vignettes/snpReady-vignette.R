## ------------------------------------------------------------------------
library(snpReady)
geno <- read.table("http://italo-granato.github.io/geno.txt", header = TRUE, na.strings = "NA")
head(geno)
dim(geno)


## ---- echo = FALSE-------------------------------------------------------
tmp <- data.frame(sample = geno$sample,
                  marker = geno$marker,
                  alleles = paste(geno$allele.1, geno$allele.2, sep = ""), stringsAsFactors = F)
library(reshape2)
x <- acast(data = tmp, sample ~ marker, value.var = "alleles")
x[x == "NANA"] <- NA

## ------------------------------------------------------------------------
x[1:10,1:5]

## ------------------------------------------------------------------------
geno.ready <- raw.data(data = as.matrix(geno), frame = "long", base = TRUE, sweep.sample = 0.5, call.rate = 0.95, maf = 0.10, imput = FALSE)
M <- geno.ready$M.clean
M[1:10,1:5]

## ------------------------------------------------------------------------
geno.ready$report

## ------------------------------------------------------------------------
geno.ready2 <- raw.data(data = as.matrix(geno), frame = "long", base = TRUE, sweep.sample = 0.5, call.rate = 0.95, maf = 0.10, imput = TRUE, imput.type = "wright", outfile = "012")
Mwrth <- geno.ready2$M.clean
Mwrth[1:10,1:5]

## ------------------------------------------------------------------------
geno.readySTR <- raw.data(data = as.matrix(geno), frame = "long", base = TRUE, sweep.sample = 0.5, call.rate = 0.95, maf = 0.10, imput = FALSE, outfile = "structure")
Mstr <- geno.readySTR$M.clean
Mstr[1:10,1:5]

## ------------------------------------------------------------------------
G <- G.matrix(M = Mwrth, method = "VanRaden", format = "wide") 
Ga <- G$Ga
Ga[1:5,1:5]

Gd <- G$Gd
Gd[1:5,1:5]


## ------------------------------------------------------------------------
G <- G.matrix(M = Mwrth, method = "UAR", format = "wide") 
G[1:5,1:5]

## ------------------------------------------------------------------------
dim(G)

## ------------------------------------------------------------------------
G <- G.matrix(M = Mwrth, method = "UAR", format = "long") 
head(G)

## ------------------------------------------------------------------------
pop.gen <- popgen(M = Mwrth)
head(pop.gen$whole$Markers)
head(pop.gen$whole$Genotypes)
head(pop.gen$whole$Population)
head(pop.gen$whole$Variability)

## ------------------------------------------------------------------------
subgroups <- as.matrix(c(rep("HNE", 10), rep("LNE", 52)))
pop.gen <- popgen(M = Mwrth, subgroups = subgroups)

## ------------------------------------------------------------------------
head(pop.gen$bygroup$HNE$Markers)
head(pop.gen$bygroup$HNE$Genotypes)

## ------------------------------------------------------------------------
head(pop.gen$bygroup$LNE$Markers)
head(pop.gen$bygroup$LNE$Genotypes)

## ------------------------------------------------------------------------
head(pop.gen$bygroup$HNE$exclusive)
head(pop.gen$bygroup$HNE$fixed)

## ------------------------------------------------------------------------
head(pop.gen$bygroup$LNE$exclusive)
head(pop.gen$bygroup$LNE$fixed)

